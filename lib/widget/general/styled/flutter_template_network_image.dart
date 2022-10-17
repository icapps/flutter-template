import 'dart:async';
import 'dart:typed_data';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_template/di/injectable.dart';
import 'package:flutter_template/util/cache/cache_controlling.dart';
import 'package:flutter_template/util/env/flavor_config.dart';
import 'package:icapps_architecture/icapps_architecture.dart';

class FlutterTemplateNetworkImage extends StatelessWidget {
  final String? url;
  final String? fallbackUrl;
  final BoxFit fit;
  final double? height;
  final double? width;
  final Duration? duration;

  const FlutterTemplateNetworkImage({
    required this.url,
    this.fallbackUrl,
    this.fit = BoxFit.cover,
    this.height,
    this.width,
    this.duration,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final url = this.url;
    final correctUrl = url == null || url.isEmpty ? fallbackUrl : url;
    if (correctUrl == null || correctUrl.isEmpty) {
      return SizedBox(
        height: height,
        width: width,
      );
    }
    return LayoutBuilder(
      builder: (context, constraints) {
        var imgWidth = width;
        var imgHeight = height;
        if (imgWidth == null || imgWidth == double.infinity) imgWidth = constraints.maxWidth;
        if (imgHeight == null || imgHeight == double.infinity) imgHeight = constraints.maxHeight;
        return SizedBox(
          height: imgHeight,
          width: imgWidth,
          child: _FlutterTemplateBetterNetworkImage(
            imageUrl: correctUrl,
            height: imgHeight,
            width: imgWidth,
            fit: fit,
            placeholder: Container(),
          ),
        );
      },
    );
  }
}

class _FlutterTemplateBetterNetworkImage extends StatefulWidget {
  final String? imageUrl;
  final BoxFit fit;
  final double? width;
  final double? height;
  final Widget placeholder;

  const _FlutterTemplateBetterNetworkImage({
    required this.imageUrl,
    required this.fit,
    required this.width,
    required this.height,
    required this.placeholder,
  });

  @override
  _FlutterTemplateBetterNetworkImageState createState() => _FlutterTemplateBetterNetworkImageState();
}

class _FlutterTemplateBetterNetworkImageState extends State<_FlutterTemplateBetterNetworkImage> {
  final _cacheController = getIt.get<CacheControlling>();

  var _isLoading = false;
  var _hasError = false;

  Uint8List? _image;

  Uint8List? get image => _image;

  bool get showPlaceholder => _hasError || _isLoading || _image == null;

  @override
  void initState() {
    super.initState();
    _getImage();
  }

  @override
  void didUpdateWidget(_FlutterTemplateBetterNetworkImage oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.imageUrl != widget.imageUrl) {
      _getImage();
    }
  }

  Future<void> _getImage() async {
    final originalUrl = widget.imageUrl;
    final widgetWidth = widget.width;
    final widgetHeight = widget.height;
    if (originalUrl == null) {
      setState(() => _hasError = true);
      return;
    }
    if (widgetWidth == double.infinity || widgetHeight == double.infinity || widgetWidth == null || widgetHeight == null) {
      logger.warning('IMAGE-ERROR: $originalUrl ($widgetWidth/$widgetHeight');
      setState(() => _hasError = true);
      return;
    }
    try {
      setState(() {
        _isLoading = true;
        _hasError = false;
      });
      final width = (widgetWidth * (FlavorConfig.instance.devicePixelRatio)).toInt();
      final height = (widgetHeight * (FlavorConfig.instance.devicePixelRatio)).toInt();
      final url = '$originalUrl?w=$width&h=$height';
      final cachedBytes = await _cacheController.getFileFromCache(url);
      if (!mounted) return;
      if (cachedBytes != null) {
        _image = cachedBytes;
        setState(() {
          _isLoading = false;
          _hasError = false;
        });
        return;
      }
      if (!mounted) return;
      final bytes = await _cacheController.downloadFileByBytes(originalUrl);

      final codec = await instantiateImageCodec(
        bytes,
        targetWidth: width >= height ? width : null,
        targetHeight: height > width ? height : null,
      );
      final frame = await codec.getNextFrame();
      final data = await frame.image.toByteData(format: ImageByteFormat.png);
      _image = data?.buffer.asUint8List();
      unawaited(_cacheImage(url));
    } catch (e, stack) {
      logger.error('Failed to parse image: $originalUrl', error: e, trace: stack);
      _hasError = true;
    } finally {
      _isLoading = false;
    }
    // ignore: invariant_booleans
    if (mounted) {
      setState(() {});
    }
  }

  Future<void> _cacheImage(String url) async {
    final img = _image;
    if (img == null) return;
    try {
      await _cacheController.putFile(url, img, fileExtension: 'png');
    } catch (e, stack) {
      logger.error('Failed to cache image: $url', error: e, trace: stack);
    }
  }

  @override
  Widget build(BuildContext context) {
    if (showPlaceholder) return widget.placeholder;
    final img = image;
    if (img == null) return widget.placeholder;
    return Image.memory(
      img,
      width: widget.width,
      height: widget.height,
      fit: widget.fit,
    );
  }
}

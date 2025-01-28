import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_template/widget/general/base_screen/base_screen_content.dart';
import 'package:flutter_template/widget/general/base_screen/base_screen_header.dart';
import 'package:flutter_template/widget/general/status_bar.dart';
import 'package:flutter_template/widget/library/flutter_template_progress_indicator.dart';
import 'package:flutter_template/widget/provider/data_provider_widget.dart';

class BaseScreen extends StatelessWidget {
  final bool isScrollable;
  final bool useSlivers;
  final bool showHeader;
  final bool isLoading;
  final bool hasBottomSafeSpace;
  final bool reversed;
  final int? itemCount;
  final Color? background;
  final String? title;
  final Widget? child;
  final EdgeInsets padding;
  final List<Widget> children;
  final List<Widget>? actions;
  final VoidCallback? onBackTapped;
  final AsyncCallback? onRefresh;
  final IndexedWidgetBuilder? itemBuilder;

  const BaseScreen({
    required this.children,
    this.reversed = false,
    this.actions,
    this.onRefresh,
    this.isLoading = false,
    this.hasBottomSafeSpace = true,
    this.onBackTapped,
    this.title,
    this.showHeader = true,
    this.isScrollable = false,
    this.useSlivers = false,
    this.padding = const EdgeInsets.all(16),
    this.background,
    super.key,
  })  : child = null,
        itemBuilder = null,
        itemCount = null;

  const BaseScreen.builder({
    required this.itemBuilder,
    required this.itemCount,
    this.reversed = false,
    this.actions,
    this.onRefresh,
    this.isLoading = false,
    this.hasBottomSafeSpace = true,
    this.onBackTapped,
    this.title,
    this.showHeader = true,
    this.padding = const EdgeInsets.all(16),
    this.background,
    super.key,
  })  : children = const [],
        child = null,
        useSlivers = false,
        isScrollable = true;

  const BaseScreen.slivers({
    required this.children,
    this.reversed = false,
    this.actions,
    this.onRefresh,
    this.hasBottomSafeSpace = true,
    this.onBackTapped,
    this.isLoading = false,
    this.title,
    this.showHeader = true,
    this.padding = const EdgeInsets.all(16),
    this.background,
    super.key,
  })  : child = null,
        useSlivers = true,
        isScrollable = true,
        itemBuilder = null,
        itemCount = null;

  const BaseScreen.child({
    required this.child,
    this.actions,
    this.onRefresh,
    this.isLoading = false,
    this.hasBottomSafeSpace = true,
    this.onBackTapped,
    this.title,
    this.showHeader = true,
    this.padding = const EdgeInsets.all(16),
    this.background,
    super.key,
  })  : children = const [],
        isScrollable = false,
        useSlivers = false,
        itemBuilder = null,
        itemCount = null,
        reversed = false;

  @override
  Widget build(BuildContext context) {
    return DataProviderWidget(
      childBuilder: (context, theme, localization) => StatusBar.dark(
        child: Scaffold(
          backgroundColor: background ?? theme.level1,
          body: GestureDetector(
            onTap: FocusManager.instance.primaryFocus?.unfocus,
            child: SafeArea(
              top: !showHeader,
              bottom: hasBottomSafeSpace,
              child: Column(
                children: [
                  if (showHeader) ...[
                    BaseScreenHeader(
                      title: title,
                      onBackTapped: onBackTapped,
                      trailingItems: actions ?? [],
                    ),
                  ],
                  Expanded(
                    child: Builder(
                      builder: (context) {
                        if (isLoading) {
                          return const Center(
                            child: FlutterTemplateProgressIndicator.dark(),
                          );
                        }

                        final content = BaseScreenContent(
                          isScrollable: isScrollable,
                          padding: padding,
                          useSlivers: useSlivers,
                          children: children,
                          child: child,
                          itemBuilder: itemBuilder,
                          itemCount: itemCount,
                          reversed: reversed,
                        );
                        if (onRefresh == null) return content;

                        return RefreshIndicator(
                          onRefresh: onRefresh!,
                          child: content,
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

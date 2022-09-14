import 'package:flutter/material.dart';
import 'package:flutter_template/navigator/route_names.dart';
import 'package:flutter_template/viewmodel/detail/detail_viewmodel.dart';
import 'package:flutter_template/widget/provider/provider_widget.dart';
import 'package:get_it/get_it.dart';

class DetailScreen extends StatefulWidget {
  static const String routeName = RouteNames.detailScreen;

  final String id;

  const DetailScreen({
    required this.id,
    Key? key,
  }) : super(key: key);

  @override
  DetailScreenState createState() => DetailScreenState();
}

class DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    return ProviderWidget<DetailViewModel>(
      create: () => GetIt.I()..init(widget.id),
      consumer: (context, viewModel, _) {
        return Scaffold(
          appBar: AppBar(),
          body: Center(
            child: Text(viewModel.id.toString()),
          ),
        );
      },
    );
  }
}

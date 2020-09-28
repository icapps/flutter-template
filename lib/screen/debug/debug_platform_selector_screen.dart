import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_template/cubit/global/global_cubit.dart';
import 'package:flutter_template/navigators/back_navigator.dart';
import 'package:flutter_template/util/locale/localization.dart';
import 'package:flutter_template/widget/debug/selector_item.dart';
import 'package:flutter_template/widget/general/styled/flutter_template_back_button.dart';

class DebugPlatformSelectorScreen extends StatelessWidget with BackNavigatorMixin {
  static const String routeName = 'debug_platform_selector';

  const DebugPlatformSelectorScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GlobalCubit, GlobalState>(
      cubit: BlocProvider.of<GlobalCubit>(context),
      buildWhen: (previous, current) => previous.targetPlatform != current.targetPlatform,
      builder: (context, state) {
        if (state is InitialGlobalState) {
          return buildContent(context, state.targetPlatform);
        } else {
          return buildContent(context, null); // Usually you will build the initial build here
        }
      },
    );
  }

  Widget buildContent(BuildContext context, TargetPlatform targetPlatform) {
    final localization = Localization.of(context);
    return Scaffold(
      appBar: AppBar(
        leading: FlutterTemplateBackButton.light(onClick: () => goBack(context)),
        title: const Text('Select a platform'),
      ),
      body: ListView(
        children: [
          SelectorItem(
            title: localization.generalLabelSystemDefault,
            onClick: context.bloc<GlobalCubit>().changePlatformToDefault,
            selected: targetPlatform == null,
          ),
          SelectorItem(
            title: localization.generalLabelAndroid,
            onClick: context.bloc<GlobalCubit>().changePlatformToAndroid,
            selected: targetPlatform == TargetPlatform.android,
          ),
          SelectorItem(
            title: localization.generalLabelIos,
            onClick: context.bloc<GlobalCubit>().changePlatformToIos,
            selected: targetPlatform == TargetPlatform.iOS,
          ),
        ],
      ),
    );
  }
}

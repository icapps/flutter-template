import 'package:flutter_template/util/platform/platform_util.dart';
import 'package:get/route_manager.dart';

class BasePage<T> extends GetPage<T> {
  BasePage({
    bool? showCupertinoParallax,
    Transition? transition,
    required super.name,
    required super.page,
    super.title,
    super.participatesInRootNavigator,
    super.gestureWidth,
    super.maintainState,
    super.curve,
    super.alignment,
    super.parameters,
    super.opaque,
    super.transitionDuration,
    super.popGesture,
    super.binding,
    super.bindings,
    super.customTransition,
    super.fullscreenDialog,
    super.children,
    super.middlewares,
    super.unknownRoute,
    super.arguments,
    super.preventDuplicates,
  }) : super(
          showCupertinoParallax: showCupertinoParallax ?? PlatformUtil.isIOS,
          transition: transition ?? (PlatformUtil.isDesktop ? Transition.noTransition : Transition.native),
        );
}

import 'package:get/route_manager.dart';

extension GetExtension on GetInterface {
  T parameterFromurl<T>(String routeName) =>
      parameters[routeName.replaceAll(':', '')] as T;
}

import 'package:get/route_manager.dart';

extension GetExtension on GetInterface {
  T parameterFromUrl<T>(String routeName) => parameters[routeName.replaceAll(':', '')] as T;
}

import 'package:icapps_architecture/icapps_architecture.dart';
import 'package:injectable/injectable.dart';

@injectable
class DetailViewModel with ChangeNotifierEx {
  String? _id;

  String? get id => _id;

  DetailViewModel();

  Future<void> init(String id) async {
    _id = id;
  }
}

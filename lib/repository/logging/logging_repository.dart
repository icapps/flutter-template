import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_template/repository/logging/base_logging_repository.dart';
import 'package:flutter_template/util/extension/date_time_extension.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class LoggingRepository extends BaseLoggingRepository {
  final FirebaseStorage _firebaseStorage;

  LoggingRepository(
    this._firebaseStorage,
    super.secureLogStorage,
  );

  @override
  Future<void> uploadFile(File file, DateTime date) async {
    const userId = 'TestUser';
    final ref = _firebaseStorage.ref('logs/$userId-${date.dottedShortDateFormat}.txt');
    await ref.putFile(file);
  }
}

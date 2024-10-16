// ignore_for_file: avoid_print

import 'package:drift_dev/api/migrations.dart';
import 'package:flutter_template/database/flutter_template_database.dart';
import 'package:flutter_test/flutter_test.dart';

import 'flutter_template_database_test.dart';
import 'schema_versions/schema.dart';


void main() {
  group('database migration tests', () {
    late SchemaVerifier verifier;

    setUpAll(() {
      verifier = SchemaVerifier(GeneratedHelper());
    });

    test('upgrade from any to latest', () async {
      for (var start = schemaVersion; start >= 1; start--) {
        final connection = await verifier.startAt(start);
        final db = FlutterTemplateDatabase(connection);
        try {
          await verifier.migrateAndValidate(db, schemaVersion);
        } catch (e) {
          print('Failed to migrate from $start to $schemaVersion');
          rethrow;
        }
        await db.close();
      }
    });
  });
}

import 'package:flutter_template/util/logging/app_transactions.dart';
import 'package:flutter_template/util/logging/flutter_template_logger.dart';
import 'package:injectable/injectable.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

@lazySingleton
abstract class SentryPerformanceLogger {
  Future<void> startAppLoadTransaction();
  Future<void> finishAppLoadTransaction();
  Future<void> startTransaction(AppTransactions transaction);
  Future<void> finishTransaction(AppTransactions transaction);

  @factoryMethod
  factory SentryPerformanceLogger() = _SentryPerformanceLogger;
}

class _SentryPerformanceLogger implements SentryPerformanceLogger {
  ISentrySpan? _appLoadTransaction;
  final Map<String, ISentrySpan> _transactions = {};

  @override
  Future<void> startAppLoadTransaction() async {
    await _appLoadTransaction?.finish();
    _appLoadTransaction = Sentry.startTransaction(
      AppTransactions.appLoad.name,
      AppTransactions.appLoad.operation,
      bindToScope: true,
    );
  }

  @override
  Future<void> finishAppLoadTransaction() async {
    final transaction = _appLoadTransaction;
    _appLoadTransaction = null;
    await transaction?.finish();
  }

  @override
  Future<void> startTransaction(AppTransactions transaction) async {
    if (_transactions.containsKey(transaction.name)) {
      FlutterTemplateLogger.logDebug('Already started transaction: ${transaction.name}');
      return;
    }
    FlutterTemplateLogger.logDebug('Starting transaction: ${transaction.name}');
    final sentryTransaction = Sentry.startTransaction(
      transaction.name,
      transaction.operation,
      bindToScope: true,
    );
    _transactions[transaction.name] = sentryTransaction;
  }

  @override
  Future<void> finishTransaction(AppTransactions transaction) async {
    final sentryTransaction = _transactions[transaction.name];
    if (sentryTransaction == null) {
      FlutterTemplateLogger.logDebug('Already finished transaction: ${transaction.name}');
      return;
    }
    FlutterTemplateLogger.logDebug('Finishing transaction: ${transaction.name}');

    await sentryTransaction.finish();
    _transactions.remove(transaction.name);
  }
}

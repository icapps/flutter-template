class AppTransactions {
  final String name;
  final String operation;

  const AppTransactions(this.name, this.operation);

  static const AppTransactions appLoad = AppTransactions(
    'App Load',
    'app.load',
  );

  static const AppTransactions splashComplete = AppTransactions(
    'Splash Complete',
    'splash.complete',
  );
}

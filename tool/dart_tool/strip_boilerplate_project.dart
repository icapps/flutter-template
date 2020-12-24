import 'dart:io';

void main(List<String> args) {
  bool keepTestDir;
  if (args.isEmpty || (args[0] != 'true' && args[0] != 'false')) {
    do {
      final result = stdin.readLineSync();
      final valid = result == 'yes' || result == 'y' || result == 'no' || result == 'n';
      if (valid) {
        keepTestDir = result == 'yes' || result == 'y';
      }
    } while (keepTestDir == null);
  }
  final testDir = Directory('test');
  final libDir = Directory('lib');
  if (!keepTestDir && testDir.existsSync()) {
    testDir.deleteSync(recursive: true);
    Logger.debug('Removed the test directory');
  }
  Logger.debug('Removing files');
  removeBoilerplateFilesFromDirectory(testDir);
  removeBoilerplateFilesFromDirectory(libDir);
  Logger.debug('Removed files');

  Logger.debug('Removing import references');
  replaceBoilerplateReferencesFromDirectory(testDir);
  replaceBoilerplateReferencesFromDirectory(libDir);
  _replaceHomeScreenLine();
  Logger.debug('Removed import references');
}

void removeBoilerplateFilesFromDirectory(Directory dir) {
  if (!dir.existsSync()) return;
  dir.listSync(recursive: true).where((element) {
    if (element.path.endsWith('.png')) return false;
    if (File(element.path).existsSync()) return false;
    return true;
  }).forEach((element) {
    removeDirectories.forEach((removeDir) {
      if (element.path == removeDir) {
        element.deleteSync(recursive: true);
      }
    });
  });
}

void replaceBoilerplateReferencesFromDirectory(Directory dir) {
  if (!dir.existsSync()) return;
  dir.listSync(recursive: true).where((element) {
    if (element.path.endsWith('.png')) return false;
    if (Directory(element.path).existsSync()) return false;
    return true;
  }).forEach((element) {
    removeCodeLines.forEach((import) {
      _replaceInFile(element.path, '$import\n', '');
    });
  });
}

void _replaceHomeScreenLine() {
  _replaceInFile(
    'lib/screen/home/home_screen.dart',
    '''        children: const [
          TodoListScreen(),
          DebugScreen(),
        ],''',
    '''        children: [
          Container(),
          DebugScreen(),
        ],''',
  );
}

void _replaceInFile(String path, String originalString, String newString) {
  final file = File(path);
  if (!file.existsSync()) return;
  final original = file.readAsStringSync();
  final newContent = original.replaceAll(originalString, newString);
  file.writeAsStringSync(newContent);
}

final removeCodeLines = [
  "import 'package:flutter_template/model/database/todo/db_todo_table.dart';",
  "import 'package:flutter_template/model/webservice/todo/todo.dart';",
  "import 'package:flutter_template/viewmodel/todo/todo_add/todo_add_viewmodel.dart';",
  "import 'package:flutter_template/viewmodel/todo/todo_list/todo_list_viewmodel.dart';",
  "import 'package:flutter_template/viewmodel/todo/todo_list/todo_list_viewmodel.dart';",
  "import 'package:flutter_template/database/todo/todo_dao_storage.dart';",
  "import 'package:flutter_template/database/todo/todo_dao_storing.dart';",
  "import 'package:flutter_template/repository/todo/todo_repository.dart';",
  "import 'package:flutter_template/repository/todo/todo_repo.dart';",
  "import 'package:flutter_template/webservice/todo/todo_dummy_service.dart';",
  "import 'package:flutter_template/webservice/todo/todo_webservice.dart';",
  "import 'package:flutter_template/webservice/todo/todo_service.dart';",
  "import 'package:flutter_template/screen/todo/todo_list/todo_list_screen.dart';",
  "import 'package:flutter_template/screen/todo/todo_add/todo_add_screen.dart';",
  '  DbTodoTable,',
  '  @Register.singleton(TodoDaoStoring, from: TodoDaoStorage)',
  '  @Register.singleton(TodoService, from: TodoWebService)',
  '  @Register.singleton(TodoService, from: TodoDummyService)',
  '  @Register.singleton(TodoService, from: TodoDummyService)',
  '  @Register.singleton(TodoRepo, from: TodoRepository)',
  '  @Register.factory(TodoListViewModel)',
  '  @Register.factory(TodoAddViewModel)',
  '      case TodoAddScreen.routeName:',
  '        return MaterialPageRoute<void>(builder: (context) => const FlavorBanner(child: TodoAddScreen()), settings: settings);',
  '  void goToAddTodo();',
  '''  @override
  void goToAddTodo() => navigationKey.currentState.pushNamed(TodoAddScreen.routeName);
''',
  '''  @override
  void goToAddTodo() => widget.mock.goToAddTodo();
''',
  //Test Lines
  "import '../mocks/database/todo/mock_todo_dao_storage.dart';",
  "import '../mocks/repository/todo/mock_todo_repository.dart';",
  "import '../mocks/viewmodel/todo/todo_add/mock_todo_add_viewmodel.dart';",
  "import '../mocks/webservice/todo/mock_todo_service.dart';",
  "import '../mocks/viewmodel/todo/todo_list/mock_todo_list_viewmodel.dart';",
  "import '../todo/todo_list/todo_list_screen_test.dart';",
  '  @Register.singleton(TodoDaoStoring, from: MockTodoDaoStorage)',
  '  @Register.singleton(TodoRepo, from: MockTodoRepository)',
  '  @Register.singleton(TodoService, from: MockTodoService)',
  '  @Register.singleton(TodoListViewModel, from: MockTodoListViewModel)',
  '  @Register.singleton(TodoAddViewModel, from: MockTodoAddViewModel)',
  '    verifyTodoListViewModel();',
];

final removeDirectories = [
  'lib/database/todo',
  'lib/model/database/todo',
  'lib/model/webservice/todo',
  'lib/repository/todo',
  'lib/screen/todo',
  'lib/viewmodel/todo',
  'lib/webservice/todo',
  'lib/widget/todo',
  //Test Directories
  'test/database/todo',
  'test/model/database/todo',
  'test/model/webservice/todo',
  'test/repository/todo',
  'test/screen/todo',
  'test/viewmodel/todo',
  'test/webservice/todo',
  'test/widget/todo',
  'test/mocks/database/todo',
  'test/mocks/repository/todo',
  'test/mocks/viewmodel/todo',
  'test/mocks/webservice/todo',
];

class Logger {
  Logger._();

  static void debug(Object value) => print(value); // ignore: avoid_print

  static void info(Object value) => print(value); // ignore: avoid_print
  static void error(Object value) => print(value); // ignore: avoid_print
}

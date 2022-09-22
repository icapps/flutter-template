// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'flutter_template_database.dart';

// **************************************************************************
// DriftDatabaseGenerator
// **************************************************************************

// ignore_for_file: type=lint
class DbTodo extends DataClass implements Insertable<DbTodo> {
  final int id;
  final String title;
  final bool completed;
  const DbTodo(
      {required this.id, required this.title, required this.completed});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['title'] = Variable<String>(title);
    map['completed'] = Variable<bool>(completed);
    return map;
  }

  DbTodoTableCompanion toCompanion(bool nullToAbsent) {
    return DbTodoTableCompanion(
      id: Value(id),
      title: Value(title),
      completed: Value(completed),
    );
  }

  factory DbTodo.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DbTodo(
      id: serializer.fromJson<int>(json['id']),
      title: serializer.fromJson<String>(json['title']),
      completed: serializer.fromJson<bool>(json['completed']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'title': serializer.toJson<String>(title),
      'completed': serializer.toJson<bool>(completed),
    };
  }

  DbTodo copyWith({int? id, String? title, bool? completed}) => DbTodo(
        id: id ?? this.id,
        title: title ?? this.title,
        completed: completed ?? this.completed,
      );
  @override
  String toString() {
    return (StringBuffer('DbTodo(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('completed: $completed')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, title, completed);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DbTodo &&
          other.id == this.id &&
          other.title == this.title &&
          other.completed == this.completed);
}

class DbTodoTableCompanion extends UpdateCompanion<DbTodo> {
  final Value<int> id;
  final Value<String> title;
  final Value<bool> completed;
  const DbTodoTableCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.completed = const Value.absent(),
  });
  DbTodoTableCompanion.insert({
    this.id = const Value.absent(),
    required String title,
    required bool completed,
  })  : title = Value(title),
        completed = Value(completed);
  static Insertable<DbTodo> custom({
    Expression<int>? id,
    Expression<String>? title,
    Expression<bool>? completed,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (completed != null) 'completed': completed,
    });
  }

  DbTodoTableCompanion copyWith(
      {Value<int>? id, Value<String>? title, Value<bool>? completed}) {
    return DbTodoTableCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      completed: completed ?? this.completed,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (completed.present) {
      map['completed'] = Variable<bool>(completed.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DbTodoTableCompanion(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('completed: $completed')
          ..write(')'))
        .toString();
  }
}

class $DbTodoTableTable extends DbTodoTable
    with TableInfo<$DbTodoTableTable, DbTodo> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DbTodoTableTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
      'title', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  final VerificationMeta _completedMeta = const VerificationMeta('completed');
  @override
  late final GeneratedColumn<bool> completed = GeneratedColumn<bool>(
      'completed', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: true,
      defaultConstraints: 'CHECK (completed IN (0, 1))');
  @override
  List<GeneratedColumn> get $columns => [id, title, completed];
  @override
  String get aliasedName => _alias ?? 'db_todo_table';
  @override
  String get actualTableName => 'db_todo_table';
  @override
  VerificationContext validateIntegrity(Insertable<DbTodo> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('completed')) {
      context.handle(_completedMeta,
          completed.isAcceptableOrUnknown(data['completed']!, _completedMeta));
    } else if (isInserting) {
      context.missing(_completedMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  DbTodo map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return DbTodo(
      id: attachedDatabase.options.types
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      title: attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}title'])!,
      completed: attachedDatabase.options.types
          .read(DriftSqlType.bool, data['${effectivePrefix}completed'])!,
    );
  }

  @override
  $DbTodoTableTable createAlias(String alias) {
    return $DbTodoTableTable(attachedDatabase, alias);
  }
}

abstract class _$FlutterTemplateDatabase extends GeneratedDatabase {
  _$FlutterTemplateDatabase(QueryExecutor e) : super(e);
  _$FlutterTemplateDatabase.connect(DatabaseConnection c) : super.connect(c);
  late final $DbTodoTableTable dbTodoTable = $DbTodoTableTable(this);
  @override
  Iterable<TableInfo<Table, dynamic>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [dbTodoTable];
}

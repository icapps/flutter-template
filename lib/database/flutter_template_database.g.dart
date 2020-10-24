// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'flutter_template_database.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class DbTodo extends DataClass implements Insertable<DbTodo> {
  final int id;
  final String title;
  final bool completed;
  DbTodo({@required this.id, @required this.title, @required this.completed});
  factory DbTodo.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    final boolType = db.typeSystem.forDartType<bool>();
    return DbTodo(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      title:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}title']),
      completed:
          boolType.mapFromDatabaseResponse(data['${effectivePrefix}completed']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int>(id);
    }
    if (!nullToAbsent || title != null) {
      map['title'] = Variable<String>(title);
    }
    if (!nullToAbsent || completed != null) {
      map['completed'] = Variable<bool>(completed);
    }
    return map;
  }

  DbTodoTableCompanion toCompanion(bool nullToAbsent) {
    return DbTodoTableCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      title:
          title == null && nullToAbsent ? const Value.absent() : Value(title),
      completed: completed == null && nullToAbsent
          ? const Value.absent()
          : Value(completed),
    );
  }

  factory DbTodo.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return DbTodo(
      id: serializer.fromJson<int>(json['id']),
      title: serializer.fromJson<String>(json['title']),
      completed: serializer.fromJson<bool>(json['completed']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'title': serializer.toJson<String>(title),
      'completed': serializer.toJson<bool>(completed),
    };
  }

  DbTodo copyWith({int id, String title, bool completed}) => DbTodo(
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
  int get hashCode =>
      $mrjf($mrjc(id.hashCode, $mrjc(title.hashCode, completed.hashCode)));
  @override
  bool operator ==(dynamic other) =>
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
    @required String title,
    @required bool completed,
  })  : title = Value(title),
        completed = Value(completed);
  static Insertable<DbTodo> custom({
    Expression<int> id,
    Expression<String> title,
    Expression<bool> completed,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (completed != null) 'completed': completed,
    });
  }

  DbTodoTableCompanion copyWith(
      {Value<int> id, Value<String> title, Value<bool> completed}) {
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
  final GeneratedDatabase _db;
  final String _alias;
  $DbTodoTableTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedIntColumn _id;
  @override
  GeneratedIntColumn get id => _id ??= _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, false,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _titleMeta = const VerificationMeta('title');
  GeneratedTextColumn _title;
  @override
  GeneratedTextColumn get title => _title ??= _constructTitle();
  GeneratedTextColumn _constructTitle() {
    return GeneratedTextColumn(
      'title',
      $tableName,
      false,
    );
  }

  final VerificationMeta _completedMeta = const VerificationMeta('completed');
  GeneratedBoolColumn _completed;
  @override
  GeneratedBoolColumn get completed => _completed ??= _constructCompleted();
  GeneratedBoolColumn _constructCompleted() {
    return GeneratedBoolColumn(
      'completed',
      $tableName,
      false,
    );
  }

  @override
  List<GeneratedColumn> get $columns => [id, title, completed];
  @override
  $DbTodoTableTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'db_todo_table';
  @override
  final String actualTableName = 'db_todo_table';
  @override
  VerificationContext validateIntegrity(Insertable<DbTodo> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id'], _idMeta));
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title'], _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('completed')) {
      context.handle(_completedMeta,
          completed.isAcceptableOrUnknown(data['completed'], _completedMeta));
    } else if (isInserting) {
      context.missing(_completedMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  DbTodo map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return DbTodo.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $DbTodoTableTable createAlias(String alias) {
    return $DbTodoTableTable(_db, alias);
  }
}

abstract class _$FlutterTemplateDatabase extends GeneratedDatabase {
  _$FlutterTemplateDatabase(QueryExecutor e)
      : super(SqlTypeSystem.defaultInstance, e);
  _$FlutterTemplateDatabase.connect(DatabaseConnection c) : super.connect(c);
  $DbTodoTableTable _dbTodoTable;
  $DbTodoTableTable get dbTodoTable => _dbTodoTable ??= $DbTodoTableTable(this);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [dbTodoTable];
}

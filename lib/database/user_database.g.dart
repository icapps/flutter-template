// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_database.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class DbUser extends DataClass implements Insertable<DbUser> {
  final int id;
  final String name;
  final String email;
  final String userName;

  DbUser({@required this.id, @required this.name, @required this.email, @required this.userName});

  factory DbUser.fromData(Map<String, dynamic> data, GeneratedDatabase db, {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    return DbUser(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      name: stringType.mapFromDatabaseResponse(data['${effectivePrefix}name']),
      email: stringType.mapFromDatabaseResponse(data['${effectivePrefix}email']),
      userName: stringType.mapFromDatabaseResponse(data['${effectivePrefix}user_name']),
    );
  }

  factory DbUser.fromJson(Map<String, dynamic> json, {ValueSerializer serializer = const ValueSerializer.defaults()}) {
    return DbUser(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      email: serializer.fromJson<String>(json['email']),
      userName: serializer.fromJson<String>(json['userName']),
    );
  }

  @override
  Map<String, dynamic> toJson({ValueSerializer serializer = const ValueSerializer.defaults()}) {
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'email': serializer.toJson<String>(email),
      'userName': serializer.toJson<String>(userName),
    };
  }

  @override
  DbUserTableCompanion createCompanion(bool nullToAbsent) {
    return DbUserTableCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      name: name == null && nullToAbsent ? const Value.absent() : Value(name),
      email: email == null && nullToAbsent ? const Value.absent() : Value(email),
      userName: userName == null && nullToAbsent ? const Value.absent() : Value(userName),
    );
  }

  DbUser copyWith({int id, String name, String email, String userName}) => DbUser(
        id: id ?? this.id,
        name: name ?? this.name,
        email: email ?? this.email,
        userName: userName ?? this.userName,
      );

  @override
  String toString() {
    return (StringBuffer('DbUser(')..write('id: $id, ')..write('name: $name, ')..write('email: $email, ')..write('userName: $userName')..write(')')).toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(id.hashCode, $mrjc(name.hashCode, $mrjc(email.hashCode, userName.hashCode))));

  @override
  bool operator ==(dynamic other) =>
      identical(this, other) || (other is DbUser && other.id == this.id && other.name == this.name && other.email == this.email && other.userName == this.userName);
}

class DbUserTableCompanion extends UpdateCompanion<DbUser> {
  final Value<int> id;
  final Value<String> name;
  final Value<String> email;
  final Value<String> userName;

  const DbUserTableCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.email = const Value.absent(),
    this.userName = const Value.absent(),
  });

  DbUserTableCompanion.insert({
    this.id = const Value.absent(),
    @required String name,
    @required String email,
    @required String userName,
  })  : name = Value(name),
        email = Value(email),
        userName = Value(userName);

  DbUserTableCompanion copyWith({Value<int> id, Value<String> name, Value<String> email, Value<String> userName}) {
    return DbUserTableCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      userName: userName ?? this.userName,
    );
  }
}

class $DbUserTableTable extends DbUserTable with TableInfo<$DbUserTableTable, DbUser> {
  final GeneratedDatabase _db;
  final String _alias;

  $DbUserTableTable(this._db, [this._alias]);

  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedIntColumn _id;

  @override
  GeneratedIntColumn get id => _id ??= _constructId();

  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, false, hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _nameMeta = const VerificationMeta('name');
  GeneratedTextColumn _name;

  @override
  GeneratedTextColumn get name => _name ??= _constructName();

  GeneratedTextColumn _constructName() {
    return GeneratedTextColumn(
      'name',
      $tableName,
      false,
    );
  }

  final VerificationMeta _emailMeta = const VerificationMeta('email');
  GeneratedTextColumn _email;

  @override
  GeneratedTextColumn get email => _email ??= _constructEmail();

  GeneratedTextColumn _constructEmail() {
    return GeneratedTextColumn(
      'email',
      $tableName,
      false,
    );
  }

  final VerificationMeta _userNameMeta = const VerificationMeta('userName');
  GeneratedTextColumn _userName;

  @override
  GeneratedTextColumn get userName => _userName ??= _constructUserName();

  GeneratedTextColumn _constructUserName() {
    return GeneratedTextColumn(
      'user_name',
      $tableName,
      false,
    );
  }

  @override
  List<GeneratedColumn> get $columns => [id, name, email, userName];

  @override
  $DbUserTableTable get asDslTable => this;

  @override
  String get $tableName => _alias ?? 'db_user_table';
  @override
  final String actualTableName = 'db_user_table';

  @override
  VerificationContext validateIntegrity(DbUserTableCompanion d, {bool isInserting = false}) {
    final context = VerificationContext();
    if (d.id.present) {
      context.handle(_idMeta, id.isAcceptableValue(d.id.value, _idMeta));
    } else if (id.isRequired && isInserting) {
      context.missing(_idMeta);
    }
    if (d.name.present) {
      context.handle(_nameMeta, name.isAcceptableValue(d.name.value, _nameMeta));
    } else if (name.isRequired && isInserting) {
      context.missing(_nameMeta);
    }
    if (d.email.present) {
      context.handle(_emailMeta, email.isAcceptableValue(d.email.value, _emailMeta));
    } else if (email.isRequired && isInserting) {
      context.missing(_emailMeta);
    }
    if (d.userName.present) {
      context.handle(_userNameMeta, userName.isAcceptableValue(d.userName.value, _userNameMeta));
    } else if (userName.isRequired && isInserting) {
      context.missing(_userNameMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};

  @override
  DbUser map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return DbUser.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  Map<String, Variable> entityToSql(DbUserTableCompanion d) {
    final map = <String, Variable>{};
    if (d.id.present) {
      map['id'] = Variable<int, IntType>(d.id.value);
    }
    if (d.name.present) {
      map['name'] = Variable<String, StringType>(d.name.value);
    }
    if (d.email.present) {
      map['email'] = Variable<String, StringType>(d.email.value);
    }
    if (d.userName.present) {
      map['user_name'] = Variable<String, StringType>(d.userName.value);
    }
    return map;
  }

  @override
  $DbUserTableTable createAlias(String alias) {
    return $DbUserTableTable(_db, alias);
  }
}

abstract class _$UserDatabase extends GeneratedDatabase {
  _$UserDatabase(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  $DbUserTableTable _dbUserTable;

  $DbUserTableTable get dbUserTable => _dbUserTable ??= $DbUserTableTable(this);

  @override
  List<TableInfo> get allTables => [dbUserTable];
}

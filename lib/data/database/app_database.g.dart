// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $EventCategoriesTableTable extends EventCategoriesTable
    with TableInfo<$EventCategoriesTableTable, EventCategoriesTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $EventCategoriesTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _categoryIdMeta = const VerificationMeta(
    'categoryId',
  );
  @override
  late final GeneratedColumn<int> categoryId = GeneratedColumn<int>(
    'category_id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'),
  );
  @override
  List<GeneratedColumn> get $columns => [categoryId, name];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'event_categories_table';
  @override
  VerificationContext validateIntegrity(
    Insertable<EventCategoriesTableData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('category_id')) {
      context.handle(
        _categoryIdMeta,
        categoryId.isAcceptableOrUnknown(data['category_id']!, _categoryIdMeta),
      );
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {categoryId};
  @override
  EventCategoriesTableData map(
    Map<String, dynamic> data, {
    String? tablePrefix,
  }) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return EventCategoriesTableData(
      categoryId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}category_id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
    );
  }

  @override
  $EventCategoriesTableTable createAlias(String alias) {
    return $EventCategoriesTableTable(attachedDatabase, alias);
  }
}

class EventCategoriesTableData extends DataClass
    implements Insertable<EventCategoriesTableData> {
  final int categoryId;
  final String name;
  const EventCategoriesTableData({
    required this.categoryId,
    required this.name,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['category_id'] = Variable<int>(categoryId);
    map['name'] = Variable<String>(name);
    return map;
  }

  EventCategoriesTableCompanion toCompanion(bool nullToAbsent) {
    return EventCategoriesTableCompanion(
      categoryId: Value(categoryId),
      name: Value(name),
    );
  }

  factory EventCategoriesTableData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return EventCategoriesTableData(
      categoryId: serializer.fromJson<int>(json['categoryId']),
      name: serializer.fromJson<String>(json['name']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'categoryId': serializer.toJson<int>(categoryId),
      'name': serializer.toJson<String>(name),
    };
  }

  EventCategoriesTableData copyWith({int? categoryId, String? name}) =>
      EventCategoriesTableData(
        categoryId: categoryId ?? this.categoryId,
        name: name ?? this.name,
      );
  EventCategoriesTableData copyWithCompanion(
    EventCategoriesTableCompanion data,
  ) {
    return EventCategoriesTableData(
      categoryId: data.categoryId.present
          ? data.categoryId.value
          : this.categoryId,
      name: data.name.present ? data.name.value : this.name,
    );
  }

  @override
  String toString() {
    return (StringBuffer('EventCategoriesTableData(')
          ..write('categoryId: $categoryId, ')
          ..write('name: $name')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(categoryId, name);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is EventCategoriesTableData &&
          other.categoryId == this.categoryId &&
          other.name == this.name);
}

class EventCategoriesTableCompanion
    extends UpdateCompanion<EventCategoriesTableData> {
  final Value<int> categoryId;
  final Value<String> name;
  const EventCategoriesTableCompanion({
    this.categoryId = const Value.absent(),
    this.name = const Value.absent(),
  });
  EventCategoriesTableCompanion.insert({
    this.categoryId = const Value.absent(),
    required String name,
  }) : name = Value(name);
  static Insertable<EventCategoriesTableData> custom({
    Expression<int>? categoryId,
    Expression<String>? name,
  }) {
    return RawValuesInsertable({
      if (categoryId != null) 'category_id': categoryId,
      if (name != null) 'name': name,
    });
  }

  EventCategoriesTableCompanion copyWith({
    Value<int>? categoryId,
    Value<String>? name,
  }) {
    return EventCategoriesTableCompanion(
      categoryId: categoryId ?? this.categoryId,
      name: name ?? this.name,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (categoryId.present) {
      map['category_id'] = Variable<int>(categoryId.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('EventCategoriesTableCompanion(')
          ..write('categoryId: $categoryId, ')
          ..write('name: $name')
          ..write(')'))
        .toString();
  }
}

class $EventTypesTableTable extends EventTypesTable
    with TableInfo<$EventTypesTableTable, EventTypesTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $EventTypesTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _eventIdMeta = const VerificationMeta(
    'eventId',
  );
  @override
  late final GeneratedColumn<String> eventId = GeneratedColumn<String>(
    'event_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _eventNameMeta = const VerificationMeta(
    'eventName',
  );
  @override
  late final GeneratedColumn<String> eventName = GeneratedColumn<String>(
    'event_name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _iconNameMeta = const VerificationMeta(
    'iconName',
  );
  @override
  late final GeneratedColumn<String> iconName = GeneratedColumn<String>(
    'icon_name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _priorityMeta = const VerificationMeta(
    'priority',
  );
  @override
  late final GeneratedColumn<int> priority = GeneratedColumn<int>(
    'priority',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL CHECK(priority >= 0)',
  );
  static const VerificationMeta _categoryIdMeta = const VerificationMeta(
    'categoryId',
  );
  @override
  late final GeneratedColumn<int> categoryId = GeneratedColumn<int>(
    'category_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES event_categories_table (category_id)',
    ),
  );
  @override
  List<GeneratedColumn> get $columns => [
    eventId,
    eventName,
    iconName,
    priority,
    categoryId,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'event_types_table';
  @override
  VerificationContext validateIntegrity(
    Insertable<EventTypesTableData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('event_id')) {
      context.handle(
        _eventIdMeta,
        eventId.isAcceptableOrUnknown(data['event_id']!, _eventIdMeta),
      );
    } else if (isInserting) {
      context.missing(_eventIdMeta);
    }
    if (data.containsKey('event_name')) {
      context.handle(
        _eventNameMeta,
        eventName.isAcceptableOrUnknown(data['event_name']!, _eventNameMeta),
      );
    } else if (isInserting) {
      context.missing(_eventNameMeta);
    }
    if (data.containsKey('icon_name')) {
      context.handle(
        _iconNameMeta,
        iconName.isAcceptableOrUnknown(data['icon_name']!, _iconNameMeta),
      );
    } else if (isInserting) {
      context.missing(_iconNameMeta);
    }
    if (data.containsKey('priority')) {
      context.handle(
        _priorityMeta,
        priority.isAcceptableOrUnknown(data['priority']!, _priorityMeta),
      );
    } else if (isInserting) {
      context.missing(_priorityMeta);
    }
    if (data.containsKey('category_id')) {
      context.handle(
        _categoryIdMeta,
        categoryId.isAcceptableOrUnknown(data['category_id']!, _categoryIdMeta),
      );
    } else if (isInserting) {
      context.missing(_categoryIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {eventId};
  @override
  EventTypesTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return EventTypesTableData(
      eventId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}event_id'],
      )!,
      eventName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}event_name'],
      )!,
      iconName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}icon_name'],
      )!,
      priority: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}priority'],
      )!,
      categoryId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}category_id'],
      )!,
    );
  }

  @override
  $EventTypesTableTable createAlias(String alias) {
    return $EventTypesTableTable(attachedDatabase, alias);
  }
}

class EventTypesTableData extends DataClass
    implements Insertable<EventTypesTableData> {
  final String eventId;
  final String eventName;
  final String iconName;
  final int priority;
  final int categoryId;
  const EventTypesTableData({
    required this.eventId,
    required this.eventName,
    required this.iconName,
    required this.priority,
    required this.categoryId,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['event_id'] = Variable<String>(eventId);
    map['event_name'] = Variable<String>(eventName);
    map['icon_name'] = Variable<String>(iconName);
    map['priority'] = Variable<int>(priority);
    map['category_id'] = Variable<int>(categoryId);
    return map;
  }

  EventTypesTableCompanion toCompanion(bool nullToAbsent) {
    return EventTypesTableCompanion(
      eventId: Value(eventId),
      eventName: Value(eventName),
      iconName: Value(iconName),
      priority: Value(priority),
      categoryId: Value(categoryId),
    );
  }

  factory EventTypesTableData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return EventTypesTableData(
      eventId: serializer.fromJson<String>(json['eventId']),
      eventName: serializer.fromJson<String>(json['eventName']),
      iconName: serializer.fromJson<String>(json['iconName']),
      priority: serializer.fromJson<int>(json['priority']),
      categoryId: serializer.fromJson<int>(json['categoryId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'eventId': serializer.toJson<String>(eventId),
      'eventName': serializer.toJson<String>(eventName),
      'iconName': serializer.toJson<String>(iconName),
      'priority': serializer.toJson<int>(priority),
      'categoryId': serializer.toJson<int>(categoryId),
    };
  }

  EventTypesTableData copyWith({
    String? eventId,
    String? eventName,
    String? iconName,
    int? priority,
    int? categoryId,
  }) => EventTypesTableData(
    eventId: eventId ?? this.eventId,
    eventName: eventName ?? this.eventName,
    iconName: iconName ?? this.iconName,
    priority: priority ?? this.priority,
    categoryId: categoryId ?? this.categoryId,
  );
  EventTypesTableData copyWithCompanion(EventTypesTableCompanion data) {
    return EventTypesTableData(
      eventId: data.eventId.present ? data.eventId.value : this.eventId,
      eventName: data.eventName.present ? data.eventName.value : this.eventName,
      iconName: data.iconName.present ? data.iconName.value : this.iconName,
      priority: data.priority.present ? data.priority.value : this.priority,
      categoryId: data.categoryId.present
          ? data.categoryId.value
          : this.categoryId,
    );
  }

  @override
  String toString() {
    return (StringBuffer('EventTypesTableData(')
          ..write('eventId: $eventId, ')
          ..write('eventName: $eventName, ')
          ..write('iconName: $iconName, ')
          ..write('priority: $priority, ')
          ..write('categoryId: $categoryId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(eventId, eventName, iconName, priority, categoryId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is EventTypesTableData &&
          other.eventId == this.eventId &&
          other.eventName == this.eventName &&
          other.iconName == this.iconName &&
          other.priority == this.priority &&
          other.categoryId == this.categoryId);
}

class EventTypesTableCompanion extends UpdateCompanion<EventTypesTableData> {
  final Value<String> eventId;
  final Value<String> eventName;
  final Value<String> iconName;
  final Value<int> priority;
  final Value<int> categoryId;
  final Value<int> rowid;
  const EventTypesTableCompanion({
    this.eventId = const Value.absent(),
    this.eventName = const Value.absent(),
    this.iconName = const Value.absent(),
    this.priority = const Value.absent(),
    this.categoryId = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  EventTypesTableCompanion.insert({
    required String eventId,
    required String eventName,
    required String iconName,
    required int priority,
    required int categoryId,
    this.rowid = const Value.absent(),
  }) : eventId = Value(eventId),
       eventName = Value(eventName),
       iconName = Value(iconName),
       priority = Value(priority),
       categoryId = Value(categoryId);
  static Insertable<EventTypesTableData> custom({
    Expression<String>? eventId,
    Expression<String>? eventName,
    Expression<String>? iconName,
    Expression<int>? priority,
    Expression<int>? categoryId,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (eventId != null) 'event_id': eventId,
      if (eventName != null) 'event_name': eventName,
      if (iconName != null) 'icon_name': iconName,
      if (priority != null) 'priority': priority,
      if (categoryId != null) 'category_id': categoryId,
      if (rowid != null) 'rowid': rowid,
    });
  }

  EventTypesTableCompanion copyWith({
    Value<String>? eventId,
    Value<String>? eventName,
    Value<String>? iconName,
    Value<int>? priority,
    Value<int>? categoryId,
    Value<int>? rowid,
  }) {
    return EventTypesTableCompanion(
      eventId: eventId ?? this.eventId,
      eventName: eventName ?? this.eventName,
      iconName: iconName ?? this.iconName,
      priority: priority ?? this.priority,
      categoryId: categoryId ?? this.categoryId,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (eventId.present) {
      map['event_id'] = Variable<String>(eventId.value);
    }
    if (eventName.present) {
      map['event_name'] = Variable<String>(eventName.value);
    }
    if (iconName.present) {
      map['icon_name'] = Variable<String>(iconName.value);
    }
    if (priority.present) {
      map['priority'] = Variable<int>(priority.value);
    }
    if (categoryId.present) {
      map['category_id'] = Variable<int>(categoryId.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('EventTypesTableCompanion(')
          ..write('eventId: $eventId, ')
          ..write('eventName: $eventName, ')
          ..write('iconName: $iconName, ')
          ..write('priority: $priority, ')
          ..write('categoryId: $categoryId, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $UsersTableTable extends UsersTable
    with TableInfo<$UsersTableTable, UsersTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $UsersTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _userIdMeta = const VerificationMeta('userId');
  @override
  late final GeneratedColumn<int> userId = GeneratedColumn<int>(
    'user_id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _loginMeta = const VerificationMeta('login');
  @override
  late final GeneratedColumn<String> login = GeneratedColumn<String>(
    'login',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'),
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [userId, login, name];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'users_table';
  @override
  VerificationContext validateIntegrity(
    Insertable<UsersTableData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('user_id')) {
      context.handle(
        _userIdMeta,
        userId.isAcceptableOrUnknown(data['user_id']!, _userIdMeta),
      );
    }
    if (data.containsKey('login')) {
      context.handle(
        _loginMeta,
        login.isAcceptableOrUnknown(data['login']!, _loginMeta),
      );
    } else if (isInserting) {
      context.missing(_loginMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {userId};
  @override
  UsersTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return UsersTableData(
      userId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}user_id'],
      )!,
      login: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}login'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
    );
  }

  @override
  $UsersTableTable createAlias(String alias) {
    return $UsersTableTable(attachedDatabase, alias);
  }
}

class UsersTableData extends DataClass implements Insertable<UsersTableData> {
  final int userId;
  final String login;
  final String name;
  const UsersTableData({
    required this.userId,
    required this.login,
    required this.name,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['user_id'] = Variable<int>(userId);
    map['login'] = Variable<String>(login);
    map['name'] = Variable<String>(name);
    return map;
  }

  UsersTableCompanion toCompanion(bool nullToAbsent) {
    return UsersTableCompanion(
      userId: Value(userId),
      login: Value(login),
      name: Value(name),
    );
  }

  factory UsersTableData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return UsersTableData(
      userId: serializer.fromJson<int>(json['userId']),
      login: serializer.fromJson<String>(json['login']),
      name: serializer.fromJson<String>(json['name']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'userId': serializer.toJson<int>(userId),
      'login': serializer.toJson<String>(login),
      'name': serializer.toJson<String>(name),
    };
  }

  UsersTableData copyWith({int? userId, String? login, String? name}) =>
      UsersTableData(
        userId: userId ?? this.userId,
        login: login ?? this.login,
        name: name ?? this.name,
      );
  UsersTableData copyWithCompanion(UsersTableCompanion data) {
    return UsersTableData(
      userId: data.userId.present ? data.userId.value : this.userId,
      login: data.login.present ? data.login.value : this.login,
      name: data.name.present ? data.name.value : this.name,
    );
  }

  @override
  String toString() {
    return (StringBuffer('UsersTableData(')
          ..write('userId: $userId, ')
          ..write('login: $login, ')
          ..write('name: $name')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(userId, login, name);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is UsersTableData &&
          other.userId == this.userId &&
          other.login == this.login &&
          other.name == this.name);
}

class UsersTableCompanion extends UpdateCompanion<UsersTableData> {
  final Value<int> userId;
  final Value<String> login;
  final Value<String> name;
  const UsersTableCompanion({
    this.userId = const Value.absent(),
    this.login = const Value.absent(),
    this.name = const Value.absent(),
  });
  UsersTableCompanion.insert({
    this.userId = const Value.absent(),
    required String login,
    required String name,
  }) : login = Value(login),
       name = Value(name);
  static Insertable<UsersTableData> custom({
    Expression<int>? userId,
    Expression<String>? login,
    Expression<String>? name,
  }) {
    return RawValuesInsertable({
      if (userId != null) 'user_id': userId,
      if (login != null) 'login': login,
      if (name != null) 'name': name,
    });
  }

  UsersTableCompanion copyWith({
    Value<int>? userId,
    Value<String>? login,
    Value<String>? name,
  }) {
    return UsersTableCompanion(
      userId: userId ?? this.userId,
      login: login ?? this.login,
      name: name ?? this.name,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (userId.present) {
      map['user_id'] = Variable<int>(userId.value);
    }
    if (login.present) {
      map['login'] = Variable<String>(login.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('UsersTableCompanion(')
          ..write('userId: $userId, ')
          ..write('login: $login, ')
          ..write('name: $name')
          ..write(')'))
        .toString();
  }
}

class $ObjectsTableTable extends ObjectsTable
    with TableInfo<$ObjectsTableTable, ObjectsTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ObjectsTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _objectIdMeta = const VerificationMeta(
    'objectId',
  );
  @override
  late final GeneratedColumn<int> objectId = GeneratedColumn<int>(
    'object_id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _cityMeta = const VerificationMeta('city');
  @override
  late final GeneratedColumn<String> city = GeneratedColumn<String>(
    'city',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _streetMeta = const VerificationMeta('street');
  @override
  late final GeneratedColumn<String> street = GeneratedColumn<String>(
    'street',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _houseNumberMeta = const VerificationMeta(
    'houseNumber',
  );
  @override
  late final GeneratedColumn<String> houseNumber = GeneratedColumn<String>(
    'house_number',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _entranceMeta = const VerificationMeta(
    'entrance',
  );
  @override
  late final GeneratedColumn<String> entrance = GeneratedColumn<String>(
    'entrance',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _contactsMeta = const VerificationMeta(
    'contacts',
  );
  @override
  late final GeneratedColumn<String> contacts = GeneratedColumn<String>(
    'contacts',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    objectId,
    city,
    street,
    houseNumber,
    entrance,
    contacts,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'objects_table';
  @override
  VerificationContext validateIntegrity(
    Insertable<ObjectsTableData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('object_id')) {
      context.handle(
        _objectIdMeta,
        objectId.isAcceptableOrUnknown(data['object_id']!, _objectIdMeta),
      );
    }
    if (data.containsKey('city')) {
      context.handle(
        _cityMeta,
        city.isAcceptableOrUnknown(data['city']!, _cityMeta),
      );
    } else if (isInserting) {
      context.missing(_cityMeta);
    }
    if (data.containsKey('street')) {
      context.handle(
        _streetMeta,
        street.isAcceptableOrUnknown(data['street']!, _streetMeta),
      );
    } else if (isInserting) {
      context.missing(_streetMeta);
    }
    if (data.containsKey('house_number')) {
      context.handle(
        _houseNumberMeta,
        houseNumber.isAcceptableOrUnknown(
          data['house_number']!,
          _houseNumberMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_houseNumberMeta);
    }
    if (data.containsKey('entrance')) {
      context.handle(
        _entranceMeta,
        entrance.isAcceptableOrUnknown(data['entrance']!, _entranceMeta),
      );
    }
    if (data.containsKey('contacts')) {
      context.handle(
        _contactsMeta,
        contacts.isAcceptableOrUnknown(data['contacts']!, _contactsMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {objectId};
  @override
  ObjectsTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ObjectsTableData(
      objectId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}object_id'],
      )!,
      city: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}city'],
      )!,
      street: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}street'],
      )!,
      houseNumber: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}house_number'],
      )!,
      entrance: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}entrance'],
      ),
      contacts: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}contacts'],
      ),
    );
  }

  @override
  $ObjectsTableTable createAlias(String alias) {
    return $ObjectsTableTable(attachedDatabase, alias);
  }
}

class ObjectsTableData extends DataClass
    implements Insertable<ObjectsTableData> {
  final int objectId;
  final String city;
  final String street;
  final String houseNumber;

  /// Не у всех объектов есть подъезд
  final String? entrance;

  /// Контакты опциональны
  final String? contacts;
  const ObjectsTableData({
    required this.objectId,
    required this.city,
    required this.street,
    required this.houseNumber,
    this.entrance,
    this.contacts,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['object_id'] = Variable<int>(objectId);
    map['city'] = Variable<String>(city);
    map['street'] = Variable<String>(street);
    map['house_number'] = Variable<String>(houseNumber);
    if (!nullToAbsent || entrance != null) {
      map['entrance'] = Variable<String>(entrance);
    }
    if (!nullToAbsent || contacts != null) {
      map['contacts'] = Variable<String>(contacts);
    }
    return map;
  }

  ObjectsTableCompanion toCompanion(bool nullToAbsent) {
    return ObjectsTableCompanion(
      objectId: Value(objectId),
      city: Value(city),
      street: Value(street),
      houseNumber: Value(houseNumber),
      entrance: entrance == null && nullToAbsent
          ? const Value.absent()
          : Value(entrance),
      contacts: contacts == null && nullToAbsent
          ? const Value.absent()
          : Value(contacts),
    );
  }

  factory ObjectsTableData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ObjectsTableData(
      objectId: serializer.fromJson<int>(json['objectId']),
      city: serializer.fromJson<String>(json['city']),
      street: serializer.fromJson<String>(json['street']),
      houseNumber: serializer.fromJson<String>(json['houseNumber']),
      entrance: serializer.fromJson<String?>(json['entrance']),
      contacts: serializer.fromJson<String?>(json['contacts']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'objectId': serializer.toJson<int>(objectId),
      'city': serializer.toJson<String>(city),
      'street': serializer.toJson<String>(street),
      'houseNumber': serializer.toJson<String>(houseNumber),
      'entrance': serializer.toJson<String?>(entrance),
      'contacts': serializer.toJson<String?>(contacts),
    };
  }

  ObjectsTableData copyWith({
    int? objectId,
    String? city,
    String? street,
    String? houseNumber,
    Value<String?> entrance = const Value.absent(),
    Value<String?> contacts = const Value.absent(),
  }) => ObjectsTableData(
    objectId: objectId ?? this.objectId,
    city: city ?? this.city,
    street: street ?? this.street,
    houseNumber: houseNumber ?? this.houseNumber,
    entrance: entrance.present ? entrance.value : this.entrance,
    contacts: contacts.present ? contacts.value : this.contacts,
  );
  ObjectsTableData copyWithCompanion(ObjectsTableCompanion data) {
    return ObjectsTableData(
      objectId: data.objectId.present ? data.objectId.value : this.objectId,
      city: data.city.present ? data.city.value : this.city,
      street: data.street.present ? data.street.value : this.street,
      houseNumber: data.houseNumber.present
          ? data.houseNumber.value
          : this.houseNumber,
      entrance: data.entrance.present ? data.entrance.value : this.entrance,
      contacts: data.contacts.present ? data.contacts.value : this.contacts,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ObjectsTableData(')
          ..write('objectId: $objectId, ')
          ..write('city: $city, ')
          ..write('street: $street, ')
          ..write('houseNumber: $houseNumber, ')
          ..write('entrance: $entrance, ')
          ..write('contacts: $contacts')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(objectId, city, street, houseNumber, entrance, contacts);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ObjectsTableData &&
          other.objectId == this.objectId &&
          other.city == this.city &&
          other.street == this.street &&
          other.houseNumber == this.houseNumber &&
          other.entrance == this.entrance &&
          other.contacts == this.contacts);
}

class ObjectsTableCompanion extends UpdateCompanion<ObjectsTableData> {
  final Value<int> objectId;
  final Value<String> city;
  final Value<String> street;
  final Value<String> houseNumber;
  final Value<String?> entrance;
  final Value<String?> contacts;
  const ObjectsTableCompanion({
    this.objectId = const Value.absent(),
    this.city = const Value.absent(),
    this.street = const Value.absent(),
    this.houseNumber = const Value.absent(),
    this.entrance = const Value.absent(),
    this.contacts = const Value.absent(),
  });
  ObjectsTableCompanion.insert({
    this.objectId = const Value.absent(),
    required String city,
    required String street,
    required String houseNumber,
    this.entrance = const Value.absent(),
    this.contacts = const Value.absent(),
  }) : city = Value(city),
       street = Value(street),
       houseNumber = Value(houseNumber);
  static Insertable<ObjectsTableData> custom({
    Expression<int>? objectId,
    Expression<String>? city,
    Expression<String>? street,
    Expression<String>? houseNumber,
    Expression<String>? entrance,
    Expression<String>? contacts,
  }) {
    return RawValuesInsertable({
      if (objectId != null) 'object_id': objectId,
      if (city != null) 'city': city,
      if (street != null) 'street': street,
      if (houseNumber != null) 'house_number': houseNumber,
      if (entrance != null) 'entrance': entrance,
      if (contacts != null) 'contacts': contacts,
    });
  }

  ObjectsTableCompanion copyWith({
    Value<int>? objectId,
    Value<String>? city,
    Value<String>? street,
    Value<String>? houseNumber,
    Value<String?>? entrance,
    Value<String?>? contacts,
  }) {
    return ObjectsTableCompanion(
      objectId: objectId ?? this.objectId,
      city: city ?? this.city,
      street: street ?? this.street,
      houseNumber: houseNumber ?? this.houseNumber,
      entrance: entrance ?? this.entrance,
      contacts: contacts ?? this.contacts,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (objectId.present) {
      map['object_id'] = Variable<int>(objectId.value);
    }
    if (city.present) {
      map['city'] = Variable<String>(city.value);
    }
    if (street.present) {
      map['street'] = Variable<String>(street.value);
    }
    if (houseNumber.present) {
      map['house_number'] = Variable<String>(houseNumber.value);
    }
    if (entrance.present) {
      map['entrance'] = Variable<String>(entrance.value);
    }
    if (contacts.present) {
      map['contacts'] = Variable<String>(contacts.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ObjectsTableCompanion(')
          ..write('objectId: $objectId, ')
          ..write('city: $city, ')
          ..write('street: $street, ')
          ..write('houseNumber: $houseNumber, ')
          ..write('entrance: $entrance, ')
          ..write('contacts: $contacts')
          ..write(')'))
        .toString();
  }
}

class $ElevatorsTableTable extends ElevatorsTable
    with TableInfo<$ElevatorsTableTable, ElevatorsTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ElevatorsTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _elevatorIdMeta = const VerificationMeta(
    'elevatorId',
  );
  @override
  late final GeneratedColumn<int> elevatorId = GeneratedColumn<int>(
    'elevator_id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _objectIdMeta = const VerificationMeta(
    'objectId',
  );
  @override
  late final GeneratedColumn<int> objectId = GeneratedColumn<int>(
    'object_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES objects_table (object_id)',
    ),
  );
  static const VerificationMeta _serialNumberMeta = const VerificationMeta(
    'serialNumber',
  );
  @override
  late final GeneratedColumn<String> serialNumber = GeneratedColumn<String>(
    'serial_number',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'),
  );
  static const VerificationMeta _purposeTypeMeta = const VerificationMeta(
    'purposeType',
  );
  @override
  late final GeneratedColumn<String> purposeType = GeneratedColumn<String>(
    'purpose_type',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _modelMeta = const VerificationMeta('model');
  @override
  late final GeneratedColumn<String> model = GeneratedColumn<String>(
    'model',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    elevatorId,
    objectId,
    serialNumber,
    purposeType,
    model,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'elevators_table';
  @override
  VerificationContext validateIntegrity(
    Insertable<ElevatorsTableData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('elevator_id')) {
      context.handle(
        _elevatorIdMeta,
        elevatorId.isAcceptableOrUnknown(data['elevator_id']!, _elevatorIdMeta),
      );
    }
    if (data.containsKey('object_id')) {
      context.handle(
        _objectIdMeta,
        objectId.isAcceptableOrUnknown(data['object_id']!, _objectIdMeta),
      );
    } else if (isInserting) {
      context.missing(_objectIdMeta);
    }
    if (data.containsKey('serial_number')) {
      context.handle(
        _serialNumberMeta,
        serialNumber.isAcceptableOrUnknown(
          data['serial_number']!,
          _serialNumberMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_serialNumberMeta);
    }
    if (data.containsKey('purpose_type')) {
      context.handle(
        _purposeTypeMeta,
        purposeType.isAcceptableOrUnknown(
          data['purpose_type']!,
          _purposeTypeMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_purposeTypeMeta);
    }
    if (data.containsKey('model')) {
      context.handle(
        _modelMeta,
        model.isAcceptableOrUnknown(data['model']!, _modelMeta),
      );
    } else if (isInserting) {
      context.missing(_modelMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {elevatorId};
  @override
  ElevatorsTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ElevatorsTableData(
      elevatorId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}elevator_id'],
      )!,
      objectId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}object_id'],
      )!,
      serialNumber: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}serial_number'],
      )!,
      purposeType: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}purpose_type'],
      )!,
      model: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}model'],
      )!,
    );
  }

  @override
  $ElevatorsTableTable createAlias(String alias) {
    return $ElevatorsTableTable(attachedDatabase, alias);
  }
}

class ElevatorsTableData extends DataClass
    implements Insertable<ElevatorsTableData> {
  final int elevatorId;
  final int objectId;
  final String serialNumber;
  final String purposeType;
  final String model;
  const ElevatorsTableData({
    required this.elevatorId,
    required this.objectId,
    required this.serialNumber,
    required this.purposeType,
    required this.model,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['elevator_id'] = Variable<int>(elevatorId);
    map['object_id'] = Variable<int>(objectId);
    map['serial_number'] = Variable<String>(serialNumber);
    map['purpose_type'] = Variable<String>(purposeType);
    map['model'] = Variable<String>(model);
    return map;
  }

  ElevatorsTableCompanion toCompanion(bool nullToAbsent) {
    return ElevatorsTableCompanion(
      elevatorId: Value(elevatorId),
      objectId: Value(objectId),
      serialNumber: Value(serialNumber),
      purposeType: Value(purposeType),
      model: Value(model),
    );
  }

  factory ElevatorsTableData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ElevatorsTableData(
      elevatorId: serializer.fromJson<int>(json['elevatorId']),
      objectId: serializer.fromJson<int>(json['objectId']),
      serialNumber: serializer.fromJson<String>(json['serialNumber']),
      purposeType: serializer.fromJson<String>(json['purposeType']),
      model: serializer.fromJson<String>(json['model']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'elevatorId': serializer.toJson<int>(elevatorId),
      'objectId': serializer.toJson<int>(objectId),
      'serialNumber': serializer.toJson<String>(serialNumber),
      'purposeType': serializer.toJson<String>(purposeType),
      'model': serializer.toJson<String>(model),
    };
  }

  ElevatorsTableData copyWith({
    int? elevatorId,
    int? objectId,
    String? serialNumber,
    String? purposeType,
    String? model,
  }) => ElevatorsTableData(
    elevatorId: elevatorId ?? this.elevatorId,
    objectId: objectId ?? this.objectId,
    serialNumber: serialNumber ?? this.serialNumber,
    purposeType: purposeType ?? this.purposeType,
    model: model ?? this.model,
  );
  ElevatorsTableData copyWithCompanion(ElevatorsTableCompanion data) {
    return ElevatorsTableData(
      elevatorId: data.elevatorId.present
          ? data.elevatorId.value
          : this.elevatorId,
      objectId: data.objectId.present ? data.objectId.value : this.objectId,
      serialNumber: data.serialNumber.present
          ? data.serialNumber.value
          : this.serialNumber,
      purposeType: data.purposeType.present
          ? data.purposeType.value
          : this.purposeType,
      model: data.model.present ? data.model.value : this.model,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ElevatorsTableData(')
          ..write('elevatorId: $elevatorId, ')
          ..write('objectId: $objectId, ')
          ..write('serialNumber: $serialNumber, ')
          ..write('purposeType: $purposeType, ')
          ..write('model: $model')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(elevatorId, objectId, serialNumber, purposeType, model);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ElevatorsTableData &&
          other.elevatorId == this.elevatorId &&
          other.objectId == this.objectId &&
          other.serialNumber == this.serialNumber &&
          other.purposeType == this.purposeType &&
          other.model == this.model);
}

class ElevatorsTableCompanion extends UpdateCompanion<ElevatorsTableData> {
  final Value<int> elevatorId;
  final Value<int> objectId;
  final Value<String> serialNumber;
  final Value<String> purposeType;
  final Value<String> model;
  const ElevatorsTableCompanion({
    this.elevatorId = const Value.absent(),
    this.objectId = const Value.absent(),
    this.serialNumber = const Value.absent(),
    this.purposeType = const Value.absent(),
    this.model = const Value.absent(),
  });
  ElevatorsTableCompanion.insert({
    this.elevatorId = const Value.absent(),
    required int objectId,
    required String serialNumber,
    required String purposeType,
    required String model,
  }) : objectId = Value(objectId),
       serialNumber = Value(serialNumber),
       purposeType = Value(purposeType),
       model = Value(model);
  static Insertable<ElevatorsTableData> custom({
    Expression<int>? elevatorId,
    Expression<int>? objectId,
    Expression<String>? serialNumber,
    Expression<String>? purposeType,
    Expression<String>? model,
  }) {
    return RawValuesInsertable({
      if (elevatorId != null) 'elevator_id': elevatorId,
      if (objectId != null) 'object_id': objectId,
      if (serialNumber != null) 'serial_number': serialNumber,
      if (purposeType != null) 'purpose_type': purposeType,
      if (model != null) 'model': model,
    });
  }

  ElevatorsTableCompanion copyWith({
    Value<int>? elevatorId,
    Value<int>? objectId,
    Value<String>? serialNumber,
    Value<String>? purposeType,
    Value<String>? model,
  }) {
    return ElevatorsTableCompanion(
      elevatorId: elevatorId ?? this.elevatorId,
      objectId: objectId ?? this.objectId,
      serialNumber: serialNumber ?? this.serialNumber,
      purposeType: purposeType ?? this.purposeType,
      model: model ?? this.model,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (elevatorId.present) {
      map['elevator_id'] = Variable<int>(elevatorId.value);
    }
    if (objectId.present) {
      map['object_id'] = Variable<int>(objectId.value);
    }
    if (serialNumber.present) {
      map['serial_number'] = Variable<String>(serialNumber.value);
    }
    if (purposeType.present) {
      map['purpose_type'] = Variable<String>(purposeType.value);
    }
    if (model.present) {
      map['model'] = Variable<String>(model.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ElevatorsTableCompanion(')
          ..write('elevatorId: $elevatorId, ')
          ..write('objectId: $objectId, ')
          ..write('serialNumber: $serialNumber, ')
          ..write('purposeType: $purposeType, ')
          ..write('model: $model')
          ..write(')'))
        .toString();
  }
}

class $UserElevatorsTableTable extends UserElevatorsTable
    with TableInfo<$UserElevatorsTableTable, UserElevatorsTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $UserElevatorsTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _userIdMeta = const VerificationMeta('userId');
  @override
  late final GeneratedColumn<int> userId = GeneratedColumn<int>(
    'user_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES users_table (user_id)',
    ),
  );
  static const VerificationMeta _elevatorIdMeta = const VerificationMeta(
    'elevatorId',
  );
  @override
  late final GeneratedColumn<int> elevatorId = GeneratedColumn<int>(
    'elevator_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES elevators_table (elevator_id)',
    ),
  );
  static const VerificationMeta _assignedAtMeta = const VerificationMeta(
    'assignedAt',
  );
  @override
  late final GeneratedColumn<DateTime> assignedAt = GeneratedColumn<DateTime>(
    'assigned_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _synchronizedAtMeta = const VerificationMeta(
    'synchronizedAt',
  );
  @override
  late final GeneratedColumn<DateTime> synchronizedAt =
      GeneratedColumn<DateTime>(
        'synchronized_at',
        aliasedName,
        true,
        type: DriftSqlType.dateTime,
        requiredDuringInsert: false,
      );
  @override
  List<GeneratedColumn> get $columns => [
    userId,
    elevatorId,
    assignedAt,
    synchronizedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'user_elevators_table';
  @override
  VerificationContext validateIntegrity(
    Insertable<UserElevatorsTableData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('user_id')) {
      context.handle(
        _userIdMeta,
        userId.isAcceptableOrUnknown(data['user_id']!, _userIdMeta),
      );
    } else if (isInserting) {
      context.missing(_userIdMeta);
    }
    if (data.containsKey('elevator_id')) {
      context.handle(
        _elevatorIdMeta,
        elevatorId.isAcceptableOrUnknown(data['elevator_id']!, _elevatorIdMeta),
      );
    } else if (isInserting) {
      context.missing(_elevatorIdMeta);
    }
    if (data.containsKey('assigned_at')) {
      context.handle(
        _assignedAtMeta,
        assignedAt.isAcceptableOrUnknown(data['assigned_at']!, _assignedAtMeta),
      );
    }
    if (data.containsKey('synchronized_at')) {
      context.handle(
        _synchronizedAtMeta,
        synchronizedAt.isAcceptableOrUnknown(
          data['synchronized_at']!,
          _synchronizedAtMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {userId, elevatorId};
  @override
  UserElevatorsTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return UserElevatorsTableData(
      userId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}user_id'],
      )!,
      elevatorId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}elevator_id'],
      )!,
      assignedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}assigned_at'],
      ),
      synchronizedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}synchronized_at'],
      ),
    );
  }

  @override
  $UserElevatorsTableTable createAlias(String alias) {
    return $UserElevatorsTableTable(attachedDatabase, alias);
  }
}

class UserElevatorsTableData extends DataClass
    implements Insertable<UserElevatorsTableData> {
  final int userId;
  final int elevatorId;
  final DateTime? assignedAt;
  final DateTime? synchronizedAt;
  const UserElevatorsTableData({
    required this.userId,
    required this.elevatorId,
    this.assignedAt,
    this.synchronizedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['user_id'] = Variable<int>(userId);
    map['elevator_id'] = Variable<int>(elevatorId);
    if (!nullToAbsent || assignedAt != null) {
      map['assigned_at'] = Variable<DateTime>(assignedAt);
    }
    if (!nullToAbsent || synchronizedAt != null) {
      map['synchronized_at'] = Variable<DateTime>(synchronizedAt);
    }
    return map;
  }

  UserElevatorsTableCompanion toCompanion(bool nullToAbsent) {
    return UserElevatorsTableCompanion(
      userId: Value(userId),
      elevatorId: Value(elevatorId),
      assignedAt: assignedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(assignedAt),
      synchronizedAt: synchronizedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(synchronizedAt),
    );
  }

  factory UserElevatorsTableData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return UserElevatorsTableData(
      userId: serializer.fromJson<int>(json['userId']),
      elevatorId: serializer.fromJson<int>(json['elevatorId']),
      assignedAt: serializer.fromJson<DateTime?>(json['assignedAt']),
      synchronizedAt: serializer.fromJson<DateTime?>(json['synchronizedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'userId': serializer.toJson<int>(userId),
      'elevatorId': serializer.toJson<int>(elevatorId),
      'assignedAt': serializer.toJson<DateTime?>(assignedAt),
      'synchronizedAt': serializer.toJson<DateTime?>(synchronizedAt),
    };
  }

  UserElevatorsTableData copyWith({
    int? userId,
    int? elevatorId,
    Value<DateTime?> assignedAt = const Value.absent(),
    Value<DateTime?> synchronizedAt = const Value.absent(),
  }) => UserElevatorsTableData(
    userId: userId ?? this.userId,
    elevatorId: elevatorId ?? this.elevatorId,
    assignedAt: assignedAt.present ? assignedAt.value : this.assignedAt,
    synchronizedAt: synchronizedAt.present
        ? synchronizedAt.value
        : this.synchronizedAt,
  );
  UserElevatorsTableData copyWithCompanion(UserElevatorsTableCompanion data) {
    return UserElevatorsTableData(
      userId: data.userId.present ? data.userId.value : this.userId,
      elevatorId: data.elevatorId.present
          ? data.elevatorId.value
          : this.elevatorId,
      assignedAt: data.assignedAt.present
          ? data.assignedAt.value
          : this.assignedAt,
      synchronizedAt: data.synchronizedAt.present
          ? data.synchronizedAt.value
          : this.synchronizedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('UserElevatorsTableData(')
          ..write('userId: $userId, ')
          ..write('elevatorId: $elevatorId, ')
          ..write('assignedAt: $assignedAt, ')
          ..write('synchronizedAt: $synchronizedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(userId, elevatorId, assignedAt, synchronizedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is UserElevatorsTableData &&
          other.userId == this.userId &&
          other.elevatorId == this.elevatorId &&
          other.assignedAt == this.assignedAt &&
          other.synchronizedAt == this.synchronizedAt);
}

class UserElevatorsTableCompanion
    extends UpdateCompanion<UserElevatorsTableData> {
  final Value<int> userId;
  final Value<int> elevatorId;
  final Value<DateTime?> assignedAt;
  final Value<DateTime?> synchronizedAt;
  final Value<int> rowid;
  const UserElevatorsTableCompanion({
    this.userId = const Value.absent(),
    this.elevatorId = const Value.absent(),
    this.assignedAt = const Value.absent(),
    this.synchronizedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  UserElevatorsTableCompanion.insert({
    required int userId,
    required int elevatorId,
    this.assignedAt = const Value.absent(),
    this.synchronizedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : userId = Value(userId),
       elevatorId = Value(elevatorId);
  static Insertable<UserElevatorsTableData> custom({
    Expression<int>? userId,
    Expression<int>? elevatorId,
    Expression<DateTime>? assignedAt,
    Expression<DateTime>? synchronizedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (userId != null) 'user_id': userId,
      if (elevatorId != null) 'elevator_id': elevatorId,
      if (assignedAt != null) 'assigned_at': assignedAt,
      if (synchronizedAt != null) 'synchronized_at': synchronizedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  UserElevatorsTableCompanion copyWith({
    Value<int>? userId,
    Value<int>? elevatorId,
    Value<DateTime?>? assignedAt,
    Value<DateTime?>? synchronizedAt,
    Value<int>? rowid,
  }) {
    return UserElevatorsTableCompanion(
      userId: userId ?? this.userId,
      elevatorId: elevatorId ?? this.elevatorId,
      assignedAt: assignedAt ?? this.assignedAt,
      synchronizedAt: synchronizedAt ?? this.synchronizedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (userId.present) {
      map['user_id'] = Variable<int>(userId.value);
    }
    if (elevatorId.present) {
      map['elevator_id'] = Variable<int>(elevatorId.value);
    }
    if (assignedAt.present) {
      map['assigned_at'] = Variable<DateTime>(assignedAt.value);
    }
    if (synchronizedAt.present) {
      map['synchronized_at'] = Variable<DateTime>(synchronizedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('UserElevatorsTableCompanion(')
          ..write('userId: $userId, ')
          ..write('elevatorId: $elevatorId, ')
          ..write('assignedAt: $assignedAt, ')
          ..write('synchronizedAt: $synchronizedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $EventHistoryTableTable extends EventHistoryTable
    with TableInfo<$EventHistoryTableTable, EventHistoryTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $EventHistoryTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _eventHistoryIdMeta = const VerificationMeta(
    'eventHistoryId',
  );
  @override
  late final GeneratedColumn<int> eventHistoryId = GeneratedColumn<int>(
    'event_history_id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _elevatorIdMeta = const VerificationMeta(
    'elevatorId',
  );
  @override
  late final GeneratedColumn<int> elevatorId = GeneratedColumn<int>(
    'elevator_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES elevators_table (elevator_id)',
    ),
  );
  static const VerificationMeta _eventIdMeta = const VerificationMeta(
    'eventId',
  );
  @override
  late final GeneratedColumn<String> eventId = GeneratedColumn<String>(
    'event_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES event_types_table (event_id)',
    ),
  );
  static const VerificationMeta _receivedAtMeta = const VerificationMeta(
    'receivedAt',
  );
  @override
  late final GeneratedColumn<DateTime> receivedAt = GeneratedColumn<DateTime>(
    'received_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _actionMeta = const VerificationMeta('action');
  @override
  late final GeneratedColumn<String> action = GeneratedColumn<String>(
    'action',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    eventHistoryId,
    elevatorId,
    eventId,
    receivedAt,
    action,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'event_history_table';
  @override
  VerificationContext validateIntegrity(
    Insertable<EventHistoryTableData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('event_history_id')) {
      context.handle(
        _eventHistoryIdMeta,
        eventHistoryId.isAcceptableOrUnknown(
          data['event_history_id']!,
          _eventHistoryIdMeta,
        ),
      );
    }
    if (data.containsKey('elevator_id')) {
      context.handle(
        _elevatorIdMeta,
        elevatorId.isAcceptableOrUnknown(data['elevator_id']!, _elevatorIdMeta),
      );
    } else if (isInserting) {
      context.missing(_elevatorIdMeta);
    }
    if (data.containsKey('event_id')) {
      context.handle(
        _eventIdMeta,
        eventId.isAcceptableOrUnknown(data['event_id']!, _eventIdMeta),
      );
    } else if (isInserting) {
      context.missing(_eventIdMeta);
    }
    if (data.containsKey('received_at')) {
      context.handle(
        _receivedAtMeta,
        receivedAt.isAcceptableOrUnknown(data['received_at']!, _receivedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_receivedAtMeta);
    }
    if (data.containsKey('action')) {
      context.handle(
        _actionMeta,
        action.isAcceptableOrUnknown(data['action']!, _actionMeta),
      );
    } else if (isInserting) {
      context.missing(_actionMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {eventHistoryId};
  @override
  EventHistoryTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return EventHistoryTableData(
      eventHistoryId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}event_history_id'],
      )!,
      elevatorId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}elevator_id'],
      )!,
      eventId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}event_id'],
      )!,
      receivedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}received_at'],
      )!,
      action: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}action'],
      )!,
    );
  }

  @override
  $EventHistoryTableTable createAlias(String alias) {
    return $EventHistoryTableTable(attachedDatabase, alias);
  }
}

class EventHistoryTableData extends DataClass
    implements Insertable<EventHistoryTableData> {
  final int eventHistoryId;
  final int elevatorId;
  final String eventId;
  final DateTime receivedAt;
  final String action;
  const EventHistoryTableData({
    required this.eventHistoryId,
    required this.elevatorId,
    required this.eventId,
    required this.receivedAt,
    required this.action,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['event_history_id'] = Variable<int>(eventHistoryId);
    map['elevator_id'] = Variable<int>(elevatorId);
    map['event_id'] = Variable<String>(eventId);
    map['received_at'] = Variable<DateTime>(receivedAt);
    map['action'] = Variable<String>(action);
    return map;
  }

  EventHistoryTableCompanion toCompanion(bool nullToAbsent) {
    return EventHistoryTableCompanion(
      eventHistoryId: Value(eventHistoryId),
      elevatorId: Value(elevatorId),
      eventId: Value(eventId),
      receivedAt: Value(receivedAt),
      action: Value(action),
    );
  }

  factory EventHistoryTableData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return EventHistoryTableData(
      eventHistoryId: serializer.fromJson<int>(json['eventHistoryId']),
      elevatorId: serializer.fromJson<int>(json['elevatorId']),
      eventId: serializer.fromJson<String>(json['eventId']),
      receivedAt: serializer.fromJson<DateTime>(json['receivedAt']),
      action: serializer.fromJson<String>(json['action']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'eventHistoryId': serializer.toJson<int>(eventHistoryId),
      'elevatorId': serializer.toJson<int>(elevatorId),
      'eventId': serializer.toJson<String>(eventId),
      'receivedAt': serializer.toJson<DateTime>(receivedAt),
      'action': serializer.toJson<String>(action),
    };
  }

  EventHistoryTableData copyWith({
    int? eventHistoryId,
    int? elevatorId,
    String? eventId,
    DateTime? receivedAt,
    String? action,
  }) => EventHistoryTableData(
    eventHistoryId: eventHistoryId ?? this.eventHistoryId,
    elevatorId: elevatorId ?? this.elevatorId,
    eventId: eventId ?? this.eventId,
    receivedAt: receivedAt ?? this.receivedAt,
    action: action ?? this.action,
  );
  EventHistoryTableData copyWithCompanion(EventHistoryTableCompanion data) {
    return EventHistoryTableData(
      eventHistoryId: data.eventHistoryId.present
          ? data.eventHistoryId.value
          : this.eventHistoryId,
      elevatorId: data.elevatorId.present
          ? data.elevatorId.value
          : this.elevatorId,
      eventId: data.eventId.present ? data.eventId.value : this.eventId,
      receivedAt: data.receivedAt.present
          ? data.receivedAt.value
          : this.receivedAt,
      action: data.action.present ? data.action.value : this.action,
    );
  }

  @override
  String toString() {
    return (StringBuffer('EventHistoryTableData(')
          ..write('eventHistoryId: $eventHistoryId, ')
          ..write('elevatorId: $elevatorId, ')
          ..write('eventId: $eventId, ')
          ..write('receivedAt: $receivedAt, ')
          ..write('action: $action')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(eventHistoryId, elevatorId, eventId, receivedAt, action);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is EventHistoryTableData &&
          other.eventHistoryId == this.eventHistoryId &&
          other.elevatorId == this.elevatorId &&
          other.eventId == this.eventId &&
          other.receivedAt == this.receivedAt &&
          other.action == this.action);
}

class EventHistoryTableCompanion
    extends UpdateCompanion<EventHistoryTableData> {
  final Value<int> eventHistoryId;
  final Value<int> elevatorId;
  final Value<String> eventId;
  final Value<DateTime> receivedAt;
  final Value<String> action;
  const EventHistoryTableCompanion({
    this.eventHistoryId = const Value.absent(),
    this.elevatorId = const Value.absent(),
    this.eventId = const Value.absent(),
    this.receivedAt = const Value.absent(),
    this.action = const Value.absent(),
  });
  EventHistoryTableCompanion.insert({
    this.eventHistoryId = const Value.absent(),
    required int elevatorId,
    required String eventId,
    required DateTime receivedAt,
    required String action,
  }) : elevatorId = Value(elevatorId),
       eventId = Value(eventId),
       receivedAt = Value(receivedAt),
       action = Value(action);
  static Insertable<EventHistoryTableData> custom({
    Expression<int>? eventHistoryId,
    Expression<int>? elevatorId,
    Expression<String>? eventId,
    Expression<DateTime>? receivedAt,
    Expression<String>? action,
  }) {
    return RawValuesInsertable({
      if (eventHistoryId != null) 'event_history_id': eventHistoryId,
      if (elevatorId != null) 'elevator_id': elevatorId,
      if (eventId != null) 'event_id': eventId,
      if (receivedAt != null) 'received_at': receivedAt,
      if (action != null) 'action': action,
    });
  }

  EventHistoryTableCompanion copyWith({
    Value<int>? eventHistoryId,
    Value<int>? elevatorId,
    Value<String>? eventId,
    Value<DateTime>? receivedAt,
    Value<String>? action,
  }) {
    return EventHistoryTableCompanion(
      eventHistoryId: eventHistoryId ?? this.eventHistoryId,
      elevatorId: elevatorId ?? this.elevatorId,
      eventId: eventId ?? this.eventId,
      receivedAt: receivedAt ?? this.receivedAt,
      action: action ?? this.action,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (eventHistoryId.present) {
      map['event_history_id'] = Variable<int>(eventHistoryId.value);
    }
    if (elevatorId.present) {
      map['elevator_id'] = Variable<int>(elevatorId.value);
    }
    if (eventId.present) {
      map['event_id'] = Variable<String>(eventId.value);
    }
    if (receivedAt.present) {
      map['received_at'] = Variable<DateTime>(receivedAt.value);
    }
    if (action.present) {
      map['action'] = Variable<String>(action.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('EventHistoryTableCompanion(')
          ..write('eventHistoryId: $eventHistoryId, ')
          ..write('elevatorId: $elevatorId, ')
          ..write('eventId: $eventId, ')
          ..write('receivedAt: $receivedAt, ')
          ..write('action: $action')
          ..write(')'))
        .toString();
  }
}

class $ServiceInfoTableTable extends ServiceInfoTable
    with TableInfo<$ServiceInfoTableTable, ServiceInfoTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ServiceInfoTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _elevatorIdMeta = const VerificationMeta(
    'elevatorId',
  );
  @override
  late final GeneratedColumn<int> elevatorId = GeneratedColumn<int>(
    'elevator_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES elevators_table (elevator_id)',
    ),
  );
  static const VerificationMeta _carryingCapacityKgMeta =
      const VerificationMeta('carryingCapacityKg');
  @override
  late final GeneratedColumn<int> carryingCapacityKg = GeneratedColumn<int>(
    'carrying_capacity_kg',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL CHECK(carrying_capacity_kg > 0)',
  );
  static const VerificationMeta _maxPeopleMeta = const VerificationMeta(
    'maxPeople',
  );
  @override
  late final GeneratedColumn<int> maxPeople = GeneratedColumn<int>(
    'max_people',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL CHECK(max_people > 0)',
  );
  static const VerificationMeta _commissioningDateMeta = const VerificationMeta(
    'commissioningDate',
  );
  @override
  late final GeneratedColumn<DateTime> commissioningDate =
      GeneratedColumn<DateTime>(
        'commissioning_date',
        aliasedName,
        false,
        type: DriftSqlType.dateTime,
        requiredDuringInsert: true,
      );
  static const VerificationMeta _lastMaintenanceDateMeta =
      const VerificationMeta('lastMaintenanceDate');
  @override
  late final GeneratedColumn<DateTime> lastMaintenanceDate =
      GeneratedColumn<DateTime>(
        'last_maintenance_date',
        aliasedName,
        false,
        type: DriftSqlType.dateTime,
        requiredDuringInsert: true,
      );
  static const VerificationMeta _nextMaintenanceDateMeta =
      const VerificationMeta('nextMaintenanceDate');
  @override
  late final GeneratedColumn<DateTime> nextMaintenanceDate =
      GeneratedColumn<DateTime>(
        'next_maintenance_date',
        aliasedName,
        false,
        type: DriftSqlType.dateTime,
        requiredDuringInsert: true,
        $customConstraints:
            'NOT NULL CHECK(next_maintenance_date >= last_maintenance_date)',
      );
  @override
  List<GeneratedColumn> get $columns => [
    elevatorId,
    carryingCapacityKg,
    maxPeople,
    commissioningDate,
    lastMaintenanceDate,
    nextMaintenanceDate,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'service_info_table';
  @override
  VerificationContext validateIntegrity(
    Insertable<ServiceInfoTableData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('elevator_id')) {
      context.handle(
        _elevatorIdMeta,
        elevatorId.isAcceptableOrUnknown(data['elevator_id']!, _elevatorIdMeta),
      );
    }
    if (data.containsKey('carrying_capacity_kg')) {
      context.handle(
        _carryingCapacityKgMeta,
        carryingCapacityKg.isAcceptableOrUnknown(
          data['carrying_capacity_kg']!,
          _carryingCapacityKgMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_carryingCapacityKgMeta);
    }
    if (data.containsKey('max_people')) {
      context.handle(
        _maxPeopleMeta,
        maxPeople.isAcceptableOrUnknown(data['max_people']!, _maxPeopleMeta),
      );
    } else if (isInserting) {
      context.missing(_maxPeopleMeta);
    }
    if (data.containsKey('commissioning_date')) {
      context.handle(
        _commissioningDateMeta,
        commissioningDate.isAcceptableOrUnknown(
          data['commissioning_date']!,
          _commissioningDateMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_commissioningDateMeta);
    }
    if (data.containsKey('last_maintenance_date')) {
      context.handle(
        _lastMaintenanceDateMeta,
        lastMaintenanceDate.isAcceptableOrUnknown(
          data['last_maintenance_date']!,
          _lastMaintenanceDateMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_lastMaintenanceDateMeta);
    }
    if (data.containsKey('next_maintenance_date')) {
      context.handle(
        _nextMaintenanceDateMeta,
        nextMaintenanceDate.isAcceptableOrUnknown(
          data['next_maintenance_date']!,
          _nextMaintenanceDateMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_nextMaintenanceDateMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {elevatorId};
  @override
  ServiceInfoTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ServiceInfoTableData(
      elevatorId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}elevator_id'],
      )!,
      carryingCapacityKg: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}carrying_capacity_kg'],
      )!,
      maxPeople: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}max_people'],
      )!,
      commissioningDate: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}commissioning_date'],
      )!,
      lastMaintenanceDate: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}last_maintenance_date'],
      )!,
      nextMaintenanceDate: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}next_maintenance_date'],
      )!,
    );
  }

  @override
  $ServiceInfoTableTable createAlias(String alias) {
    return $ServiceInfoTableTable(attachedDatabase, alias);
  }
}

class ServiceInfoTableData extends DataClass
    implements Insertable<ServiceInfoTableData> {
  final int elevatorId;
  final int carryingCapacityKg;
  final int maxPeople;
  final DateTime commissioningDate;
  final DateTime lastMaintenanceDate;
  final DateTime nextMaintenanceDate;
  const ServiceInfoTableData({
    required this.elevatorId,
    required this.carryingCapacityKg,
    required this.maxPeople,
    required this.commissioningDate,
    required this.lastMaintenanceDate,
    required this.nextMaintenanceDate,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['elevator_id'] = Variable<int>(elevatorId);
    map['carrying_capacity_kg'] = Variable<int>(carryingCapacityKg);
    map['max_people'] = Variable<int>(maxPeople);
    map['commissioning_date'] = Variable<DateTime>(commissioningDate);
    map['last_maintenance_date'] = Variable<DateTime>(lastMaintenanceDate);
    map['next_maintenance_date'] = Variable<DateTime>(nextMaintenanceDate);
    return map;
  }

  ServiceInfoTableCompanion toCompanion(bool nullToAbsent) {
    return ServiceInfoTableCompanion(
      elevatorId: Value(elevatorId),
      carryingCapacityKg: Value(carryingCapacityKg),
      maxPeople: Value(maxPeople),
      commissioningDate: Value(commissioningDate),
      lastMaintenanceDate: Value(lastMaintenanceDate),
      nextMaintenanceDate: Value(nextMaintenanceDate),
    );
  }

  factory ServiceInfoTableData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ServiceInfoTableData(
      elevatorId: serializer.fromJson<int>(json['elevatorId']),
      carryingCapacityKg: serializer.fromJson<int>(json['carryingCapacityKg']),
      maxPeople: serializer.fromJson<int>(json['maxPeople']),
      commissioningDate: serializer.fromJson<DateTime>(
        json['commissioningDate'],
      ),
      lastMaintenanceDate: serializer.fromJson<DateTime>(
        json['lastMaintenanceDate'],
      ),
      nextMaintenanceDate: serializer.fromJson<DateTime>(
        json['nextMaintenanceDate'],
      ),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'elevatorId': serializer.toJson<int>(elevatorId),
      'carryingCapacityKg': serializer.toJson<int>(carryingCapacityKg),
      'maxPeople': serializer.toJson<int>(maxPeople),
      'commissioningDate': serializer.toJson<DateTime>(commissioningDate),
      'lastMaintenanceDate': serializer.toJson<DateTime>(lastMaintenanceDate),
      'nextMaintenanceDate': serializer.toJson<DateTime>(nextMaintenanceDate),
    };
  }

  ServiceInfoTableData copyWith({
    int? elevatorId,
    int? carryingCapacityKg,
    int? maxPeople,
    DateTime? commissioningDate,
    DateTime? lastMaintenanceDate,
    DateTime? nextMaintenanceDate,
  }) => ServiceInfoTableData(
    elevatorId: elevatorId ?? this.elevatorId,
    carryingCapacityKg: carryingCapacityKg ?? this.carryingCapacityKg,
    maxPeople: maxPeople ?? this.maxPeople,
    commissioningDate: commissioningDate ?? this.commissioningDate,
    lastMaintenanceDate: lastMaintenanceDate ?? this.lastMaintenanceDate,
    nextMaintenanceDate: nextMaintenanceDate ?? this.nextMaintenanceDate,
  );
  ServiceInfoTableData copyWithCompanion(ServiceInfoTableCompanion data) {
    return ServiceInfoTableData(
      elevatorId: data.elevatorId.present
          ? data.elevatorId.value
          : this.elevatorId,
      carryingCapacityKg: data.carryingCapacityKg.present
          ? data.carryingCapacityKg.value
          : this.carryingCapacityKg,
      maxPeople: data.maxPeople.present ? data.maxPeople.value : this.maxPeople,
      commissioningDate: data.commissioningDate.present
          ? data.commissioningDate.value
          : this.commissioningDate,
      lastMaintenanceDate: data.lastMaintenanceDate.present
          ? data.lastMaintenanceDate.value
          : this.lastMaintenanceDate,
      nextMaintenanceDate: data.nextMaintenanceDate.present
          ? data.nextMaintenanceDate.value
          : this.nextMaintenanceDate,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ServiceInfoTableData(')
          ..write('elevatorId: $elevatorId, ')
          ..write('carryingCapacityKg: $carryingCapacityKg, ')
          ..write('maxPeople: $maxPeople, ')
          ..write('commissioningDate: $commissioningDate, ')
          ..write('lastMaintenanceDate: $lastMaintenanceDate, ')
          ..write('nextMaintenanceDate: $nextMaintenanceDate')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    elevatorId,
    carryingCapacityKg,
    maxPeople,
    commissioningDate,
    lastMaintenanceDate,
    nextMaintenanceDate,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ServiceInfoTableData &&
          other.elevatorId == this.elevatorId &&
          other.carryingCapacityKg == this.carryingCapacityKg &&
          other.maxPeople == this.maxPeople &&
          other.commissioningDate == this.commissioningDate &&
          other.lastMaintenanceDate == this.lastMaintenanceDate &&
          other.nextMaintenanceDate == this.nextMaintenanceDate);
}

class ServiceInfoTableCompanion extends UpdateCompanion<ServiceInfoTableData> {
  final Value<int> elevatorId;
  final Value<int> carryingCapacityKg;
  final Value<int> maxPeople;
  final Value<DateTime> commissioningDate;
  final Value<DateTime> lastMaintenanceDate;
  final Value<DateTime> nextMaintenanceDate;
  const ServiceInfoTableCompanion({
    this.elevatorId = const Value.absent(),
    this.carryingCapacityKg = const Value.absent(),
    this.maxPeople = const Value.absent(),
    this.commissioningDate = const Value.absent(),
    this.lastMaintenanceDate = const Value.absent(),
    this.nextMaintenanceDate = const Value.absent(),
  });
  ServiceInfoTableCompanion.insert({
    this.elevatorId = const Value.absent(),
    required int carryingCapacityKg,
    required int maxPeople,
    required DateTime commissioningDate,
    required DateTime lastMaintenanceDate,
    required DateTime nextMaintenanceDate,
  }) : carryingCapacityKg = Value(carryingCapacityKg),
       maxPeople = Value(maxPeople),
       commissioningDate = Value(commissioningDate),
       lastMaintenanceDate = Value(lastMaintenanceDate),
       nextMaintenanceDate = Value(nextMaintenanceDate);
  static Insertable<ServiceInfoTableData> custom({
    Expression<int>? elevatorId,
    Expression<int>? carryingCapacityKg,
    Expression<int>? maxPeople,
    Expression<DateTime>? commissioningDate,
    Expression<DateTime>? lastMaintenanceDate,
    Expression<DateTime>? nextMaintenanceDate,
  }) {
    return RawValuesInsertable({
      if (elevatorId != null) 'elevator_id': elevatorId,
      if (carryingCapacityKg != null)
        'carrying_capacity_kg': carryingCapacityKg,
      if (maxPeople != null) 'max_people': maxPeople,
      if (commissioningDate != null) 'commissioning_date': commissioningDate,
      if (lastMaintenanceDate != null)
        'last_maintenance_date': lastMaintenanceDate,
      if (nextMaintenanceDate != null)
        'next_maintenance_date': nextMaintenanceDate,
    });
  }

  ServiceInfoTableCompanion copyWith({
    Value<int>? elevatorId,
    Value<int>? carryingCapacityKg,
    Value<int>? maxPeople,
    Value<DateTime>? commissioningDate,
    Value<DateTime>? lastMaintenanceDate,
    Value<DateTime>? nextMaintenanceDate,
  }) {
    return ServiceInfoTableCompanion(
      elevatorId: elevatorId ?? this.elevatorId,
      carryingCapacityKg: carryingCapacityKg ?? this.carryingCapacityKg,
      maxPeople: maxPeople ?? this.maxPeople,
      commissioningDate: commissioningDate ?? this.commissioningDate,
      lastMaintenanceDate: lastMaintenanceDate ?? this.lastMaintenanceDate,
      nextMaintenanceDate: nextMaintenanceDate ?? this.nextMaintenanceDate,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (elevatorId.present) {
      map['elevator_id'] = Variable<int>(elevatorId.value);
    }
    if (carryingCapacityKg.present) {
      map['carrying_capacity_kg'] = Variable<int>(carryingCapacityKg.value);
    }
    if (maxPeople.present) {
      map['max_people'] = Variable<int>(maxPeople.value);
    }
    if (commissioningDate.present) {
      map['commissioning_date'] = Variable<DateTime>(commissioningDate.value);
    }
    if (lastMaintenanceDate.present) {
      map['last_maintenance_date'] = Variable<DateTime>(
        lastMaintenanceDate.value,
      );
    }
    if (nextMaintenanceDate.present) {
      map['next_maintenance_date'] = Variable<DateTime>(
        nextMaintenanceDate.value,
      );
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ServiceInfoTableCompanion(')
          ..write('elevatorId: $elevatorId, ')
          ..write('carryingCapacityKg: $carryingCapacityKg, ')
          ..write('maxPeople: $maxPeople, ')
          ..write('commissioningDate: $commissioningDate, ')
          ..write('lastMaintenanceDate: $lastMaintenanceDate, ')
          ..write('nextMaintenanceDate: $nextMaintenanceDate')
          ..write(')'))
        .toString();
  }
}

class $ActiveEventsTableTable extends ActiveEventsTable
    with TableInfo<$ActiveEventsTableTable, ActiveEventsTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ActiveEventsTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _elevatorIdMeta = const VerificationMeta(
    'elevatorId',
  );
  @override
  late final GeneratedColumn<int> elevatorId = GeneratedColumn<int>(
    'elevator_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES elevators_table (elevator_id)',
    ),
  );
  static const VerificationMeta _eventIdMeta = const VerificationMeta(
    'eventId',
  );
  @override
  late final GeneratedColumn<String> eventId = GeneratedColumn<String>(
    'event_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES event_types_table (event_id)',
    ),
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [elevatorId, eventId, updatedAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'active_events_table';
  @override
  VerificationContext validateIntegrity(
    Insertable<ActiveEventsTableData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('elevator_id')) {
      context.handle(
        _elevatorIdMeta,
        elevatorId.isAcceptableOrUnknown(data['elevator_id']!, _elevatorIdMeta),
      );
    } else if (isInserting) {
      context.missing(_elevatorIdMeta);
    }
    if (data.containsKey('event_id')) {
      context.handle(
        _eventIdMeta,
        eventId.isAcceptableOrUnknown(data['event_id']!, _eventIdMeta),
      );
    } else if (isInserting) {
      context.missing(_eventIdMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {elevatorId, eventId};
  @override
  ActiveEventsTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ActiveEventsTableData(
      elevatorId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}elevator_id'],
      )!,
      eventId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}event_id'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
    );
  }

  @override
  $ActiveEventsTableTable createAlias(String alias) {
    return $ActiveEventsTableTable(attachedDatabase, alias);
  }
}

class ActiveEventsTableData extends DataClass
    implements Insertable<ActiveEventsTableData> {
  final int elevatorId;
  final String eventId;
  final DateTime updatedAt;
  const ActiveEventsTableData({
    required this.elevatorId,
    required this.eventId,
    required this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['elevator_id'] = Variable<int>(elevatorId);
    map['event_id'] = Variable<String>(eventId);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  ActiveEventsTableCompanion toCompanion(bool nullToAbsent) {
    return ActiveEventsTableCompanion(
      elevatorId: Value(elevatorId),
      eventId: Value(eventId),
      updatedAt: Value(updatedAt),
    );
  }

  factory ActiveEventsTableData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ActiveEventsTableData(
      elevatorId: serializer.fromJson<int>(json['elevatorId']),
      eventId: serializer.fromJson<String>(json['eventId']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'elevatorId': serializer.toJson<int>(elevatorId),
      'eventId': serializer.toJson<String>(eventId),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  ActiveEventsTableData copyWith({
    int? elevatorId,
    String? eventId,
    DateTime? updatedAt,
  }) => ActiveEventsTableData(
    elevatorId: elevatorId ?? this.elevatorId,
    eventId: eventId ?? this.eventId,
    updatedAt: updatedAt ?? this.updatedAt,
  );
  ActiveEventsTableData copyWithCompanion(ActiveEventsTableCompanion data) {
    return ActiveEventsTableData(
      elevatorId: data.elevatorId.present
          ? data.elevatorId.value
          : this.elevatorId,
      eventId: data.eventId.present ? data.eventId.value : this.eventId,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ActiveEventsTableData(')
          ..write('elevatorId: $elevatorId, ')
          ..write('eventId: $eventId, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(elevatorId, eventId, updatedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ActiveEventsTableData &&
          other.elevatorId == this.elevatorId &&
          other.eventId == this.eventId &&
          other.updatedAt == this.updatedAt);
}

class ActiveEventsTableCompanion
    extends UpdateCompanion<ActiveEventsTableData> {
  final Value<int> elevatorId;
  final Value<String> eventId;
  final Value<DateTime> updatedAt;
  final Value<int> rowid;
  const ActiveEventsTableCompanion({
    this.elevatorId = const Value.absent(),
    this.eventId = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ActiveEventsTableCompanion.insert({
    required int elevatorId,
    required String eventId,
    required DateTime updatedAt,
    this.rowid = const Value.absent(),
  }) : elevatorId = Value(elevatorId),
       eventId = Value(eventId),
       updatedAt = Value(updatedAt);
  static Insertable<ActiveEventsTableData> custom({
    Expression<int>? elevatorId,
    Expression<String>? eventId,
    Expression<DateTime>? updatedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (elevatorId != null) 'elevator_id': elevatorId,
      if (eventId != null) 'event_id': eventId,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ActiveEventsTableCompanion copyWith({
    Value<int>? elevatorId,
    Value<String>? eventId,
    Value<DateTime>? updatedAt,
    Value<int>? rowid,
  }) {
    return ActiveEventsTableCompanion(
      elevatorId: elevatorId ?? this.elevatorId,
      eventId: eventId ?? this.eventId,
      updatedAt: updatedAt ?? this.updatedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (elevatorId.present) {
      map['elevator_id'] = Variable<int>(elevatorId.value);
    }
    if (eventId.present) {
      map['event_id'] = Variable<String>(eventId.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ActiveEventsTableCompanion(')
          ..write('elevatorId: $elevatorId, ')
          ..write('eventId: $eventId, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $EventCategoriesTableTable eventCategoriesTable =
      $EventCategoriesTableTable(this);
  late final $EventTypesTableTable eventTypesTable = $EventTypesTableTable(
    this,
  );
  late final $UsersTableTable usersTable = $UsersTableTable(this);
  late final $ObjectsTableTable objectsTable = $ObjectsTableTable(this);
  late final $ElevatorsTableTable elevatorsTable = $ElevatorsTableTable(this);
  late final $UserElevatorsTableTable userElevatorsTable =
      $UserElevatorsTableTable(this);
  late final $EventHistoryTableTable eventHistoryTable =
      $EventHistoryTableTable(this);
  late final $ServiceInfoTableTable serviceInfoTable = $ServiceInfoTableTable(
    this,
  );
  late final $ActiveEventsTableTable activeEventsTable =
      $ActiveEventsTableTable(this);
  late final HistoryEventsDao historyEventsDao = HistoryEventsDao(
    this as AppDatabase,
  );
  late final ActiveEventsDao activeEventsDao = ActiveEventsDao(
    this as AppDatabase,
  );
  late final ElevatorsDao elevatorsDao = ElevatorsDao(this as AppDatabase);
  late final EventTypesDao eventTypesDao = EventTypesDao(this as AppDatabase);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    eventCategoriesTable,
    eventTypesTable,
    usersTable,
    objectsTable,
    elevatorsTable,
    userElevatorsTable,
    eventHistoryTable,
    serviceInfoTable,
    activeEventsTable,
  ];
}

typedef $$EventCategoriesTableTableCreateCompanionBuilder =
    EventCategoriesTableCompanion Function({
      Value<int> categoryId,
      required String name,
    });
typedef $$EventCategoriesTableTableUpdateCompanionBuilder =
    EventCategoriesTableCompanion Function({
      Value<int> categoryId,
      Value<String> name,
    });

final class $$EventCategoriesTableTableReferences
    extends
        BaseReferences<
          _$AppDatabase,
          $EventCategoriesTableTable,
          EventCategoriesTableData
        > {
  $$EventCategoriesTableTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static MultiTypedResultKey<$EventTypesTableTable, List<EventTypesTableData>>
  _eventTypesTableRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.eventTypesTable,
    aliasName: $_aliasNameGenerator(
      db.eventCategoriesTable.categoryId,
      db.eventTypesTable.categoryId,
    ),
  );

  $$EventTypesTableTableProcessedTableManager get eventTypesTableRefs {
    final manager =
        $$EventTypesTableTableTableManager($_db, $_db.eventTypesTable).filter(
          (f) => f.categoryId.categoryId.sqlEquals(
            $_itemColumn<int>('category_id')!,
          ),
        );

    final cache = $_typedResult.readTableOrNull(
      _eventTypesTableRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$EventCategoriesTableTableFilterComposer
    extends Composer<_$AppDatabase, $EventCategoriesTableTable> {
  $$EventCategoriesTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get categoryId => $composableBuilder(
    column: $table.categoryId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> eventTypesTableRefs(
    Expression<bool> Function($$EventTypesTableTableFilterComposer f) f,
  ) {
    final $$EventTypesTableTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.categoryId,
      referencedTable: $db.eventTypesTable,
      getReferencedColumn: (t) => t.categoryId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$EventTypesTableTableFilterComposer(
            $db: $db,
            $table: $db.eventTypesTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$EventCategoriesTableTableOrderingComposer
    extends Composer<_$AppDatabase, $EventCategoriesTableTable> {
  $$EventCategoriesTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get categoryId => $composableBuilder(
    column: $table.categoryId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$EventCategoriesTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $EventCategoriesTableTable> {
  $$EventCategoriesTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get categoryId => $composableBuilder(
    column: $table.categoryId,
    builder: (column) => column,
  );

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  Expression<T> eventTypesTableRefs<T extends Object>(
    Expression<T> Function($$EventTypesTableTableAnnotationComposer a) f,
  ) {
    final $$EventTypesTableTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.categoryId,
      referencedTable: $db.eventTypesTable,
      getReferencedColumn: (t) => t.categoryId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$EventTypesTableTableAnnotationComposer(
            $db: $db,
            $table: $db.eventTypesTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$EventCategoriesTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $EventCategoriesTableTable,
          EventCategoriesTableData,
          $$EventCategoriesTableTableFilterComposer,
          $$EventCategoriesTableTableOrderingComposer,
          $$EventCategoriesTableTableAnnotationComposer,
          $$EventCategoriesTableTableCreateCompanionBuilder,
          $$EventCategoriesTableTableUpdateCompanionBuilder,
          (EventCategoriesTableData, $$EventCategoriesTableTableReferences),
          EventCategoriesTableData,
          PrefetchHooks Function({bool eventTypesTableRefs})
        > {
  $$EventCategoriesTableTableTableManager(
    _$AppDatabase db,
    $EventCategoriesTableTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$EventCategoriesTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$EventCategoriesTableTableOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer: () =>
              $$EventCategoriesTableTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<int> categoryId = const Value.absent(),
                Value<String> name = const Value.absent(),
              }) => EventCategoriesTableCompanion(
                categoryId: categoryId,
                name: name,
              ),
          createCompanionCallback:
              ({
                Value<int> categoryId = const Value.absent(),
                required String name,
              }) => EventCategoriesTableCompanion.insert(
                categoryId: categoryId,
                name: name,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$EventCategoriesTableTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({eventTypesTableRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (eventTypesTableRefs) db.eventTypesTable,
              ],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (eventTypesTableRefs)
                    await $_getPrefetchedData<
                      EventCategoriesTableData,
                      $EventCategoriesTableTable,
                      EventTypesTableData
                    >(
                      currentTable: table,
                      referencedTable: $$EventCategoriesTableTableReferences
                          ._eventTypesTableRefsTable(db),
                      managerFromTypedResult: (p0) =>
                          $$EventCategoriesTableTableReferences(
                            db,
                            table,
                            p0,
                          ).eventTypesTableRefs,
                      referencedItemsForCurrentItem: (item, referencedItems) =>
                          referencedItems.where(
                            (e) => e.categoryId == item.categoryId,
                          ),
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$EventCategoriesTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $EventCategoriesTableTable,
      EventCategoriesTableData,
      $$EventCategoriesTableTableFilterComposer,
      $$EventCategoriesTableTableOrderingComposer,
      $$EventCategoriesTableTableAnnotationComposer,
      $$EventCategoriesTableTableCreateCompanionBuilder,
      $$EventCategoriesTableTableUpdateCompanionBuilder,
      (EventCategoriesTableData, $$EventCategoriesTableTableReferences),
      EventCategoriesTableData,
      PrefetchHooks Function({bool eventTypesTableRefs})
    >;
typedef $$EventTypesTableTableCreateCompanionBuilder =
    EventTypesTableCompanion Function({
      required String eventId,
      required String eventName,
      required String iconName,
      required int priority,
      required int categoryId,
      Value<int> rowid,
    });
typedef $$EventTypesTableTableUpdateCompanionBuilder =
    EventTypesTableCompanion Function({
      Value<String> eventId,
      Value<String> eventName,
      Value<String> iconName,
      Value<int> priority,
      Value<int> categoryId,
      Value<int> rowid,
    });

final class $$EventTypesTableTableReferences
    extends
        BaseReferences<
          _$AppDatabase,
          $EventTypesTableTable,
          EventTypesTableData
        > {
  $$EventTypesTableTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $EventCategoriesTableTable _categoryIdTable(_$AppDatabase db) =>
      db.eventCategoriesTable.createAlias(
        $_aliasNameGenerator(
          db.eventTypesTable.categoryId,
          db.eventCategoriesTable.categoryId,
        ),
      );

  $$EventCategoriesTableTableProcessedTableManager get categoryId {
    final $_column = $_itemColumn<int>('category_id')!;

    final manager = $$EventCategoriesTableTableTableManager(
      $_db,
      $_db.eventCategoriesTable,
    ).filter((f) => f.categoryId.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_categoryIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static MultiTypedResultKey<
    $EventHistoryTableTable,
    List<EventHistoryTableData>
  >
  _eventHistoryTableRefsTable(_$AppDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.eventHistoryTable,
        aliasName: $_aliasNameGenerator(
          db.eventTypesTable.eventId,
          db.eventHistoryTable.eventId,
        ),
      );

  $$EventHistoryTableTableProcessedTableManager get eventHistoryTableRefs {
    final manager =
        $$EventHistoryTableTableTableManager(
          $_db,
          $_db.eventHistoryTable,
        ).filter(
          (f) => f.eventId.eventId.sqlEquals($_itemColumn<String>('event_id')!),
        );

    final cache = $_typedResult.readTableOrNull(
      _eventHistoryTableRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<
    $ActiveEventsTableTable,
    List<ActiveEventsTableData>
  >
  _activeEventsTableRefsTable(_$AppDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.activeEventsTable,
        aliasName: $_aliasNameGenerator(
          db.eventTypesTable.eventId,
          db.activeEventsTable.eventId,
        ),
      );

  $$ActiveEventsTableTableProcessedTableManager get activeEventsTableRefs {
    final manager =
        $$ActiveEventsTableTableTableManager(
          $_db,
          $_db.activeEventsTable,
        ).filter(
          (f) => f.eventId.eventId.sqlEquals($_itemColumn<String>('event_id')!),
        );

    final cache = $_typedResult.readTableOrNull(
      _activeEventsTableRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$EventTypesTableTableFilterComposer
    extends Composer<_$AppDatabase, $EventTypesTableTable> {
  $$EventTypesTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get eventId => $composableBuilder(
    column: $table.eventId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get eventName => $composableBuilder(
    column: $table.eventName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get iconName => $composableBuilder(
    column: $table.iconName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get priority => $composableBuilder(
    column: $table.priority,
    builder: (column) => ColumnFilters(column),
  );

  $$EventCategoriesTableTableFilterComposer get categoryId {
    final $$EventCategoriesTableTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.categoryId,
      referencedTable: $db.eventCategoriesTable,
      getReferencedColumn: (t) => t.categoryId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$EventCategoriesTableTableFilterComposer(
            $db: $db,
            $table: $db.eventCategoriesTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<bool> eventHistoryTableRefs(
    Expression<bool> Function($$EventHistoryTableTableFilterComposer f) f,
  ) {
    final $$EventHistoryTableTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.eventId,
      referencedTable: $db.eventHistoryTable,
      getReferencedColumn: (t) => t.eventId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$EventHistoryTableTableFilterComposer(
            $db: $db,
            $table: $db.eventHistoryTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> activeEventsTableRefs(
    Expression<bool> Function($$ActiveEventsTableTableFilterComposer f) f,
  ) {
    final $$ActiveEventsTableTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.eventId,
      referencedTable: $db.activeEventsTable,
      getReferencedColumn: (t) => t.eventId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ActiveEventsTableTableFilterComposer(
            $db: $db,
            $table: $db.activeEventsTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$EventTypesTableTableOrderingComposer
    extends Composer<_$AppDatabase, $EventTypesTableTable> {
  $$EventTypesTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get eventId => $composableBuilder(
    column: $table.eventId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get eventName => $composableBuilder(
    column: $table.eventName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get iconName => $composableBuilder(
    column: $table.iconName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get priority => $composableBuilder(
    column: $table.priority,
    builder: (column) => ColumnOrderings(column),
  );

  $$EventCategoriesTableTableOrderingComposer get categoryId {
    final $$EventCategoriesTableTableOrderingComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.categoryId,
          referencedTable: $db.eventCategoriesTable,
          getReferencedColumn: (t) => t.categoryId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$EventCategoriesTableTableOrderingComposer(
                $db: $db,
                $table: $db.eventCategoriesTable,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return composer;
  }
}

class $$EventTypesTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $EventTypesTableTable> {
  $$EventTypesTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get eventId =>
      $composableBuilder(column: $table.eventId, builder: (column) => column);

  GeneratedColumn<String> get eventName =>
      $composableBuilder(column: $table.eventName, builder: (column) => column);

  GeneratedColumn<String> get iconName =>
      $composableBuilder(column: $table.iconName, builder: (column) => column);

  GeneratedColumn<int> get priority =>
      $composableBuilder(column: $table.priority, builder: (column) => column);

  $$EventCategoriesTableTableAnnotationComposer get categoryId {
    final $$EventCategoriesTableTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.categoryId,
          referencedTable: $db.eventCategoriesTable,
          getReferencedColumn: (t) => t.categoryId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$EventCategoriesTableTableAnnotationComposer(
                $db: $db,
                $table: $db.eventCategoriesTable,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return composer;
  }

  Expression<T> eventHistoryTableRefs<T extends Object>(
    Expression<T> Function($$EventHistoryTableTableAnnotationComposer a) f,
  ) {
    final $$EventHistoryTableTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.eventId,
          referencedTable: $db.eventHistoryTable,
          getReferencedColumn: (t) => t.eventId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$EventHistoryTableTableAnnotationComposer(
                $db: $db,
                $table: $db.eventHistoryTable,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }

  Expression<T> activeEventsTableRefs<T extends Object>(
    Expression<T> Function($$ActiveEventsTableTableAnnotationComposer a) f,
  ) {
    final $$ActiveEventsTableTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.eventId,
          referencedTable: $db.activeEventsTable,
          getReferencedColumn: (t) => t.eventId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$ActiveEventsTableTableAnnotationComposer(
                $db: $db,
                $table: $db.activeEventsTable,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }
}

class $$EventTypesTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $EventTypesTableTable,
          EventTypesTableData,
          $$EventTypesTableTableFilterComposer,
          $$EventTypesTableTableOrderingComposer,
          $$EventTypesTableTableAnnotationComposer,
          $$EventTypesTableTableCreateCompanionBuilder,
          $$EventTypesTableTableUpdateCompanionBuilder,
          (EventTypesTableData, $$EventTypesTableTableReferences),
          EventTypesTableData,
          PrefetchHooks Function({
            bool categoryId,
            bool eventHistoryTableRefs,
            bool activeEventsTableRefs,
          })
        > {
  $$EventTypesTableTableTableManager(
    _$AppDatabase db,
    $EventTypesTableTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$EventTypesTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$EventTypesTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$EventTypesTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> eventId = const Value.absent(),
                Value<String> eventName = const Value.absent(),
                Value<String> iconName = const Value.absent(),
                Value<int> priority = const Value.absent(),
                Value<int> categoryId = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => EventTypesTableCompanion(
                eventId: eventId,
                eventName: eventName,
                iconName: iconName,
                priority: priority,
                categoryId: categoryId,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String eventId,
                required String eventName,
                required String iconName,
                required int priority,
                required int categoryId,
                Value<int> rowid = const Value.absent(),
              }) => EventTypesTableCompanion.insert(
                eventId: eventId,
                eventName: eventName,
                iconName: iconName,
                priority: priority,
                categoryId: categoryId,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$EventTypesTableTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({
                categoryId = false,
                eventHistoryTableRefs = false,
                activeEventsTableRefs = false,
              }) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (eventHistoryTableRefs) db.eventHistoryTable,
                    if (activeEventsTableRefs) db.activeEventsTable,
                  ],
                  addJoins:
                      <
                        T extends TableManagerState<
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic
                        >
                      >(state) {
                        if (categoryId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.categoryId,
                                    referencedTable:
                                        $$EventTypesTableTableReferences
                                            ._categoryIdTable(db),
                                    referencedColumn:
                                        $$EventTypesTableTableReferences
                                            ._categoryIdTable(db)
                                            .categoryId,
                                  )
                                  as T;
                        }

                        return state;
                      },
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (eventHistoryTableRefs)
                        await $_getPrefetchedData<
                          EventTypesTableData,
                          $EventTypesTableTable,
                          EventHistoryTableData
                        >(
                          currentTable: table,
                          referencedTable: $$EventTypesTableTableReferences
                              ._eventHistoryTableRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$EventTypesTableTableReferences(
                                db,
                                table,
                                p0,
                              ).eventHistoryTableRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.eventId == item.eventId,
                              ),
                          typedResults: items,
                        ),
                      if (activeEventsTableRefs)
                        await $_getPrefetchedData<
                          EventTypesTableData,
                          $EventTypesTableTable,
                          ActiveEventsTableData
                        >(
                          currentTable: table,
                          referencedTable: $$EventTypesTableTableReferences
                              ._activeEventsTableRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$EventTypesTableTableReferences(
                                db,
                                table,
                                p0,
                              ).activeEventsTableRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.eventId == item.eventId,
                              ),
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$EventTypesTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $EventTypesTableTable,
      EventTypesTableData,
      $$EventTypesTableTableFilterComposer,
      $$EventTypesTableTableOrderingComposer,
      $$EventTypesTableTableAnnotationComposer,
      $$EventTypesTableTableCreateCompanionBuilder,
      $$EventTypesTableTableUpdateCompanionBuilder,
      (EventTypesTableData, $$EventTypesTableTableReferences),
      EventTypesTableData,
      PrefetchHooks Function({
        bool categoryId,
        bool eventHistoryTableRefs,
        bool activeEventsTableRefs,
      })
    >;
typedef $$UsersTableTableCreateCompanionBuilder =
    UsersTableCompanion Function({
      Value<int> userId,
      required String login,
      required String name,
    });
typedef $$UsersTableTableUpdateCompanionBuilder =
    UsersTableCompanion Function({
      Value<int> userId,
      Value<String> login,
      Value<String> name,
    });

final class $$UsersTableTableReferences
    extends BaseReferences<_$AppDatabase, $UsersTableTable, UsersTableData> {
  $$UsersTableTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<
    $UserElevatorsTableTable,
    List<UserElevatorsTableData>
  >
  _userElevatorsTableRefsTable(_$AppDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.userElevatorsTable,
        aliasName: $_aliasNameGenerator(
          db.usersTable.userId,
          db.userElevatorsTable.userId,
        ),
      );

  $$UserElevatorsTableTableProcessedTableManager get userElevatorsTableRefs {
    final manager = $$UserElevatorsTableTableTableManager(
      $_db,
      $_db.userElevatorsTable,
    ).filter((f) => f.userId.userId.sqlEquals($_itemColumn<int>('user_id')!));

    final cache = $_typedResult.readTableOrNull(
      _userElevatorsTableRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$UsersTableTableFilterComposer
    extends Composer<_$AppDatabase, $UsersTableTable> {
  $$UsersTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get userId => $composableBuilder(
    column: $table.userId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get login => $composableBuilder(
    column: $table.login,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> userElevatorsTableRefs(
    Expression<bool> Function($$UserElevatorsTableTableFilterComposer f) f,
  ) {
    final $$UserElevatorsTableTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.userId,
      referencedTable: $db.userElevatorsTable,
      getReferencedColumn: (t) => t.userId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UserElevatorsTableTableFilterComposer(
            $db: $db,
            $table: $db.userElevatorsTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$UsersTableTableOrderingComposer
    extends Composer<_$AppDatabase, $UsersTableTable> {
  $$UsersTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get userId => $composableBuilder(
    column: $table.userId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get login => $composableBuilder(
    column: $table.login,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$UsersTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $UsersTableTable> {
  $$UsersTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get userId =>
      $composableBuilder(column: $table.userId, builder: (column) => column);

  GeneratedColumn<String> get login =>
      $composableBuilder(column: $table.login, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  Expression<T> userElevatorsTableRefs<T extends Object>(
    Expression<T> Function($$UserElevatorsTableTableAnnotationComposer a) f,
  ) {
    final $$UserElevatorsTableTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.userId,
          referencedTable: $db.userElevatorsTable,
          getReferencedColumn: (t) => t.userId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$UserElevatorsTableTableAnnotationComposer(
                $db: $db,
                $table: $db.userElevatorsTable,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }
}

class $$UsersTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $UsersTableTable,
          UsersTableData,
          $$UsersTableTableFilterComposer,
          $$UsersTableTableOrderingComposer,
          $$UsersTableTableAnnotationComposer,
          $$UsersTableTableCreateCompanionBuilder,
          $$UsersTableTableUpdateCompanionBuilder,
          (UsersTableData, $$UsersTableTableReferences),
          UsersTableData,
          PrefetchHooks Function({bool userElevatorsTableRefs})
        > {
  $$UsersTableTableTableManager(_$AppDatabase db, $UsersTableTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$UsersTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$UsersTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$UsersTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> userId = const Value.absent(),
                Value<String> login = const Value.absent(),
                Value<String> name = const Value.absent(),
              }) =>
                  UsersTableCompanion(userId: userId, login: login, name: name),
          createCompanionCallback:
              ({
                Value<int> userId = const Value.absent(),
                required String login,
                required String name,
              }) => UsersTableCompanion.insert(
                userId: userId,
                login: login,
                name: name,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$UsersTableTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({userElevatorsTableRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (userElevatorsTableRefs) db.userElevatorsTable,
              ],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (userElevatorsTableRefs)
                    await $_getPrefetchedData<
                      UsersTableData,
                      $UsersTableTable,
                      UserElevatorsTableData
                    >(
                      currentTable: table,
                      referencedTable: $$UsersTableTableReferences
                          ._userElevatorsTableRefsTable(db),
                      managerFromTypedResult: (p0) =>
                          $$UsersTableTableReferences(
                            db,
                            table,
                            p0,
                          ).userElevatorsTableRefs,
                      referencedItemsForCurrentItem: (item, referencedItems) =>
                          referencedItems.where((e) => e.userId == item.userId),
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$UsersTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $UsersTableTable,
      UsersTableData,
      $$UsersTableTableFilterComposer,
      $$UsersTableTableOrderingComposer,
      $$UsersTableTableAnnotationComposer,
      $$UsersTableTableCreateCompanionBuilder,
      $$UsersTableTableUpdateCompanionBuilder,
      (UsersTableData, $$UsersTableTableReferences),
      UsersTableData,
      PrefetchHooks Function({bool userElevatorsTableRefs})
    >;
typedef $$ObjectsTableTableCreateCompanionBuilder =
    ObjectsTableCompanion Function({
      Value<int> objectId,
      required String city,
      required String street,
      required String houseNumber,
      Value<String?> entrance,
      Value<String?> contacts,
    });
typedef $$ObjectsTableTableUpdateCompanionBuilder =
    ObjectsTableCompanion Function({
      Value<int> objectId,
      Value<String> city,
      Value<String> street,
      Value<String> houseNumber,
      Value<String?> entrance,
      Value<String?> contacts,
    });

final class $$ObjectsTableTableReferences
    extends
        BaseReferences<_$AppDatabase, $ObjectsTableTable, ObjectsTableData> {
  $$ObjectsTableTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$ElevatorsTableTable, List<ElevatorsTableData>>
  _elevatorsTableRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.elevatorsTable,
    aliasName: $_aliasNameGenerator(
      db.objectsTable.objectId,
      db.elevatorsTable.objectId,
    ),
  );

  $$ElevatorsTableTableProcessedTableManager get elevatorsTableRefs {
    final manager = $$ElevatorsTableTableTableManager($_db, $_db.elevatorsTable)
        .filter(
          (f) => f.objectId.objectId.sqlEquals($_itemColumn<int>('object_id')!),
        );

    final cache = $_typedResult.readTableOrNull(_elevatorsTableRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$ObjectsTableTableFilterComposer
    extends Composer<_$AppDatabase, $ObjectsTableTable> {
  $$ObjectsTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get objectId => $composableBuilder(
    column: $table.objectId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get city => $composableBuilder(
    column: $table.city,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get street => $composableBuilder(
    column: $table.street,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get houseNumber => $composableBuilder(
    column: $table.houseNumber,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get entrance => $composableBuilder(
    column: $table.entrance,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get contacts => $composableBuilder(
    column: $table.contacts,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> elevatorsTableRefs(
    Expression<bool> Function($$ElevatorsTableTableFilterComposer f) f,
  ) {
    final $$ElevatorsTableTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.objectId,
      referencedTable: $db.elevatorsTable,
      getReferencedColumn: (t) => t.objectId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ElevatorsTableTableFilterComposer(
            $db: $db,
            $table: $db.elevatorsTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$ObjectsTableTableOrderingComposer
    extends Composer<_$AppDatabase, $ObjectsTableTable> {
  $$ObjectsTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get objectId => $composableBuilder(
    column: $table.objectId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get city => $composableBuilder(
    column: $table.city,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get street => $composableBuilder(
    column: $table.street,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get houseNumber => $composableBuilder(
    column: $table.houseNumber,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get entrance => $composableBuilder(
    column: $table.entrance,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get contacts => $composableBuilder(
    column: $table.contacts,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$ObjectsTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $ObjectsTableTable> {
  $$ObjectsTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get objectId =>
      $composableBuilder(column: $table.objectId, builder: (column) => column);

  GeneratedColumn<String> get city =>
      $composableBuilder(column: $table.city, builder: (column) => column);

  GeneratedColumn<String> get street =>
      $composableBuilder(column: $table.street, builder: (column) => column);

  GeneratedColumn<String> get houseNumber => $composableBuilder(
    column: $table.houseNumber,
    builder: (column) => column,
  );

  GeneratedColumn<String> get entrance =>
      $composableBuilder(column: $table.entrance, builder: (column) => column);

  GeneratedColumn<String> get contacts =>
      $composableBuilder(column: $table.contacts, builder: (column) => column);

  Expression<T> elevatorsTableRefs<T extends Object>(
    Expression<T> Function($$ElevatorsTableTableAnnotationComposer a) f,
  ) {
    final $$ElevatorsTableTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.objectId,
      referencedTable: $db.elevatorsTable,
      getReferencedColumn: (t) => t.objectId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ElevatorsTableTableAnnotationComposer(
            $db: $db,
            $table: $db.elevatorsTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$ObjectsTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ObjectsTableTable,
          ObjectsTableData,
          $$ObjectsTableTableFilterComposer,
          $$ObjectsTableTableOrderingComposer,
          $$ObjectsTableTableAnnotationComposer,
          $$ObjectsTableTableCreateCompanionBuilder,
          $$ObjectsTableTableUpdateCompanionBuilder,
          (ObjectsTableData, $$ObjectsTableTableReferences),
          ObjectsTableData,
          PrefetchHooks Function({bool elevatorsTableRefs})
        > {
  $$ObjectsTableTableTableManager(_$AppDatabase db, $ObjectsTableTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ObjectsTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ObjectsTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ObjectsTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> objectId = const Value.absent(),
                Value<String> city = const Value.absent(),
                Value<String> street = const Value.absent(),
                Value<String> houseNumber = const Value.absent(),
                Value<String?> entrance = const Value.absent(),
                Value<String?> contacts = const Value.absent(),
              }) => ObjectsTableCompanion(
                objectId: objectId,
                city: city,
                street: street,
                houseNumber: houseNumber,
                entrance: entrance,
                contacts: contacts,
              ),
          createCompanionCallback:
              ({
                Value<int> objectId = const Value.absent(),
                required String city,
                required String street,
                required String houseNumber,
                Value<String?> entrance = const Value.absent(),
                Value<String?> contacts = const Value.absent(),
              }) => ObjectsTableCompanion.insert(
                objectId: objectId,
                city: city,
                street: street,
                houseNumber: houseNumber,
                entrance: entrance,
                contacts: contacts,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$ObjectsTableTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({elevatorsTableRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (elevatorsTableRefs) db.elevatorsTable,
              ],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (elevatorsTableRefs)
                    await $_getPrefetchedData<
                      ObjectsTableData,
                      $ObjectsTableTable,
                      ElevatorsTableData
                    >(
                      currentTable: table,
                      referencedTable: $$ObjectsTableTableReferences
                          ._elevatorsTableRefsTable(db),
                      managerFromTypedResult: (p0) =>
                          $$ObjectsTableTableReferences(
                            db,
                            table,
                            p0,
                          ).elevatorsTableRefs,
                      referencedItemsForCurrentItem: (item, referencedItems) =>
                          referencedItems.where(
                            (e) => e.objectId == item.objectId,
                          ),
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$ObjectsTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ObjectsTableTable,
      ObjectsTableData,
      $$ObjectsTableTableFilterComposer,
      $$ObjectsTableTableOrderingComposer,
      $$ObjectsTableTableAnnotationComposer,
      $$ObjectsTableTableCreateCompanionBuilder,
      $$ObjectsTableTableUpdateCompanionBuilder,
      (ObjectsTableData, $$ObjectsTableTableReferences),
      ObjectsTableData,
      PrefetchHooks Function({bool elevatorsTableRefs})
    >;
typedef $$ElevatorsTableTableCreateCompanionBuilder =
    ElevatorsTableCompanion Function({
      Value<int> elevatorId,
      required int objectId,
      required String serialNumber,
      required String purposeType,
      required String model,
    });
typedef $$ElevatorsTableTableUpdateCompanionBuilder =
    ElevatorsTableCompanion Function({
      Value<int> elevatorId,
      Value<int> objectId,
      Value<String> serialNumber,
      Value<String> purposeType,
      Value<String> model,
    });

final class $$ElevatorsTableTableReferences
    extends
        BaseReferences<
          _$AppDatabase,
          $ElevatorsTableTable,
          ElevatorsTableData
        > {
  $$ElevatorsTableTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $ObjectsTableTable _objectIdTable(_$AppDatabase db) =>
      db.objectsTable.createAlias(
        $_aliasNameGenerator(
          db.elevatorsTable.objectId,
          db.objectsTable.objectId,
        ),
      );

  $$ObjectsTableTableProcessedTableManager get objectId {
    final $_column = $_itemColumn<int>('object_id')!;

    final manager = $$ObjectsTableTableTableManager(
      $_db,
      $_db.objectsTable,
    ).filter((f) => f.objectId.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_objectIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static MultiTypedResultKey<
    $UserElevatorsTableTable,
    List<UserElevatorsTableData>
  >
  _userElevatorsTableRefsTable(_$AppDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.userElevatorsTable,
        aliasName: $_aliasNameGenerator(
          db.elevatorsTable.elevatorId,
          db.userElevatorsTable.elevatorId,
        ),
      );

  $$UserElevatorsTableTableProcessedTableManager get userElevatorsTableRefs {
    final manager =
        $$UserElevatorsTableTableTableManager(
          $_db,
          $_db.userElevatorsTable,
        ).filter(
          (f) => f.elevatorId.elevatorId.sqlEquals(
            $_itemColumn<int>('elevator_id')!,
          ),
        );

    final cache = $_typedResult.readTableOrNull(
      _userElevatorsTableRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<
    $EventHistoryTableTable,
    List<EventHistoryTableData>
  >
  _eventHistoryTableRefsTable(_$AppDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.eventHistoryTable,
        aliasName: $_aliasNameGenerator(
          db.elevatorsTable.elevatorId,
          db.eventHistoryTable.elevatorId,
        ),
      );

  $$EventHistoryTableTableProcessedTableManager get eventHistoryTableRefs {
    final manager =
        $$EventHistoryTableTableTableManager(
          $_db,
          $_db.eventHistoryTable,
        ).filter(
          (f) => f.elevatorId.elevatorId.sqlEquals(
            $_itemColumn<int>('elevator_id')!,
          ),
        );

    final cache = $_typedResult.readTableOrNull(
      _eventHistoryTableRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$ServiceInfoTableTable, List<ServiceInfoTableData>>
  _serviceInfoTableRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.serviceInfoTable,
    aliasName: $_aliasNameGenerator(
      db.elevatorsTable.elevatorId,
      db.serviceInfoTable.elevatorId,
    ),
  );

  $$ServiceInfoTableTableProcessedTableManager get serviceInfoTableRefs {
    final manager =
        $$ServiceInfoTableTableTableManager($_db, $_db.serviceInfoTable).filter(
          (f) => f.elevatorId.elevatorId.sqlEquals(
            $_itemColumn<int>('elevator_id')!,
          ),
        );

    final cache = $_typedResult.readTableOrNull(
      _serviceInfoTableRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<
    $ActiveEventsTableTable,
    List<ActiveEventsTableData>
  >
  _activeEventsTableRefsTable(_$AppDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.activeEventsTable,
        aliasName: $_aliasNameGenerator(
          db.elevatorsTable.elevatorId,
          db.activeEventsTable.elevatorId,
        ),
      );

  $$ActiveEventsTableTableProcessedTableManager get activeEventsTableRefs {
    final manager =
        $$ActiveEventsTableTableTableManager(
          $_db,
          $_db.activeEventsTable,
        ).filter(
          (f) => f.elevatorId.elevatorId.sqlEquals(
            $_itemColumn<int>('elevator_id')!,
          ),
        );

    final cache = $_typedResult.readTableOrNull(
      _activeEventsTableRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$ElevatorsTableTableFilterComposer
    extends Composer<_$AppDatabase, $ElevatorsTableTable> {
  $$ElevatorsTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get elevatorId => $composableBuilder(
    column: $table.elevatorId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get serialNumber => $composableBuilder(
    column: $table.serialNumber,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get purposeType => $composableBuilder(
    column: $table.purposeType,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get model => $composableBuilder(
    column: $table.model,
    builder: (column) => ColumnFilters(column),
  );

  $$ObjectsTableTableFilterComposer get objectId {
    final $$ObjectsTableTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.objectId,
      referencedTable: $db.objectsTable,
      getReferencedColumn: (t) => t.objectId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ObjectsTableTableFilterComposer(
            $db: $db,
            $table: $db.objectsTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<bool> userElevatorsTableRefs(
    Expression<bool> Function($$UserElevatorsTableTableFilterComposer f) f,
  ) {
    final $$UserElevatorsTableTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.elevatorId,
      referencedTable: $db.userElevatorsTable,
      getReferencedColumn: (t) => t.elevatorId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UserElevatorsTableTableFilterComposer(
            $db: $db,
            $table: $db.userElevatorsTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> eventHistoryTableRefs(
    Expression<bool> Function($$EventHistoryTableTableFilterComposer f) f,
  ) {
    final $$EventHistoryTableTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.elevatorId,
      referencedTable: $db.eventHistoryTable,
      getReferencedColumn: (t) => t.elevatorId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$EventHistoryTableTableFilterComposer(
            $db: $db,
            $table: $db.eventHistoryTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> serviceInfoTableRefs(
    Expression<bool> Function($$ServiceInfoTableTableFilterComposer f) f,
  ) {
    final $$ServiceInfoTableTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.elevatorId,
      referencedTable: $db.serviceInfoTable,
      getReferencedColumn: (t) => t.elevatorId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ServiceInfoTableTableFilterComposer(
            $db: $db,
            $table: $db.serviceInfoTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> activeEventsTableRefs(
    Expression<bool> Function($$ActiveEventsTableTableFilterComposer f) f,
  ) {
    final $$ActiveEventsTableTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.elevatorId,
      referencedTable: $db.activeEventsTable,
      getReferencedColumn: (t) => t.elevatorId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ActiveEventsTableTableFilterComposer(
            $db: $db,
            $table: $db.activeEventsTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$ElevatorsTableTableOrderingComposer
    extends Composer<_$AppDatabase, $ElevatorsTableTable> {
  $$ElevatorsTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get elevatorId => $composableBuilder(
    column: $table.elevatorId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get serialNumber => $composableBuilder(
    column: $table.serialNumber,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get purposeType => $composableBuilder(
    column: $table.purposeType,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get model => $composableBuilder(
    column: $table.model,
    builder: (column) => ColumnOrderings(column),
  );

  $$ObjectsTableTableOrderingComposer get objectId {
    final $$ObjectsTableTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.objectId,
      referencedTable: $db.objectsTable,
      getReferencedColumn: (t) => t.objectId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ObjectsTableTableOrderingComposer(
            $db: $db,
            $table: $db.objectsTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ElevatorsTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $ElevatorsTableTable> {
  $$ElevatorsTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get elevatorId => $composableBuilder(
    column: $table.elevatorId,
    builder: (column) => column,
  );

  GeneratedColumn<String> get serialNumber => $composableBuilder(
    column: $table.serialNumber,
    builder: (column) => column,
  );

  GeneratedColumn<String> get purposeType => $composableBuilder(
    column: $table.purposeType,
    builder: (column) => column,
  );

  GeneratedColumn<String> get model =>
      $composableBuilder(column: $table.model, builder: (column) => column);

  $$ObjectsTableTableAnnotationComposer get objectId {
    final $$ObjectsTableTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.objectId,
      referencedTable: $db.objectsTable,
      getReferencedColumn: (t) => t.objectId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ObjectsTableTableAnnotationComposer(
            $db: $db,
            $table: $db.objectsTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<T> userElevatorsTableRefs<T extends Object>(
    Expression<T> Function($$UserElevatorsTableTableAnnotationComposer a) f,
  ) {
    final $$UserElevatorsTableTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.elevatorId,
          referencedTable: $db.userElevatorsTable,
          getReferencedColumn: (t) => t.elevatorId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$UserElevatorsTableTableAnnotationComposer(
                $db: $db,
                $table: $db.userElevatorsTable,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }

  Expression<T> eventHistoryTableRefs<T extends Object>(
    Expression<T> Function($$EventHistoryTableTableAnnotationComposer a) f,
  ) {
    final $$EventHistoryTableTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.elevatorId,
          referencedTable: $db.eventHistoryTable,
          getReferencedColumn: (t) => t.elevatorId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$EventHistoryTableTableAnnotationComposer(
                $db: $db,
                $table: $db.eventHistoryTable,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }

  Expression<T> serviceInfoTableRefs<T extends Object>(
    Expression<T> Function($$ServiceInfoTableTableAnnotationComposer a) f,
  ) {
    final $$ServiceInfoTableTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.elevatorId,
      referencedTable: $db.serviceInfoTable,
      getReferencedColumn: (t) => t.elevatorId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ServiceInfoTableTableAnnotationComposer(
            $db: $db,
            $table: $db.serviceInfoTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> activeEventsTableRefs<T extends Object>(
    Expression<T> Function($$ActiveEventsTableTableAnnotationComposer a) f,
  ) {
    final $$ActiveEventsTableTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.elevatorId,
          referencedTable: $db.activeEventsTable,
          getReferencedColumn: (t) => t.elevatorId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$ActiveEventsTableTableAnnotationComposer(
                $db: $db,
                $table: $db.activeEventsTable,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }
}

class $$ElevatorsTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ElevatorsTableTable,
          ElevatorsTableData,
          $$ElevatorsTableTableFilterComposer,
          $$ElevatorsTableTableOrderingComposer,
          $$ElevatorsTableTableAnnotationComposer,
          $$ElevatorsTableTableCreateCompanionBuilder,
          $$ElevatorsTableTableUpdateCompanionBuilder,
          (ElevatorsTableData, $$ElevatorsTableTableReferences),
          ElevatorsTableData,
          PrefetchHooks Function({
            bool objectId,
            bool userElevatorsTableRefs,
            bool eventHistoryTableRefs,
            bool serviceInfoTableRefs,
            bool activeEventsTableRefs,
          })
        > {
  $$ElevatorsTableTableTableManager(
    _$AppDatabase db,
    $ElevatorsTableTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ElevatorsTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ElevatorsTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ElevatorsTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> elevatorId = const Value.absent(),
                Value<int> objectId = const Value.absent(),
                Value<String> serialNumber = const Value.absent(),
                Value<String> purposeType = const Value.absent(),
                Value<String> model = const Value.absent(),
              }) => ElevatorsTableCompanion(
                elevatorId: elevatorId,
                objectId: objectId,
                serialNumber: serialNumber,
                purposeType: purposeType,
                model: model,
              ),
          createCompanionCallback:
              ({
                Value<int> elevatorId = const Value.absent(),
                required int objectId,
                required String serialNumber,
                required String purposeType,
                required String model,
              }) => ElevatorsTableCompanion.insert(
                elevatorId: elevatorId,
                objectId: objectId,
                serialNumber: serialNumber,
                purposeType: purposeType,
                model: model,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$ElevatorsTableTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({
                objectId = false,
                userElevatorsTableRefs = false,
                eventHistoryTableRefs = false,
                serviceInfoTableRefs = false,
                activeEventsTableRefs = false,
              }) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (userElevatorsTableRefs) db.userElevatorsTable,
                    if (eventHistoryTableRefs) db.eventHistoryTable,
                    if (serviceInfoTableRefs) db.serviceInfoTable,
                    if (activeEventsTableRefs) db.activeEventsTable,
                  ],
                  addJoins:
                      <
                        T extends TableManagerState<
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic
                        >
                      >(state) {
                        if (objectId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.objectId,
                                    referencedTable:
                                        $$ElevatorsTableTableReferences
                                            ._objectIdTable(db),
                                    referencedColumn:
                                        $$ElevatorsTableTableReferences
                                            ._objectIdTable(db)
                                            .objectId,
                                  )
                                  as T;
                        }

                        return state;
                      },
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (userElevatorsTableRefs)
                        await $_getPrefetchedData<
                          ElevatorsTableData,
                          $ElevatorsTableTable,
                          UserElevatorsTableData
                        >(
                          currentTable: table,
                          referencedTable: $$ElevatorsTableTableReferences
                              ._userElevatorsTableRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$ElevatorsTableTableReferences(
                                db,
                                table,
                                p0,
                              ).userElevatorsTableRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.elevatorId == item.elevatorId,
                              ),
                          typedResults: items,
                        ),
                      if (eventHistoryTableRefs)
                        await $_getPrefetchedData<
                          ElevatorsTableData,
                          $ElevatorsTableTable,
                          EventHistoryTableData
                        >(
                          currentTable: table,
                          referencedTable: $$ElevatorsTableTableReferences
                              ._eventHistoryTableRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$ElevatorsTableTableReferences(
                                db,
                                table,
                                p0,
                              ).eventHistoryTableRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.elevatorId == item.elevatorId,
                              ),
                          typedResults: items,
                        ),
                      if (serviceInfoTableRefs)
                        await $_getPrefetchedData<
                          ElevatorsTableData,
                          $ElevatorsTableTable,
                          ServiceInfoTableData
                        >(
                          currentTable: table,
                          referencedTable: $$ElevatorsTableTableReferences
                              ._serviceInfoTableRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$ElevatorsTableTableReferences(
                                db,
                                table,
                                p0,
                              ).serviceInfoTableRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.elevatorId == item.elevatorId,
                              ),
                          typedResults: items,
                        ),
                      if (activeEventsTableRefs)
                        await $_getPrefetchedData<
                          ElevatorsTableData,
                          $ElevatorsTableTable,
                          ActiveEventsTableData
                        >(
                          currentTable: table,
                          referencedTable: $$ElevatorsTableTableReferences
                              ._activeEventsTableRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$ElevatorsTableTableReferences(
                                db,
                                table,
                                p0,
                              ).activeEventsTableRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.elevatorId == item.elevatorId,
                              ),
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$ElevatorsTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ElevatorsTableTable,
      ElevatorsTableData,
      $$ElevatorsTableTableFilterComposer,
      $$ElevatorsTableTableOrderingComposer,
      $$ElevatorsTableTableAnnotationComposer,
      $$ElevatorsTableTableCreateCompanionBuilder,
      $$ElevatorsTableTableUpdateCompanionBuilder,
      (ElevatorsTableData, $$ElevatorsTableTableReferences),
      ElevatorsTableData,
      PrefetchHooks Function({
        bool objectId,
        bool userElevatorsTableRefs,
        bool eventHistoryTableRefs,
        bool serviceInfoTableRefs,
        bool activeEventsTableRefs,
      })
    >;
typedef $$UserElevatorsTableTableCreateCompanionBuilder =
    UserElevatorsTableCompanion Function({
      required int userId,
      required int elevatorId,
      Value<DateTime?> assignedAt,
      Value<DateTime?> synchronizedAt,
      Value<int> rowid,
    });
typedef $$UserElevatorsTableTableUpdateCompanionBuilder =
    UserElevatorsTableCompanion Function({
      Value<int> userId,
      Value<int> elevatorId,
      Value<DateTime?> assignedAt,
      Value<DateTime?> synchronizedAt,
      Value<int> rowid,
    });

final class $$UserElevatorsTableTableReferences
    extends
        BaseReferences<
          _$AppDatabase,
          $UserElevatorsTableTable,
          UserElevatorsTableData
        > {
  $$UserElevatorsTableTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $UsersTableTable _userIdTable(_$AppDatabase db) =>
      db.usersTable.createAlias(
        $_aliasNameGenerator(
          db.userElevatorsTable.userId,
          db.usersTable.userId,
        ),
      );

  $$UsersTableTableProcessedTableManager get userId {
    final $_column = $_itemColumn<int>('user_id')!;

    final manager = $$UsersTableTableTableManager(
      $_db,
      $_db.usersTable,
    ).filter((f) => f.userId.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_userIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $ElevatorsTableTable _elevatorIdTable(_$AppDatabase db) =>
      db.elevatorsTable.createAlias(
        $_aliasNameGenerator(
          db.userElevatorsTable.elevatorId,
          db.elevatorsTable.elevatorId,
        ),
      );

  $$ElevatorsTableTableProcessedTableManager get elevatorId {
    final $_column = $_itemColumn<int>('elevator_id')!;

    final manager = $$ElevatorsTableTableTableManager(
      $_db,
      $_db.elevatorsTable,
    ).filter((f) => f.elevatorId.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_elevatorIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$UserElevatorsTableTableFilterComposer
    extends Composer<_$AppDatabase, $UserElevatorsTableTable> {
  $$UserElevatorsTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<DateTime> get assignedAt => $composableBuilder(
    column: $table.assignedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get synchronizedAt => $composableBuilder(
    column: $table.synchronizedAt,
    builder: (column) => ColumnFilters(column),
  );

  $$UsersTableTableFilterComposer get userId {
    final $$UsersTableTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.userId,
      referencedTable: $db.usersTable,
      getReferencedColumn: (t) => t.userId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UsersTableTableFilterComposer(
            $db: $db,
            $table: $db.usersTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$ElevatorsTableTableFilterComposer get elevatorId {
    final $$ElevatorsTableTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.elevatorId,
      referencedTable: $db.elevatorsTable,
      getReferencedColumn: (t) => t.elevatorId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ElevatorsTableTableFilterComposer(
            $db: $db,
            $table: $db.elevatorsTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$UserElevatorsTableTableOrderingComposer
    extends Composer<_$AppDatabase, $UserElevatorsTableTable> {
  $$UserElevatorsTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<DateTime> get assignedAt => $composableBuilder(
    column: $table.assignedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get synchronizedAt => $composableBuilder(
    column: $table.synchronizedAt,
    builder: (column) => ColumnOrderings(column),
  );

  $$UsersTableTableOrderingComposer get userId {
    final $$UsersTableTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.userId,
      referencedTable: $db.usersTable,
      getReferencedColumn: (t) => t.userId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UsersTableTableOrderingComposer(
            $db: $db,
            $table: $db.usersTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$ElevatorsTableTableOrderingComposer get elevatorId {
    final $$ElevatorsTableTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.elevatorId,
      referencedTable: $db.elevatorsTable,
      getReferencedColumn: (t) => t.elevatorId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ElevatorsTableTableOrderingComposer(
            $db: $db,
            $table: $db.elevatorsTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$UserElevatorsTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $UserElevatorsTableTable> {
  $$UserElevatorsTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<DateTime> get assignedAt => $composableBuilder(
    column: $table.assignedAt,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get synchronizedAt => $composableBuilder(
    column: $table.synchronizedAt,
    builder: (column) => column,
  );

  $$UsersTableTableAnnotationComposer get userId {
    final $$UsersTableTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.userId,
      referencedTable: $db.usersTable,
      getReferencedColumn: (t) => t.userId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UsersTableTableAnnotationComposer(
            $db: $db,
            $table: $db.usersTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$ElevatorsTableTableAnnotationComposer get elevatorId {
    final $$ElevatorsTableTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.elevatorId,
      referencedTable: $db.elevatorsTable,
      getReferencedColumn: (t) => t.elevatorId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ElevatorsTableTableAnnotationComposer(
            $db: $db,
            $table: $db.elevatorsTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$UserElevatorsTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $UserElevatorsTableTable,
          UserElevatorsTableData,
          $$UserElevatorsTableTableFilterComposer,
          $$UserElevatorsTableTableOrderingComposer,
          $$UserElevatorsTableTableAnnotationComposer,
          $$UserElevatorsTableTableCreateCompanionBuilder,
          $$UserElevatorsTableTableUpdateCompanionBuilder,
          (UserElevatorsTableData, $$UserElevatorsTableTableReferences),
          UserElevatorsTableData,
          PrefetchHooks Function({bool userId, bool elevatorId})
        > {
  $$UserElevatorsTableTableTableManager(
    _$AppDatabase db,
    $UserElevatorsTableTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$UserElevatorsTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$UserElevatorsTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$UserElevatorsTableTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<int> userId = const Value.absent(),
                Value<int> elevatorId = const Value.absent(),
                Value<DateTime?> assignedAt = const Value.absent(),
                Value<DateTime?> synchronizedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => UserElevatorsTableCompanion(
                userId: userId,
                elevatorId: elevatorId,
                assignedAt: assignedAt,
                synchronizedAt: synchronizedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required int userId,
                required int elevatorId,
                Value<DateTime?> assignedAt = const Value.absent(),
                Value<DateTime?> synchronizedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => UserElevatorsTableCompanion.insert(
                userId: userId,
                elevatorId: elevatorId,
                assignedAt: assignedAt,
                synchronizedAt: synchronizedAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$UserElevatorsTableTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({userId = false, elevatorId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (userId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.userId,
                                referencedTable:
                                    $$UserElevatorsTableTableReferences
                                        ._userIdTable(db),
                                referencedColumn:
                                    $$UserElevatorsTableTableReferences
                                        ._userIdTable(db)
                                        .userId,
                              )
                              as T;
                    }
                    if (elevatorId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.elevatorId,
                                referencedTable:
                                    $$UserElevatorsTableTableReferences
                                        ._elevatorIdTable(db),
                                referencedColumn:
                                    $$UserElevatorsTableTableReferences
                                        ._elevatorIdTable(db)
                                        .elevatorId,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$UserElevatorsTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $UserElevatorsTableTable,
      UserElevatorsTableData,
      $$UserElevatorsTableTableFilterComposer,
      $$UserElevatorsTableTableOrderingComposer,
      $$UserElevatorsTableTableAnnotationComposer,
      $$UserElevatorsTableTableCreateCompanionBuilder,
      $$UserElevatorsTableTableUpdateCompanionBuilder,
      (UserElevatorsTableData, $$UserElevatorsTableTableReferences),
      UserElevatorsTableData,
      PrefetchHooks Function({bool userId, bool elevatorId})
    >;
typedef $$EventHistoryTableTableCreateCompanionBuilder =
    EventHistoryTableCompanion Function({
      Value<int> eventHistoryId,
      required int elevatorId,
      required String eventId,
      required DateTime receivedAt,
      required String action,
    });
typedef $$EventHistoryTableTableUpdateCompanionBuilder =
    EventHistoryTableCompanion Function({
      Value<int> eventHistoryId,
      Value<int> elevatorId,
      Value<String> eventId,
      Value<DateTime> receivedAt,
      Value<String> action,
    });

final class $$EventHistoryTableTableReferences
    extends
        BaseReferences<
          _$AppDatabase,
          $EventHistoryTableTable,
          EventHistoryTableData
        > {
  $$EventHistoryTableTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $ElevatorsTableTable _elevatorIdTable(_$AppDatabase db) =>
      db.elevatorsTable.createAlias(
        $_aliasNameGenerator(
          db.eventHistoryTable.elevatorId,
          db.elevatorsTable.elevatorId,
        ),
      );

  $$ElevatorsTableTableProcessedTableManager get elevatorId {
    final $_column = $_itemColumn<int>('elevator_id')!;

    final manager = $$ElevatorsTableTableTableManager(
      $_db,
      $_db.elevatorsTable,
    ).filter((f) => f.elevatorId.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_elevatorIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $EventTypesTableTable _eventIdTable(_$AppDatabase db) =>
      db.eventTypesTable.createAlias(
        $_aliasNameGenerator(
          db.eventHistoryTable.eventId,
          db.eventTypesTable.eventId,
        ),
      );

  $$EventTypesTableTableProcessedTableManager get eventId {
    final $_column = $_itemColumn<String>('event_id')!;

    final manager = $$EventTypesTableTableTableManager(
      $_db,
      $_db.eventTypesTable,
    ).filter((f) => f.eventId.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_eventIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$EventHistoryTableTableFilterComposer
    extends Composer<_$AppDatabase, $EventHistoryTableTable> {
  $$EventHistoryTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get eventHistoryId => $composableBuilder(
    column: $table.eventHistoryId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get receivedAt => $composableBuilder(
    column: $table.receivedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get action => $composableBuilder(
    column: $table.action,
    builder: (column) => ColumnFilters(column),
  );

  $$ElevatorsTableTableFilterComposer get elevatorId {
    final $$ElevatorsTableTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.elevatorId,
      referencedTable: $db.elevatorsTable,
      getReferencedColumn: (t) => t.elevatorId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ElevatorsTableTableFilterComposer(
            $db: $db,
            $table: $db.elevatorsTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$EventTypesTableTableFilterComposer get eventId {
    final $$EventTypesTableTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.eventId,
      referencedTable: $db.eventTypesTable,
      getReferencedColumn: (t) => t.eventId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$EventTypesTableTableFilterComposer(
            $db: $db,
            $table: $db.eventTypesTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$EventHistoryTableTableOrderingComposer
    extends Composer<_$AppDatabase, $EventHistoryTableTable> {
  $$EventHistoryTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get eventHistoryId => $composableBuilder(
    column: $table.eventHistoryId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get receivedAt => $composableBuilder(
    column: $table.receivedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get action => $composableBuilder(
    column: $table.action,
    builder: (column) => ColumnOrderings(column),
  );

  $$ElevatorsTableTableOrderingComposer get elevatorId {
    final $$ElevatorsTableTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.elevatorId,
      referencedTable: $db.elevatorsTable,
      getReferencedColumn: (t) => t.elevatorId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ElevatorsTableTableOrderingComposer(
            $db: $db,
            $table: $db.elevatorsTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$EventTypesTableTableOrderingComposer get eventId {
    final $$EventTypesTableTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.eventId,
      referencedTable: $db.eventTypesTable,
      getReferencedColumn: (t) => t.eventId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$EventTypesTableTableOrderingComposer(
            $db: $db,
            $table: $db.eventTypesTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$EventHistoryTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $EventHistoryTableTable> {
  $$EventHistoryTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get eventHistoryId => $composableBuilder(
    column: $table.eventHistoryId,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get receivedAt => $composableBuilder(
    column: $table.receivedAt,
    builder: (column) => column,
  );

  GeneratedColumn<String> get action =>
      $composableBuilder(column: $table.action, builder: (column) => column);

  $$ElevatorsTableTableAnnotationComposer get elevatorId {
    final $$ElevatorsTableTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.elevatorId,
      referencedTable: $db.elevatorsTable,
      getReferencedColumn: (t) => t.elevatorId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ElevatorsTableTableAnnotationComposer(
            $db: $db,
            $table: $db.elevatorsTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$EventTypesTableTableAnnotationComposer get eventId {
    final $$EventTypesTableTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.eventId,
      referencedTable: $db.eventTypesTable,
      getReferencedColumn: (t) => t.eventId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$EventTypesTableTableAnnotationComposer(
            $db: $db,
            $table: $db.eventTypesTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$EventHistoryTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $EventHistoryTableTable,
          EventHistoryTableData,
          $$EventHistoryTableTableFilterComposer,
          $$EventHistoryTableTableOrderingComposer,
          $$EventHistoryTableTableAnnotationComposer,
          $$EventHistoryTableTableCreateCompanionBuilder,
          $$EventHistoryTableTableUpdateCompanionBuilder,
          (EventHistoryTableData, $$EventHistoryTableTableReferences),
          EventHistoryTableData,
          PrefetchHooks Function({bool elevatorId, bool eventId})
        > {
  $$EventHistoryTableTableTableManager(
    _$AppDatabase db,
    $EventHistoryTableTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$EventHistoryTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$EventHistoryTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$EventHistoryTableTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<int> eventHistoryId = const Value.absent(),
                Value<int> elevatorId = const Value.absent(),
                Value<String> eventId = const Value.absent(),
                Value<DateTime> receivedAt = const Value.absent(),
                Value<String> action = const Value.absent(),
              }) => EventHistoryTableCompanion(
                eventHistoryId: eventHistoryId,
                elevatorId: elevatorId,
                eventId: eventId,
                receivedAt: receivedAt,
                action: action,
              ),
          createCompanionCallback:
              ({
                Value<int> eventHistoryId = const Value.absent(),
                required int elevatorId,
                required String eventId,
                required DateTime receivedAt,
                required String action,
              }) => EventHistoryTableCompanion.insert(
                eventHistoryId: eventHistoryId,
                elevatorId: elevatorId,
                eventId: eventId,
                receivedAt: receivedAt,
                action: action,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$EventHistoryTableTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({elevatorId = false, eventId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (elevatorId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.elevatorId,
                                referencedTable:
                                    $$EventHistoryTableTableReferences
                                        ._elevatorIdTable(db),
                                referencedColumn:
                                    $$EventHistoryTableTableReferences
                                        ._elevatorIdTable(db)
                                        .elevatorId,
                              )
                              as T;
                    }
                    if (eventId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.eventId,
                                referencedTable:
                                    $$EventHistoryTableTableReferences
                                        ._eventIdTable(db),
                                referencedColumn:
                                    $$EventHistoryTableTableReferences
                                        ._eventIdTable(db)
                                        .eventId,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$EventHistoryTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $EventHistoryTableTable,
      EventHistoryTableData,
      $$EventHistoryTableTableFilterComposer,
      $$EventHistoryTableTableOrderingComposer,
      $$EventHistoryTableTableAnnotationComposer,
      $$EventHistoryTableTableCreateCompanionBuilder,
      $$EventHistoryTableTableUpdateCompanionBuilder,
      (EventHistoryTableData, $$EventHistoryTableTableReferences),
      EventHistoryTableData,
      PrefetchHooks Function({bool elevatorId, bool eventId})
    >;
typedef $$ServiceInfoTableTableCreateCompanionBuilder =
    ServiceInfoTableCompanion Function({
      Value<int> elevatorId,
      required int carryingCapacityKg,
      required int maxPeople,
      required DateTime commissioningDate,
      required DateTime lastMaintenanceDate,
      required DateTime nextMaintenanceDate,
    });
typedef $$ServiceInfoTableTableUpdateCompanionBuilder =
    ServiceInfoTableCompanion Function({
      Value<int> elevatorId,
      Value<int> carryingCapacityKg,
      Value<int> maxPeople,
      Value<DateTime> commissioningDate,
      Value<DateTime> lastMaintenanceDate,
      Value<DateTime> nextMaintenanceDate,
    });

final class $$ServiceInfoTableTableReferences
    extends
        BaseReferences<
          _$AppDatabase,
          $ServiceInfoTableTable,
          ServiceInfoTableData
        > {
  $$ServiceInfoTableTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $ElevatorsTableTable _elevatorIdTable(_$AppDatabase db) =>
      db.elevatorsTable.createAlias(
        $_aliasNameGenerator(
          db.serviceInfoTable.elevatorId,
          db.elevatorsTable.elevatorId,
        ),
      );

  $$ElevatorsTableTableProcessedTableManager get elevatorId {
    final $_column = $_itemColumn<int>('elevator_id')!;

    final manager = $$ElevatorsTableTableTableManager(
      $_db,
      $_db.elevatorsTable,
    ).filter((f) => f.elevatorId.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_elevatorIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$ServiceInfoTableTableFilterComposer
    extends Composer<_$AppDatabase, $ServiceInfoTableTable> {
  $$ServiceInfoTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get carryingCapacityKg => $composableBuilder(
    column: $table.carryingCapacityKg,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get maxPeople => $composableBuilder(
    column: $table.maxPeople,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get commissioningDate => $composableBuilder(
    column: $table.commissioningDate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get lastMaintenanceDate => $composableBuilder(
    column: $table.lastMaintenanceDate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get nextMaintenanceDate => $composableBuilder(
    column: $table.nextMaintenanceDate,
    builder: (column) => ColumnFilters(column),
  );

  $$ElevatorsTableTableFilterComposer get elevatorId {
    final $$ElevatorsTableTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.elevatorId,
      referencedTable: $db.elevatorsTable,
      getReferencedColumn: (t) => t.elevatorId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ElevatorsTableTableFilterComposer(
            $db: $db,
            $table: $db.elevatorsTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ServiceInfoTableTableOrderingComposer
    extends Composer<_$AppDatabase, $ServiceInfoTableTable> {
  $$ServiceInfoTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get carryingCapacityKg => $composableBuilder(
    column: $table.carryingCapacityKg,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get maxPeople => $composableBuilder(
    column: $table.maxPeople,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get commissioningDate => $composableBuilder(
    column: $table.commissioningDate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get lastMaintenanceDate => $composableBuilder(
    column: $table.lastMaintenanceDate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get nextMaintenanceDate => $composableBuilder(
    column: $table.nextMaintenanceDate,
    builder: (column) => ColumnOrderings(column),
  );

  $$ElevatorsTableTableOrderingComposer get elevatorId {
    final $$ElevatorsTableTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.elevatorId,
      referencedTable: $db.elevatorsTable,
      getReferencedColumn: (t) => t.elevatorId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ElevatorsTableTableOrderingComposer(
            $db: $db,
            $table: $db.elevatorsTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ServiceInfoTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $ServiceInfoTableTable> {
  $$ServiceInfoTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get carryingCapacityKg => $composableBuilder(
    column: $table.carryingCapacityKg,
    builder: (column) => column,
  );

  GeneratedColumn<int> get maxPeople =>
      $composableBuilder(column: $table.maxPeople, builder: (column) => column);

  GeneratedColumn<DateTime> get commissioningDate => $composableBuilder(
    column: $table.commissioningDate,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get lastMaintenanceDate => $composableBuilder(
    column: $table.lastMaintenanceDate,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get nextMaintenanceDate => $composableBuilder(
    column: $table.nextMaintenanceDate,
    builder: (column) => column,
  );

  $$ElevatorsTableTableAnnotationComposer get elevatorId {
    final $$ElevatorsTableTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.elevatorId,
      referencedTable: $db.elevatorsTable,
      getReferencedColumn: (t) => t.elevatorId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ElevatorsTableTableAnnotationComposer(
            $db: $db,
            $table: $db.elevatorsTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ServiceInfoTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ServiceInfoTableTable,
          ServiceInfoTableData,
          $$ServiceInfoTableTableFilterComposer,
          $$ServiceInfoTableTableOrderingComposer,
          $$ServiceInfoTableTableAnnotationComposer,
          $$ServiceInfoTableTableCreateCompanionBuilder,
          $$ServiceInfoTableTableUpdateCompanionBuilder,
          (ServiceInfoTableData, $$ServiceInfoTableTableReferences),
          ServiceInfoTableData,
          PrefetchHooks Function({bool elevatorId})
        > {
  $$ServiceInfoTableTableTableManager(
    _$AppDatabase db,
    $ServiceInfoTableTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ServiceInfoTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ServiceInfoTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ServiceInfoTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> elevatorId = const Value.absent(),
                Value<int> carryingCapacityKg = const Value.absent(),
                Value<int> maxPeople = const Value.absent(),
                Value<DateTime> commissioningDate = const Value.absent(),
                Value<DateTime> lastMaintenanceDate = const Value.absent(),
                Value<DateTime> nextMaintenanceDate = const Value.absent(),
              }) => ServiceInfoTableCompanion(
                elevatorId: elevatorId,
                carryingCapacityKg: carryingCapacityKg,
                maxPeople: maxPeople,
                commissioningDate: commissioningDate,
                lastMaintenanceDate: lastMaintenanceDate,
                nextMaintenanceDate: nextMaintenanceDate,
              ),
          createCompanionCallback:
              ({
                Value<int> elevatorId = const Value.absent(),
                required int carryingCapacityKg,
                required int maxPeople,
                required DateTime commissioningDate,
                required DateTime lastMaintenanceDate,
                required DateTime nextMaintenanceDate,
              }) => ServiceInfoTableCompanion.insert(
                elevatorId: elevatorId,
                carryingCapacityKg: carryingCapacityKg,
                maxPeople: maxPeople,
                commissioningDate: commissioningDate,
                lastMaintenanceDate: lastMaintenanceDate,
                nextMaintenanceDate: nextMaintenanceDate,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$ServiceInfoTableTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({elevatorId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (elevatorId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.elevatorId,
                                referencedTable:
                                    $$ServiceInfoTableTableReferences
                                        ._elevatorIdTable(db),
                                referencedColumn:
                                    $$ServiceInfoTableTableReferences
                                        ._elevatorIdTable(db)
                                        .elevatorId,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$ServiceInfoTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ServiceInfoTableTable,
      ServiceInfoTableData,
      $$ServiceInfoTableTableFilterComposer,
      $$ServiceInfoTableTableOrderingComposer,
      $$ServiceInfoTableTableAnnotationComposer,
      $$ServiceInfoTableTableCreateCompanionBuilder,
      $$ServiceInfoTableTableUpdateCompanionBuilder,
      (ServiceInfoTableData, $$ServiceInfoTableTableReferences),
      ServiceInfoTableData,
      PrefetchHooks Function({bool elevatorId})
    >;
typedef $$ActiveEventsTableTableCreateCompanionBuilder =
    ActiveEventsTableCompanion Function({
      required int elevatorId,
      required String eventId,
      required DateTime updatedAt,
      Value<int> rowid,
    });
typedef $$ActiveEventsTableTableUpdateCompanionBuilder =
    ActiveEventsTableCompanion Function({
      Value<int> elevatorId,
      Value<String> eventId,
      Value<DateTime> updatedAt,
      Value<int> rowid,
    });

final class $$ActiveEventsTableTableReferences
    extends
        BaseReferences<
          _$AppDatabase,
          $ActiveEventsTableTable,
          ActiveEventsTableData
        > {
  $$ActiveEventsTableTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $ElevatorsTableTable _elevatorIdTable(_$AppDatabase db) =>
      db.elevatorsTable.createAlias(
        $_aliasNameGenerator(
          db.activeEventsTable.elevatorId,
          db.elevatorsTable.elevatorId,
        ),
      );

  $$ElevatorsTableTableProcessedTableManager get elevatorId {
    final $_column = $_itemColumn<int>('elevator_id')!;

    final manager = $$ElevatorsTableTableTableManager(
      $_db,
      $_db.elevatorsTable,
    ).filter((f) => f.elevatorId.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_elevatorIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $EventTypesTableTable _eventIdTable(_$AppDatabase db) =>
      db.eventTypesTable.createAlias(
        $_aliasNameGenerator(
          db.activeEventsTable.eventId,
          db.eventTypesTable.eventId,
        ),
      );

  $$EventTypesTableTableProcessedTableManager get eventId {
    final $_column = $_itemColumn<String>('event_id')!;

    final manager = $$EventTypesTableTableTableManager(
      $_db,
      $_db.eventTypesTable,
    ).filter((f) => f.eventId.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_eventIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$ActiveEventsTableTableFilterComposer
    extends Composer<_$AppDatabase, $ActiveEventsTableTable> {
  $$ActiveEventsTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  $$ElevatorsTableTableFilterComposer get elevatorId {
    final $$ElevatorsTableTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.elevatorId,
      referencedTable: $db.elevatorsTable,
      getReferencedColumn: (t) => t.elevatorId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ElevatorsTableTableFilterComposer(
            $db: $db,
            $table: $db.elevatorsTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$EventTypesTableTableFilterComposer get eventId {
    final $$EventTypesTableTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.eventId,
      referencedTable: $db.eventTypesTable,
      getReferencedColumn: (t) => t.eventId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$EventTypesTableTableFilterComposer(
            $db: $db,
            $table: $db.eventTypesTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ActiveEventsTableTableOrderingComposer
    extends Composer<_$AppDatabase, $ActiveEventsTableTable> {
  $$ActiveEventsTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  $$ElevatorsTableTableOrderingComposer get elevatorId {
    final $$ElevatorsTableTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.elevatorId,
      referencedTable: $db.elevatorsTable,
      getReferencedColumn: (t) => t.elevatorId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ElevatorsTableTableOrderingComposer(
            $db: $db,
            $table: $db.elevatorsTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$EventTypesTableTableOrderingComposer get eventId {
    final $$EventTypesTableTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.eventId,
      referencedTable: $db.eventTypesTable,
      getReferencedColumn: (t) => t.eventId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$EventTypesTableTableOrderingComposer(
            $db: $db,
            $table: $db.eventTypesTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ActiveEventsTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $ActiveEventsTableTable> {
  $$ActiveEventsTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  $$ElevatorsTableTableAnnotationComposer get elevatorId {
    final $$ElevatorsTableTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.elevatorId,
      referencedTable: $db.elevatorsTable,
      getReferencedColumn: (t) => t.elevatorId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ElevatorsTableTableAnnotationComposer(
            $db: $db,
            $table: $db.elevatorsTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$EventTypesTableTableAnnotationComposer get eventId {
    final $$EventTypesTableTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.eventId,
      referencedTable: $db.eventTypesTable,
      getReferencedColumn: (t) => t.eventId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$EventTypesTableTableAnnotationComposer(
            $db: $db,
            $table: $db.eventTypesTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ActiveEventsTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ActiveEventsTableTable,
          ActiveEventsTableData,
          $$ActiveEventsTableTableFilterComposer,
          $$ActiveEventsTableTableOrderingComposer,
          $$ActiveEventsTableTableAnnotationComposer,
          $$ActiveEventsTableTableCreateCompanionBuilder,
          $$ActiveEventsTableTableUpdateCompanionBuilder,
          (ActiveEventsTableData, $$ActiveEventsTableTableReferences),
          ActiveEventsTableData,
          PrefetchHooks Function({bool elevatorId, bool eventId})
        > {
  $$ActiveEventsTableTableTableManager(
    _$AppDatabase db,
    $ActiveEventsTableTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ActiveEventsTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ActiveEventsTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ActiveEventsTableTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<int> elevatorId = const Value.absent(),
                Value<String> eventId = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => ActiveEventsTableCompanion(
                elevatorId: elevatorId,
                eventId: eventId,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required int elevatorId,
                required String eventId,
                required DateTime updatedAt,
                Value<int> rowid = const Value.absent(),
              }) => ActiveEventsTableCompanion.insert(
                elevatorId: elevatorId,
                eventId: eventId,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$ActiveEventsTableTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({elevatorId = false, eventId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (elevatorId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.elevatorId,
                                referencedTable:
                                    $$ActiveEventsTableTableReferences
                                        ._elevatorIdTable(db),
                                referencedColumn:
                                    $$ActiveEventsTableTableReferences
                                        ._elevatorIdTable(db)
                                        .elevatorId,
                              )
                              as T;
                    }
                    if (eventId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.eventId,
                                referencedTable:
                                    $$ActiveEventsTableTableReferences
                                        ._eventIdTable(db),
                                referencedColumn:
                                    $$ActiveEventsTableTableReferences
                                        ._eventIdTable(db)
                                        .eventId,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$ActiveEventsTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ActiveEventsTableTable,
      ActiveEventsTableData,
      $$ActiveEventsTableTableFilterComposer,
      $$ActiveEventsTableTableOrderingComposer,
      $$ActiveEventsTableTableAnnotationComposer,
      $$ActiveEventsTableTableCreateCompanionBuilder,
      $$ActiveEventsTableTableUpdateCompanionBuilder,
      (ActiveEventsTableData, $$ActiveEventsTableTableReferences),
      ActiveEventsTableData,
      PrefetchHooks Function({bool elevatorId, bool eventId})
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$EventCategoriesTableTableTableManager get eventCategoriesTable =>
      $$EventCategoriesTableTableTableManager(_db, _db.eventCategoriesTable);
  $$EventTypesTableTableTableManager get eventTypesTable =>
      $$EventTypesTableTableTableManager(_db, _db.eventTypesTable);
  $$UsersTableTableTableManager get usersTable =>
      $$UsersTableTableTableManager(_db, _db.usersTable);
  $$ObjectsTableTableTableManager get objectsTable =>
      $$ObjectsTableTableTableManager(_db, _db.objectsTable);
  $$ElevatorsTableTableTableManager get elevatorsTable =>
      $$ElevatorsTableTableTableManager(_db, _db.elevatorsTable);
  $$UserElevatorsTableTableTableManager get userElevatorsTable =>
      $$UserElevatorsTableTableTableManager(_db, _db.userElevatorsTable);
  $$EventHistoryTableTableTableManager get eventHistoryTable =>
      $$EventHistoryTableTableTableManager(_db, _db.eventHistoryTable);
  $$ServiceInfoTableTableTableManager get serviceInfoTable =>
      $$ServiceInfoTableTableTableManager(_db, _db.serviceInfoTable);
  $$ActiveEventsTableTableTableManager get activeEventsTable =>
      $$ActiveEventsTableTableTableManager(_db, _db.activeEventsTable);
}

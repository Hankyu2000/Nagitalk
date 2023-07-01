// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'studentsDataBase.dart';

// ignore_for_file: type=lint
class $StudentsTable extends Students with TableInfo<$StudentsTable, Student> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $StudentsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _uuidMeta = const VerificationMeta('uuid');
  @override
  late final GeneratedColumn<String> uuid = GeneratedColumn<String>(
      'uuid', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'));
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _imageUrlMeta =
      const VerificationMeta('imageUrl');
  @override
  late final GeneratedColumn<String> imageUrl = GeneratedColumn<String>(
      'image_url', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _schoolNameMeta =
      const VerificationMeta('schoolName');
  @override
  late final GeneratedColumn<String> schoolName = GeneratedColumn<String>(
      'school_name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, uuid, name, imageUrl, schoolName];
  @override
  String get aliasedName => _alias ?? 'students';
  @override
  String get actualTableName => 'students';
  @override
  VerificationContext validateIntegrity(Insertable<Student> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('uuid')) {
      context.handle(
          _uuidMeta, uuid.isAcceptableOrUnknown(data['uuid']!, _uuidMeta));
    } else if (isInserting) {
      context.missing(_uuidMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('image_url')) {
      context.handle(_imageUrlMeta,
          imageUrl.isAcceptableOrUnknown(data['image_url']!, _imageUrlMeta));
    } else if (isInserting) {
      context.missing(_imageUrlMeta);
    }
    if (data.containsKey('school_name')) {
      context.handle(
          _schoolNameMeta,
          schoolName.isAcceptableOrUnknown(
              data['school_name']!, _schoolNameMeta));
    } else if (isInserting) {
      context.missing(_schoolNameMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Student map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Student(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      uuid: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}uuid'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      imageUrl: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}image_url'])!,
      schoolName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}school_name'])!,
    );
  }

  @override
  $StudentsTable createAlias(String alias) {
    return $StudentsTable(attachedDatabase, alias);
  }
}

class Student extends DataClass implements Insertable<Student> {
  final int id;
  final String uuid;
  final String name;
  final String imageUrl;
  final String schoolName;
  const Student(
      {required this.id,
      required this.uuid,
      required this.name,
      required this.imageUrl,
      required this.schoolName});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['uuid'] = Variable<String>(uuid);
    map['name'] = Variable<String>(name);
    map['image_url'] = Variable<String>(imageUrl);
    map['school_name'] = Variable<String>(schoolName);
    return map;
  }

  StudentsCompanion toCompanion(bool nullToAbsent) {
    return StudentsCompanion(
      id: Value(id),
      uuid: Value(uuid),
      name: Value(name),
      imageUrl: Value(imageUrl),
      schoolName: Value(schoolName),
    );
  }

  factory Student.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Student(
      id: serializer.fromJson<int>(json['id']),
      uuid: serializer.fromJson<String>(json['uuid']),
      name: serializer.fromJson<String>(json['name']),
      imageUrl: serializer.fromJson<String>(json['imageUrl']),
      schoolName: serializer.fromJson<String>(json['schoolName']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'uuid': serializer.toJson<String>(uuid),
      'name': serializer.toJson<String>(name),
      'imageUrl': serializer.toJson<String>(imageUrl),
      'schoolName': serializer.toJson<String>(schoolName),
    };
  }

  Student copyWith(
          {int? id,
          String? uuid,
          String? name,
          String? imageUrl,
          String? schoolName}) =>
      Student(
        id: id ?? this.id,
        uuid: uuid ?? this.uuid,
        name: name ?? this.name,
        imageUrl: imageUrl ?? this.imageUrl,
        schoolName: schoolName ?? this.schoolName,
      );
  @override
  String toString() {
    return (StringBuffer('Student(')
          ..write('id: $id, ')
          ..write('uuid: $uuid, ')
          ..write('name: $name, ')
          ..write('imageUrl: $imageUrl, ')
          ..write('schoolName: $schoolName')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, uuid, name, imageUrl, schoolName);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Student &&
          other.id == this.id &&
          other.uuid == this.uuid &&
          other.name == this.name &&
          other.imageUrl == this.imageUrl &&
          other.schoolName == this.schoolName);
}

class StudentsCompanion extends UpdateCompanion<Student> {
  final Value<int> id;
  final Value<String> uuid;
  final Value<String> name;
  final Value<String> imageUrl;
  final Value<String> schoolName;
  const StudentsCompanion({
    this.id = const Value.absent(),
    this.uuid = const Value.absent(),
    this.name = const Value.absent(),
    this.imageUrl = const Value.absent(),
    this.schoolName = const Value.absent(),
  });
  StudentsCompanion.insert({
    this.id = const Value.absent(),
    required String uuid,
    required String name,
    required String imageUrl,
    required String schoolName,
  })  : uuid = Value(uuid),
        name = Value(name),
        imageUrl = Value(imageUrl),
        schoolName = Value(schoolName);
  static Insertable<Student> custom({
    Expression<int>? id,
    Expression<String>? uuid,
    Expression<String>? name,
    Expression<String>? imageUrl,
    Expression<String>? schoolName,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (uuid != null) 'uuid': uuid,
      if (name != null) 'name': name,
      if (imageUrl != null) 'image_url': imageUrl,
      if (schoolName != null) 'school_name': schoolName,
    });
  }

  StudentsCompanion copyWith(
      {Value<int>? id,
      Value<String>? uuid,
      Value<String>? name,
      Value<String>? imageUrl,
      Value<String>? schoolName}) {
    return StudentsCompanion(
      id: id ?? this.id,
      uuid: uuid ?? this.uuid,
      name: name ?? this.name,
      imageUrl: imageUrl ?? this.imageUrl,
      schoolName: schoolName ?? this.schoolName,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (uuid.present) {
      map['uuid'] = Variable<String>(uuid.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (imageUrl.present) {
      map['image_url'] = Variable<String>(imageUrl.value);
    }
    if (schoolName.present) {
      map['school_name'] = Variable<String>(schoolName.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('StudentsCompanion(')
          ..write('id: $id, ')
          ..write('uuid: $uuid, ')
          ..write('name: $name, ')
          ..write('imageUrl: $imageUrl, ')
          ..write('schoolName: $schoolName')
          ..write(')'))
        .toString();
  }
}

class $ConversationsTable extends Conversations
    with TableInfo<$ConversationsTable, Conversation> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ConversationsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant("新しい会話"));
  static const VerificationMeta _uuidMeta = const VerificationMeta('uuid');
  @override
  late final GeneratedColumn<String> uuid = GeneratedColumn<String>(
      'uuid', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'));
  @override
  List<GeneratedColumn> get $columns => [id, name, uuid];
  @override
  String get aliasedName => _alias ?? 'conversations';
  @override
  String get actualTableName => 'conversations';
  @override
  VerificationContext validateIntegrity(Insertable<Conversation> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    }
    if (data.containsKey('uuid')) {
      context.handle(
          _uuidMeta, uuid.isAcceptableOrUnknown(data['uuid']!, _uuidMeta));
    } else if (isInserting) {
      context.missing(_uuidMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Conversation map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Conversation(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      uuid: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}uuid'])!,
    );
  }

  @override
  $ConversationsTable createAlias(String alias) {
    return $ConversationsTable(attachedDatabase, alias);
  }
}

class Conversation extends DataClass implements Insertable<Conversation> {
  final int id;
  final String name;
  final String uuid;
  const Conversation(
      {required this.id, required this.name, required this.uuid});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['uuid'] = Variable<String>(uuid);
    return map;
  }

  ConversationsCompanion toCompanion(bool nullToAbsent) {
    return ConversationsCompanion(
      id: Value(id),
      name: Value(name),
      uuid: Value(uuid),
    );
  }

  factory Conversation.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Conversation(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      uuid: serializer.fromJson<String>(json['uuid']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'uuid': serializer.toJson<String>(uuid),
    };
  }

  Conversation copyWith({int? id, String? name, String? uuid}) => Conversation(
        id: id ?? this.id,
        name: name ?? this.name,
        uuid: uuid ?? this.uuid,
      );
  @override
  String toString() {
    return (StringBuffer('Conversation(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('uuid: $uuid')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, uuid);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Conversation &&
          other.id == this.id &&
          other.name == this.name &&
          other.uuid == this.uuid);
}

class ConversationsCompanion extends UpdateCompanion<Conversation> {
  final Value<int> id;
  final Value<String> name;
  final Value<String> uuid;
  const ConversationsCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.uuid = const Value.absent(),
  });
  ConversationsCompanion.insert({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    required String uuid,
  }) : uuid = Value(uuid);
  static Insertable<Conversation> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? uuid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (uuid != null) 'uuid': uuid,
    });
  }

  ConversationsCompanion copyWith(
      {Value<int>? id, Value<String>? name, Value<String>? uuid}) {
    return ConversationsCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      uuid: uuid ?? this.uuid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (uuid.present) {
      map['uuid'] = Variable<String>(uuid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ConversationsCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('uuid: $uuid')
          ..write(')'))
        .toString();
  }
}

class $MessagesTable extends Messages with TableInfo<$MessagesTable, Message> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $MessagesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _messageUUIDMeta =
      const VerificationMeta('messageUUID');
  @override
  late final GeneratedColumn<String> messageUUID = GeneratedColumn<String>(
      'message_u_u_i_d', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'));
  static const VerificationMeta _senderUUIDMeta =
      const VerificationMeta('senderUUID');
  @override
  late final GeneratedColumn<String> senderUUID = GeneratedColumn<String>(
      'sender_u_u_i_d', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _conversationUUIDMeta =
      const VerificationMeta('conversationUUID');
  @override
  late final GeneratedColumn<String> conversationUUID = GeneratedColumn<String>(
      'conversation_u_u_i_d', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _contentMeta =
      const VerificationMeta('content');
  @override
  late final GeneratedColumn<String> content = GeneratedColumn<String>(
      'content', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [id, messageUUID, senderUUID, conversationUUID, content];
  @override
  String get aliasedName => _alias ?? 'messages';
  @override
  String get actualTableName => 'messages';
  @override
  VerificationContext validateIntegrity(Insertable<Message> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('message_u_u_i_d')) {
      context.handle(
          _messageUUIDMeta,
          messageUUID.isAcceptableOrUnknown(
              data['message_u_u_i_d']!, _messageUUIDMeta));
    } else if (isInserting) {
      context.missing(_messageUUIDMeta);
    }
    if (data.containsKey('sender_u_u_i_d')) {
      context.handle(
          _senderUUIDMeta,
          senderUUID.isAcceptableOrUnknown(
              data['sender_u_u_i_d']!, _senderUUIDMeta));
    } else if (isInserting) {
      context.missing(_senderUUIDMeta);
    }
    if (data.containsKey('conversation_u_u_i_d')) {
      context.handle(
          _conversationUUIDMeta,
          conversationUUID.isAcceptableOrUnknown(
              data['conversation_u_u_i_d']!, _conversationUUIDMeta));
    } else if (isInserting) {
      context.missing(_conversationUUIDMeta);
    }
    if (data.containsKey('content')) {
      context.handle(_contentMeta,
          content.isAcceptableOrUnknown(data['content']!, _contentMeta));
    } else if (isInserting) {
      context.missing(_contentMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Message map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Message(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      messageUUID: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}message_u_u_i_d'])!,
      senderUUID: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}sender_u_u_i_d'])!,
      conversationUUID: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}conversation_u_u_i_d'])!,
      content: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}content'])!,
    );
  }

  @override
  $MessagesTable createAlias(String alias) {
    return $MessagesTable(attachedDatabase, alias);
  }
}

class Message extends DataClass implements Insertable<Message> {
  final int id;
  final String messageUUID;
  final String senderUUID;
  final String conversationUUID;
  final String content;
  const Message(
      {required this.id,
      required this.messageUUID,
      required this.senderUUID,
      required this.conversationUUID,
      required this.content});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['message_u_u_i_d'] = Variable<String>(messageUUID);
    map['sender_u_u_i_d'] = Variable<String>(senderUUID);
    map['conversation_u_u_i_d'] = Variable<String>(conversationUUID);
    map['content'] = Variable<String>(content);
    return map;
  }

  MessagesCompanion toCompanion(bool nullToAbsent) {
    return MessagesCompanion(
      id: Value(id),
      messageUUID: Value(messageUUID),
      senderUUID: Value(senderUUID),
      conversationUUID: Value(conversationUUID),
      content: Value(content),
    );
  }

  factory Message.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Message(
      id: serializer.fromJson<int>(json['id']),
      messageUUID: serializer.fromJson<String>(json['messageUUID']),
      senderUUID: serializer.fromJson<String>(json['senderUUID']),
      conversationUUID: serializer.fromJson<String>(json['conversationUUID']),
      content: serializer.fromJson<String>(json['content']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'messageUUID': serializer.toJson<String>(messageUUID),
      'senderUUID': serializer.toJson<String>(senderUUID),
      'conversationUUID': serializer.toJson<String>(conversationUUID),
      'content': serializer.toJson<String>(content),
    };
  }

  Message copyWith(
          {int? id,
          String? messageUUID,
          String? senderUUID,
          String? conversationUUID,
          String? content}) =>
      Message(
        id: id ?? this.id,
        messageUUID: messageUUID ?? this.messageUUID,
        senderUUID: senderUUID ?? this.senderUUID,
        conversationUUID: conversationUUID ?? this.conversationUUID,
        content: content ?? this.content,
      );
  @override
  String toString() {
    return (StringBuffer('Message(')
          ..write('id: $id, ')
          ..write('messageUUID: $messageUUID, ')
          ..write('senderUUID: $senderUUID, ')
          ..write('conversationUUID: $conversationUUID, ')
          ..write('content: $content')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, messageUUID, senderUUID, conversationUUID, content);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Message &&
          other.id == this.id &&
          other.messageUUID == this.messageUUID &&
          other.senderUUID == this.senderUUID &&
          other.conversationUUID == this.conversationUUID &&
          other.content == this.content);
}

class MessagesCompanion extends UpdateCompanion<Message> {
  final Value<int> id;
  final Value<String> messageUUID;
  final Value<String> senderUUID;
  final Value<String> conversationUUID;
  final Value<String> content;
  const MessagesCompanion({
    this.id = const Value.absent(),
    this.messageUUID = const Value.absent(),
    this.senderUUID = const Value.absent(),
    this.conversationUUID = const Value.absent(),
    this.content = const Value.absent(),
  });
  MessagesCompanion.insert({
    this.id = const Value.absent(),
    required String messageUUID,
    required String senderUUID,
    required String conversationUUID,
    required String content,
  })  : messageUUID = Value(messageUUID),
        senderUUID = Value(senderUUID),
        conversationUUID = Value(conversationUUID),
        content = Value(content);
  static Insertable<Message> custom({
    Expression<int>? id,
    Expression<String>? messageUUID,
    Expression<String>? senderUUID,
    Expression<String>? conversationUUID,
    Expression<String>? content,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (messageUUID != null) 'message_u_u_i_d': messageUUID,
      if (senderUUID != null) 'sender_u_u_i_d': senderUUID,
      if (conversationUUID != null) 'conversation_u_u_i_d': conversationUUID,
      if (content != null) 'content': content,
    });
  }

  MessagesCompanion copyWith(
      {Value<int>? id,
      Value<String>? messageUUID,
      Value<String>? senderUUID,
      Value<String>? conversationUUID,
      Value<String>? content}) {
    return MessagesCompanion(
      id: id ?? this.id,
      messageUUID: messageUUID ?? this.messageUUID,
      senderUUID: senderUUID ?? this.senderUUID,
      conversationUUID: conversationUUID ?? this.conversationUUID,
      content: content ?? this.content,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (messageUUID.present) {
      map['message_u_u_i_d'] = Variable<String>(messageUUID.value);
    }
    if (senderUUID.present) {
      map['sender_u_u_i_d'] = Variable<String>(senderUUID.value);
    }
    if (conversationUUID.present) {
      map['conversation_u_u_i_d'] = Variable<String>(conversationUUID.value);
    }
    if (content.present) {
      map['content'] = Variable<String>(content.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('MessagesCompanion(')
          ..write('id: $id, ')
          ..write('messageUUID: $messageUUID, ')
          ..write('senderUUID: $senderUUID, ')
          ..write('conversationUUID: $conversationUUID, ')
          ..write('content: $content')
          ..write(')'))
        .toString();
  }
}

abstract class _$StudentsDatabase extends GeneratedDatabase {
  _$StudentsDatabase(QueryExecutor e) : super(e);
  late final $StudentsTable students = $StudentsTable(this);
  late final $ConversationsTable conversations = $ConversationsTable(this);
  late final $MessagesTable messages = $MessagesTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [students, conversations, messages];
}

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'studentsDatabase.dart';

// ignore_for_file: type=lint
class $StudentsTable extends Students with TableInfo<$StudentsTable, Student> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $StudentsTable(this.attachedDatabase, [this._alias]);
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
  List<GeneratedColumn> get $columns => [uuid, name, imageUrl, schoolName];
  @override
  String get aliasedName => _alias ?? 'students';
  @override
  String get actualTableName => 'students';
  @override
  VerificationContext validateIntegrity(Insertable<Student> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
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
  Set<GeneratedColumn> get $primaryKey => const {};
  @override
  Student map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Student(
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
  final String uuid;
  final String name;
  final String imageUrl;
  final String schoolName;
  const Student(
      {required this.uuid,
      required this.name,
      required this.imageUrl,
      required this.schoolName});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['uuid'] = Variable<String>(uuid);
    map['name'] = Variable<String>(name);
    map['image_url'] = Variable<String>(imageUrl);
    map['school_name'] = Variable<String>(schoolName);
    return map;
  }

  StudentsCompanion toCompanion(bool nullToAbsent) {
    return StudentsCompanion(
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
      'uuid': serializer.toJson<String>(uuid),
      'name': serializer.toJson<String>(name),
      'imageUrl': serializer.toJson<String>(imageUrl),
      'schoolName': serializer.toJson<String>(schoolName),
    };
  }

  Student copyWith(
          {String? uuid, String? name, String? imageUrl, String? schoolName}) =>
      Student(
        uuid: uuid ?? this.uuid,
        name: name ?? this.name,
        imageUrl: imageUrl ?? this.imageUrl,
        schoolName: schoolName ?? this.schoolName,
      );
  @override
  String toString() {
    return (StringBuffer('Student(')
          ..write('uuid: $uuid, ')
          ..write('name: $name, ')
          ..write('imageUrl: $imageUrl, ')
          ..write('schoolName: $schoolName')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(uuid, name, imageUrl, schoolName);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Student &&
          other.uuid == this.uuid &&
          other.name == this.name &&
          other.imageUrl == this.imageUrl &&
          other.schoolName == this.schoolName);
}

class StudentsCompanion extends UpdateCompanion<Student> {
  final Value<String> uuid;
  final Value<String> name;
  final Value<String> imageUrl;
  final Value<String> schoolName;
  final Value<int> rowid;
  const StudentsCompanion({
    this.uuid = const Value.absent(),
    this.name = const Value.absent(),
    this.imageUrl = const Value.absent(),
    this.schoolName = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  StudentsCompanion.insert({
    required String uuid,
    required String name,
    required String imageUrl,
    required String schoolName,
    this.rowid = const Value.absent(),
  })  : uuid = Value(uuid),
        name = Value(name),
        imageUrl = Value(imageUrl),
        schoolName = Value(schoolName);
  static Insertable<Student> custom({
    Expression<String>? uuid,
    Expression<String>? name,
    Expression<String>? imageUrl,
    Expression<String>? schoolName,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (uuid != null) 'uuid': uuid,
      if (name != null) 'name': name,
      if (imageUrl != null) 'image_url': imageUrl,
      if (schoolName != null) 'school_name': schoolName,
      if (rowid != null) 'rowid': rowid,
    });
  }

  StudentsCompanion copyWith(
      {Value<String>? uuid,
      Value<String>? name,
      Value<String>? imageUrl,
      Value<String>? schoolName,
      Value<int>? rowid}) {
    return StudentsCompanion(
      uuid: uuid ?? this.uuid,
      name: name ?? this.name,
      imageUrl: imageUrl ?? this.imageUrl,
      schoolName: schoolName ?? this.schoolName,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
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
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('StudentsCompanion(')
          ..write('uuid: $uuid, ')
          ..write('name: $name, ')
          ..write('imageUrl: $imageUrl, ')
          ..write('schoolName: $schoolName, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$StudentsDatabase extends GeneratedDatabase {
  _$StudentsDatabase(QueryExecutor e) : super(e);
  late final $StudentsTable students = $StudentsTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [students];
}

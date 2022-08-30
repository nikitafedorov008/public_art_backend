// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'publicart_db.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: type=lint
class Author extends DataClass implements Insertable<Author> {
  final String id;
  final String name;
  final String nameEN;
  final String description;
  final String descriptionEN;
  final String? imageId;
  Author(
      {required this.id,
      required this.name,
      required this.nameEN,
      required this.description,
      required this.descriptionEN,
      this.imageId});
  factory Author.fromData(Map<String, dynamic> data, {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return Author(
      id: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      name: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}name'])!,
      nameEN: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}name_e_n'])!,
      description: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}description'])!,
      descriptionEN: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}description_e_n'])!,
      imageId: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}image_id']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['name'] = Variable<String>(name);
    map['name_e_n'] = Variable<String>(nameEN);
    map['description'] = Variable<String>(description);
    map['description_e_n'] = Variable<String>(descriptionEN);
    if (!nullToAbsent || imageId != null) {
      map['image_id'] = Variable<String?>(imageId);
    }
    return map;
  }

  AuthorsCompanion toCompanion(bool nullToAbsent) {
    return AuthorsCompanion(
      id: Value(id),
      name: Value(name),
      nameEN: Value(nameEN),
      description: Value(description),
      descriptionEN: Value(descriptionEN),
      imageId: imageId == null && nullToAbsent
          ? const Value.absent()
          : Value(imageId),
    );
  }

  factory Author.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Author(
      id: serializer.fromJson<String>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      nameEN: serializer.fromJson<String>(json['nameEN']),
      description: serializer.fromJson<String>(json['description']),
      descriptionEN: serializer.fromJson<String>(json['descriptionEN']),
      imageId: serializer.fromJson<String?>(json['imageId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'name': serializer.toJson<String>(name),
      'nameEN': serializer.toJson<String>(nameEN),
      'description': serializer.toJson<String>(description),
      'descriptionEN': serializer.toJson<String>(descriptionEN),
      'imageId': serializer.toJson<String?>(imageId),
    };
  }

  Author copyWith(
          {String? id,
          String? name,
          String? nameEN,
          String? description,
          String? descriptionEN,
          String? imageId}) =>
      Author(
        id: id ?? this.id,
        name: name ?? this.name,
        nameEN: nameEN ?? this.nameEN,
        description: description ?? this.description,
        descriptionEN: descriptionEN ?? this.descriptionEN,
        imageId: imageId ?? this.imageId,
      );
  @override
  String toString() {
    return (StringBuffer('Author(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('nameEN: $nameEN, ')
          ..write('description: $description, ')
          ..write('descriptionEN: $descriptionEN, ')
          ..write('imageId: $imageId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, name, nameEN, description, descriptionEN, imageId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Author &&
          other.id == this.id &&
          other.name == this.name &&
          other.nameEN == this.nameEN &&
          other.description == this.description &&
          other.descriptionEN == this.descriptionEN &&
          other.imageId == this.imageId);
}

class AuthorsCompanion extends UpdateCompanion<Author> {
  final Value<String> id;
  final Value<String> name;
  final Value<String> nameEN;
  final Value<String> description;
  final Value<String> descriptionEN;
  final Value<String?> imageId;
  const AuthorsCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.nameEN = const Value.absent(),
    this.description = const Value.absent(),
    this.descriptionEN = const Value.absent(),
    this.imageId = const Value.absent(),
  });
  AuthorsCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required String nameEN,
    required String description,
    required String descriptionEN,
    this.imageId = const Value.absent(),
  })  : name = Value(name),
        nameEN = Value(nameEN),
        description = Value(description),
        descriptionEN = Value(descriptionEN);
  static Insertable<Author> custom({
    Expression<String>? id,
    Expression<String>? name,
    Expression<String>? nameEN,
    Expression<String>? description,
    Expression<String>? descriptionEN,
    Expression<String?>? imageId,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (nameEN != null) 'name_e_n': nameEN,
      if (description != null) 'description': description,
      if (descriptionEN != null) 'description_e_n': descriptionEN,
      if (imageId != null) 'image_id': imageId,
    });
  }

  AuthorsCompanion copyWith(
      {Value<String>? id,
      Value<String>? name,
      Value<String>? nameEN,
      Value<String>? description,
      Value<String>? descriptionEN,
      Value<String?>? imageId}) {
    return AuthorsCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      nameEN: nameEN ?? this.nameEN,
      description: description ?? this.description,
      descriptionEN: descriptionEN ?? this.descriptionEN,
      imageId: imageId ?? this.imageId,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (nameEN.present) {
      map['name_e_n'] = Variable<String>(nameEN.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (descriptionEN.present) {
      map['description_e_n'] = Variable<String>(descriptionEN.value);
    }
    if (imageId.present) {
      map['image_id'] = Variable<String?>(imageId.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AuthorsCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('nameEN: $nameEN, ')
          ..write('description: $description, ')
          ..write('descriptionEN: $descriptionEN, ')
          ..write('imageId: $imageId')
          ..write(')'))
        .toString();
  }
}

class $AuthorsTable extends Authors with TableInfo<$AuthorsTable, Author> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $AuthorsTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String?> id = GeneratedColumn<String?>(
      'id', aliasedName, false,
      type: const StringType(),
      requiredDuringInsert: false,
      clientDefault: () => _uuid.v4());
  final VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String?> name = GeneratedColumn<String?>(
      'name', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _nameENMeta = const VerificationMeta('nameEN');
  @override
  late final GeneratedColumn<String?> nameEN = GeneratedColumn<String?>(
      'name_e_n', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  @override
  late final GeneratedColumn<String?> description = GeneratedColumn<String?>(
      'description', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _descriptionENMeta =
      const VerificationMeta('descriptionEN');
  @override
  late final GeneratedColumn<String?> descriptionEN = GeneratedColumn<String?>(
      'description_e_n', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _imageIdMeta = const VerificationMeta('imageId');
  @override
  late final GeneratedColumn<String?> imageId = GeneratedColumn<String?>(
      'image_id', aliasedName, true,
      type: const StringType(), requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns =>
      [id, name, nameEN, description, descriptionEN, imageId];
  @override
  String get aliasedName => _alias ?? 'authors';
  @override
  String get actualTableName => 'authors';
  @override
  VerificationContext validateIntegrity(Insertable<Author> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('name_e_n')) {
      context.handle(_nameENMeta,
          nameEN.isAcceptableOrUnknown(data['name_e_n']!, _nameENMeta));
    } else if (isInserting) {
      context.missing(_nameENMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description']!, _descriptionMeta));
    } else if (isInserting) {
      context.missing(_descriptionMeta);
    }
    if (data.containsKey('description_e_n')) {
      context.handle(
          _descriptionENMeta,
          descriptionEN.isAcceptableOrUnknown(
              data['description_e_n']!, _descriptionENMeta));
    } else if (isInserting) {
      context.missing(_descriptionENMeta);
    }
    if (data.containsKey('image_id')) {
      context.handle(_imageIdMeta,
          imageId.isAcceptableOrUnknown(data['image_id']!, _imageIdMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Author map(Map<String, dynamic> data, {String? tablePrefix}) {
    return Author.fromData(data,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $AuthorsTable createAlias(String alias) {
    return $AuthorsTable(attachedDatabase, alias);
  }
}

class AuthorTag extends DataClass implements Insertable<AuthorTag> {
  final String authorId;
  final int tagId;
  AuthorTag({required this.authorId, required this.tagId});
  factory AuthorTag.fromData(Map<String, dynamic> data, {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return AuthorTag(
      authorId: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}author_id'])!,
      tagId: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}tag_id'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['author_id'] = Variable<String>(authorId);
    map['tag_id'] = Variable<int>(tagId);
    return map;
  }

  AuthorTagsCompanion toCompanion(bool nullToAbsent) {
    return AuthorTagsCompanion(
      authorId: Value(authorId),
      tagId: Value(tagId),
    );
  }

  factory AuthorTag.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return AuthorTag(
      authorId: serializer.fromJson<String>(json['authorId']),
      tagId: serializer.fromJson<int>(json['tagId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'authorId': serializer.toJson<String>(authorId),
      'tagId': serializer.toJson<int>(tagId),
    };
  }

  AuthorTag copyWith({String? authorId, int? tagId}) => AuthorTag(
        authorId: authorId ?? this.authorId,
        tagId: tagId ?? this.tagId,
      );
  @override
  String toString() {
    return (StringBuffer('AuthorTag(')
          ..write('authorId: $authorId, ')
          ..write('tagId: $tagId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(authorId, tagId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is AuthorTag &&
          other.authorId == this.authorId &&
          other.tagId == this.tagId);
}

class AuthorTagsCompanion extends UpdateCompanion<AuthorTag> {
  final Value<String> authorId;
  final Value<int> tagId;
  const AuthorTagsCompanion({
    this.authorId = const Value.absent(),
    this.tagId = const Value.absent(),
  });
  AuthorTagsCompanion.insert({
    required String authorId,
    required int tagId,
  })  : authorId = Value(authorId),
        tagId = Value(tagId);
  static Insertable<AuthorTag> custom({
    Expression<String>? authorId,
    Expression<int>? tagId,
  }) {
    return RawValuesInsertable({
      if (authorId != null) 'author_id': authorId,
      if (tagId != null) 'tag_id': tagId,
    });
  }

  AuthorTagsCompanion copyWith({Value<String>? authorId, Value<int>? tagId}) {
    return AuthorTagsCompanion(
      authorId: authorId ?? this.authorId,
      tagId: tagId ?? this.tagId,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (authorId.present) {
      map['author_id'] = Variable<String>(authorId.value);
    }
    if (tagId.present) {
      map['tag_id'] = Variable<int>(tagId.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AuthorTagsCompanion(')
          ..write('authorId: $authorId, ')
          ..write('tagId: $tagId')
          ..write(')'))
        .toString();
  }
}

class $AuthorTagsTable extends AuthorTags
    with TableInfo<$AuthorTagsTable, AuthorTag> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $AuthorTagsTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _authorIdMeta = const VerificationMeta('authorId');
  @override
  late final GeneratedColumn<String?> authorId = GeneratedColumn<String?>(
      'author_id', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _tagIdMeta = const VerificationMeta('tagId');
  @override
  late final GeneratedColumn<int?> tagId = GeneratedColumn<int?>(
      'tag_id', aliasedName, false,
      type: const IntType(), requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [authorId, tagId];
  @override
  String get aliasedName => _alias ?? 'author_tags';
  @override
  String get actualTableName => 'author_tags';
  @override
  VerificationContext validateIntegrity(Insertable<AuthorTag> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('author_id')) {
      context.handle(_authorIdMeta,
          authorId.isAcceptableOrUnknown(data['author_id']!, _authorIdMeta));
    } else if (isInserting) {
      context.missing(_authorIdMeta);
    }
    if (data.containsKey('tag_id')) {
      context.handle(
          _tagIdMeta, tagId.isAcceptableOrUnknown(data['tag_id']!, _tagIdMeta));
    } else if (isInserting) {
      context.missing(_tagIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {authorId, tagId};
  @override
  AuthorTag map(Map<String, dynamic> data, {String? tablePrefix}) {
    return AuthorTag.fromData(data,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $AuthorTagsTable createAlias(String alias) {
    return $AuthorTagsTable(attachedDatabase, alias);
  }
}

class AuthorLink extends DataClass implements Insertable<AuthorLink> {
  final String authorId;
  final String linkId;
  AuthorLink({required this.authorId, required this.linkId});
  factory AuthorLink.fromData(Map<String, dynamic> data, {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return AuthorLink(
      authorId: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}author_id'])!,
      linkId: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}link_id'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['author_id'] = Variable<String>(authorId);
    map['link_id'] = Variable<String>(linkId);
    return map;
  }

  AuthorLinksCompanion toCompanion(bool nullToAbsent) {
    return AuthorLinksCompanion(
      authorId: Value(authorId),
      linkId: Value(linkId),
    );
  }

  factory AuthorLink.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return AuthorLink(
      authorId: serializer.fromJson<String>(json['authorId']),
      linkId: serializer.fromJson<String>(json['linkId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'authorId': serializer.toJson<String>(authorId),
      'linkId': serializer.toJson<String>(linkId),
    };
  }

  AuthorLink copyWith({String? authorId, String? linkId}) => AuthorLink(
        authorId: authorId ?? this.authorId,
        linkId: linkId ?? this.linkId,
      );
  @override
  String toString() {
    return (StringBuffer('AuthorLink(')
          ..write('authorId: $authorId, ')
          ..write('linkId: $linkId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(authorId, linkId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is AuthorLink &&
          other.authorId == this.authorId &&
          other.linkId == this.linkId);
}

class AuthorLinksCompanion extends UpdateCompanion<AuthorLink> {
  final Value<String> authorId;
  final Value<String> linkId;
  const AuthorLinksCompanion({
    this.authorId = const Value.absent(),
    this.linkId = const Value.absent(),
  });
  AuthorLinksCompanion.insert({
    required String authorId,
    required String linkId,
  })  : authorId = Value(authorId),
        linkId = Value(linkId);
  static Insertable<AuthorLink> custom({
    Expression<String>? authorId,
    Expression<String>? linkId,
  }) {
    return RawValuesInsertable({
      if (authorId != null) 'author_id': authorId,
      if (linkId != null) 'link_id': linkId,
    });
  }

  AuthorLinksCompanion copyWith(
      {Value<String>? authorId, Value<String>? linkId}) {
    return AuthorLinksCompanion(
      authorId: authorId ?? this.authorId,
      linkId: linkId ?? this.linkId,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (authorId.present) {
      map['author_id'] = Variable<String>(authorId.value);
    }
    if (linkId.present) {
      map['link_id'] = Variable<String>(linkId.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AuthorLinksCompanion(')
          ..write('authorId: $authorId, ')
          ..write('linkId: $linkId')
          ..write(')'))
        .toString();
  }
}

class $AuthorLinksTable extends AuthorLinks
    with TableInfo<$AuthorLinksTable, AuthorLink> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $AuthorLinksTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _authorIdMeta = const VerificationMeta('authorId');
  @override
  late final GeneratedColumn<String?> authorId = GeneratedColumn<String?>(
      'author_id', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _linkIdMeta = const VerificationMeta('linkId');
  @override
  late final GeneratedColumn<String?> linkId = GeneratedColumn<String?>(
      'link_id', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [authorId, linkId];
  @override
  String get aliasedName => _alias ?? 'author_links';
  @override
  String get actualTableName => 'author_links';
  @override
  VerificationContext validateIntegrity(Insertable<AuthorLink> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('author_id')) {
      context.handle(_authorIdMeta,
          authorId.isAcceptableOrUnknown(data['author_id']!, _authorIdMeta));
    } else if (isInserting) {
      context.missing(_authorIdMeta);
    }
    if (data.containsKey('link_id')) {
      context.handle(_linkIdMeta,
          linkId.isAcceptableOrUnknown(data['link_id']!, _linkIdMeta));
    } else if (isInserting) {
      context.missing(_linkIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {authorId, linkId};
  @override
  AuthorLink map(Map<String, dynamic> data, {String? tablePrefix}) {
    return AuthorLink.fromData(data,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $AuthorLinksTable createAlias(String alias) {
    return $AuthorLinksTable(attachedDatabase, alias);
  }
}

class Art extends DataClass implements Insertable<Art> {
  final String id;
  final String name;
  final String nameEN;
  final String description;
  final String descriptionEN;
  final bool hasAR;
  final bool hasAudio;
  final bool isPaidAudio;
  final String statusTitle;
  final String statusTitleEN;
  Art(
      {required this.id,
      required this.name,
      required this.nameEN,
      required this.description,
      required this.descriptionEN,
      required this.hasAR,
      required this.hasAudio,
      required this.isPaidAudio,
      required this.statusTitle,
      required this.statusTitleEN});
  factory Art.fromData(Map<String, dynamic> data, {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return Art(
      id: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      name: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}name'])!,
      nameEN: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}name_e_n'])!,
      description: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}description'])!,
      descriptionEN: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}description_e_n'])!,
      hasAR: const BoolType()
          .mapFromDatabaseResponse(data['${effectivePrefix}has_a_r'])!,
      hasAudio: const BoolType()
          .mapFromDatabaseResponse(data['${effectivePrefix}has_audio'])!,
      isPaidAudio: const BoolType()
          .mapFromDatabaseResponse(data['${effectivePrefix}is_paid_audio'])!,
      statusTitle: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}status_title'])!,
      statusTitleEN: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}status_title_e_n'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['name'] = Variable<String>(name);
    map['name_e_n'] = Variable<String>(nameEN);
    map['description'] = Variable<String>(description);
    map['description_e_n'] = Variable<String>(descriptionEN);
    map['has_a_r'] = Variable<bool>(hasAR);
    map['has_audio'] = Variable<bool>(hasAudio);
    map['is_paid_audio'] = Variable<bool>(isPaidAudio);
    map['status_title'] = Variable<String>(statusTitle);
    map['status_title_e_n'] = Variable<String>(statusTitleEN);
    return map;
  }

  ArtsCompanion toCompanion(bool nullToAbsent) {
    return ArtsCompanion(
      id: Value(id),
      name: Value(name),
      nameEN: Value(nameEN),
      description: Value(description),
      descriptionEN: Value(descriptionEN),
      hasAR: Value(hasAR),
      hasAudio: Value(hasAudio),
      isPaidAudio: Value(isPaidAudio),
      statusTitle: Value(statusTitle),
      statusTitleEN: Value(statusTitleEN),
    );
  }

  factory Art.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Art(
      id: serializer.fromJson<String>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      nameEN: serializer.fromJson<String>(json['nameEN']),
      description: serializer.fromJson<String>(json['description']),
      descriptionEN: serializer.fromJson<String>(json['descriptionEN']),
      hasAR: serializer.fromJson<bool>(json['hasAR']),
      hasAudio: serializer.fromJson<bool>(json['hasAudio']),
      isPaidAudio: serializer.fromJson<bool>(json['isPaidAudio']),
      statusTitle: serializer.fromJson<String>(json['statusTitle']),
      statusTitleEN: serializer.fromJson<String>(json['statusTitleEN']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'name': serializer.toJson<String>(name),
      'nameEN': serializer.toJson<String>(nameEN),
      'description': serializer.toJson<String>(description),
      'descriptionEN': serializer.toJson<String>(descriptionEN),
      'hasAR': serializer.toJson<bool>(hasAR),
      'hasAudio': serializer.toJson<bool>(hasAudio),
      'isPaidAudio': serializer.toJson<bool>(isPaidAudio),
      'statusTitle': serializer.toJson<String>(statusTitle),
      'statusTitleEN': serializer.toJson<String>(statusTitleEN),
    };
  }

  Art copyWith(
          {String? id,
          String? name,
          String? nameEN,
          String? description,
          String? descriptionEN,
          bool? hasAR,
          bool? hasAudio,
          bool? isPaidAudio,
          String? statusTitle,
          String? statusTitleEN}) =>
      Art(
        id: id ?? this.id,
        name: name ?? this.name,
        nameEN: nameEN ?? this.nameEN,
        description: description ?? this.description,
        descriptionEN: descriptionEN ?? this.descriptionEN,
        hasAR: hasAR ?? this.hasAR,
        hasAudio: hasAudio ?? this.hasAudio,
        isPaidAudio: isPaidAudio ?? this.isPaidAudio,
        statusTitle: statusTitle ?? this.statusTitle,
        statusTitleEN: statusTitleEN ?? this.statusTitleEN,
      );
  @override
  String toString() {
    return (StringBuffer('Art(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('nameEN: $nameEN, ')
          ..write('description: $description, ')
          ..write('descriptionEN: $descriptionEN, ')
          ..write('hasAR: $hasAR, ')
          ..write('hasAudio: $hasAudio, ')
          ..write('isPaidAudio: $isPaidAudio, ')
          ..write('statusTitle: $statusTitle, ')
          ..write('statusTitleEN: $statusTitleEN')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, nameEN, description, descriptionEN,
      hasAR, hasAudio, isPaidAudio, statusTitle, statusTitleEN);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Art &&
          other.id == this.id &&
          other.name == this.name &&
          other.nameEN == this.nameEN &&
          other.description == this.description &&
          other.descriptionEN == this.descriptionEN &&
          other.hasAR == this.hasAR &&
          other.hasAudio == this.hasAudio &&
          other.isPaidAudio == this.isPaidAudio &&
          other.statusTitle == this.statusTitle &&
          other.statusTitleEN == this.statusTitleEN);
}

class ArtsCompanion extends UpdateCompanion<Art> {
  final Value<String> id;
  final Value<String> name;
  final Value<String> nameEN;
  final Value<String> description;
  final Value<String> descriptionEN;
  final Value<bool> hasAR;
  final Value<bool> hasAudio;
  final Value<bool> isPaidAudio;
  final Value<String> statusTitle;
  final Value<String> statusTitleEN;
  const ArtsCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.nameEN = const Value.absent(),
    this.description = const Value.absent(),
    this.descriptionEN = const Value.absent(),
    this.hasAR = const Value.absent(),
    this.hasAudio = const Value.absent(),
    this.isPaidAudio = const Value.absent(),
    this.statusTitle = const Value.absent(),
    this.statusTitleEN = const Value.absent(),
  });
  ArtsCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required String nameEN,
    required String description,
    required String descriptionEN,
    required bool hasAR,
    required bool hasAudio,
    required bool isPaidAudio,
    required String statusTitle,
    required String statusTitleEN,
  })  : name = Value(name),
        nameEN = Value(nameEN),
        description = Value(description),
        descriptionEN = Value(descriptionEN),
        hasAR = Value(hasAR),
        hasAudio = Value(hasAudio),
        isPaidAudio = Value(isPaidAudio),
        statusTitle = Value(statusTitle),
        statusTitleEN = Value(statusTitleEN);
  static Insertable<Art> custom({
    Expression<String>? id,
    Expression<String>? name,
    Expression<String>? nameEN,
    Expression<String>? description,
    Expression<String>? descriptionEN,
    Expression<bool>? hasAR,
    Expression<bool>? hasAudio,
    Expression<bool>? isPaidAudio,
    Expression<String>? statusTitle,
    Expression<String>? statusTitleEN,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (nameEN != null) 'name_e_n': nameEN,
      if (description != null) 'description': description,
      if (descriptionEN != null) 'description_e_n': descriptionEN,
      if (hasAR != null) 'has_a_r': hasAR,
      if (hasAudio != null) 'has_audio': hasAudio,
      if (isPaidAudio != null) 'is_paid_audio': isPaidAudio,
      if (statusTitle != null) 'status_title': statusTitle,
      if (statusTitleEN != null) 'status_title_e_n': statusTitleEN,
    });
  }

  ArtsCompanion copyWith(
      {Value<String>? id,
      Value<String>? name,
      Value<String>? nameEN,
      Value<String>? description,
      Value<String>? descriptionEN,
      Value<bool>? hasAR,
      Value<bool>? hasAudio,
      Value<bool>? isPaidAudio,
      Value<String>? statusTitle,
      Value<String>? statusTitleEN}) {
    return ArtsCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      nameEN: nameEN ?? this.nameEN,
      description: description ?? this.description,
      descriptionEN: descriptionEN ?? this.descriptionEN,
      hasAR: hasAR ?? this.hasAR,
      hasAudio: hasAudio ?? this.hasAudio,
      isPaidAudio: isPaidAudio ?? this.isPaidAudio,
      statusTitle: statusTitle ?? this.statusTitle,
      statusTitleEN: statusTitleEN ?? this.statusTitleEN,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (nameEN.present) {
      map['name_e_n'] = Variable<String>(nameEN.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (descriptionEN.present) {
      map['description_e_n'] = Variable<String>(descriptionEN.value);
    }
    if (hasAR.present) {
      map['has_a_r'] = Variable<bool>(hasAR.value);
    }
    if (hasAudio.present) {
      map['has_audio'] = Variable<bool>(hasAudio.value);
    }
    if (isPaidAudio.present) {
      map['is_paid_audio'] = Variable<bool>(isPaidAudio.value);
    }
    if (statusTitle.present) {
      map['status_title'] = Variable<String>(statusTitle.value);
    }
    if (statusTitleEN.present) {
      map['status_title_e_n'] = Variable<String>(statusTitleEN.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ArtsCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('nameEN: $nameEN, ')
          ..write('description: $description, ')
          ..write('descriptionEN: $descriptionEN, ')
          ..write('hasAR: $hasAR, ')
          ..write('hasAudio: $hasAudio, ')
          ..write('isPaidAudio: $isPaidAudio, ')
          ..write('statusTitle: $statusTitle, ')
          ..write('statusTitleEN: $statusTitleEN')
          ..write(')'))
        .toString();
  }
}

class $ArtsTable extends Arts with TableInfo<$ArtsTable, Art> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ArtsTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String?> id = GeneratedColumn<String?>(
      'id', aliasedName, false,
      type: const StringType(),
      requiredDuringInsert: false,
      clientDefault: () => _uuid.v4());
  final VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String?> name = GeneratedColumn<String?>(
      'name', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _nameENMeta = const VerificationMeta('nameEN');
  @override
  late final GeneratedColumn<String?> nameEN = GeneratedColumn<String?>(
      'name_e_n', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  @override
  late final GeneratedColumn<String?> description = GeneratedColumn<String?>(
      'description', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _descriptionENMeta =
      const VerificationMeta('descriptionEN');
  @override
  late final GeneratedColumn<String?> descriptionEN = GeneratedColumn<String?>(
      'description_e_n', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _hasARMeta = const VerificationMeta('hasAR');
  @override
  late final GeneratedColumn<bool?> hasAR = GeneratedColumn<bool?>(
      'has_a_r', aliasedName, false,
      type: const BoolType(),
      requiredDuringInsert: true,
      defaultConstraints: 'CHECK (has_a_r IN (0, 1))');
  final VerificationMeta _hasAudioMeta = const VerificationMeta('hasAudio');
  @override
  late final GeneratedColumn<bool?> hasAudio = GeneratedColumn<bool?>(
      'has_audio', aliasedName, false,
      type: const BoolType(),
      requiredDuringInsert: true,
      defaultConstraints: 'CHECK (has_audio IN (0, 1))');
  final VerificationMeta _isPaidAudioMeta =
      const VerificationMeta('isPaidAudio');
  @override
  late final GeneratedColumn<bool?> isPaidAudio = GeneratedColumn<bool?>(
      'is_paid_audio', aliasedName, false,
      type: const BoolType(),
      requiredDuringInsert: true,
      defaultConstraints: 'CHECK (is_paid_audio IN (0, 1))');
  final VerificationMeta _statusTitleMeta =
      const VerificationMeta('statusTitle');
  @override
  late final GeneratedColumn<String?> statusTitle = GeneratedColumn<String?>(
      'status_title', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _statusTitleENMeta =
      const VerificationMeta('statusTitleEN');
  @override
  late final GeneratedColumn<String?> statusTitleEN = GeneratedColumn<String?>(
      'status_title_e_n', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        name,
        nameEN,
        description,
        descriptionEN,
        hasAR,
        hasAudio,
        isPaidAudio,
        statusTitle,
        statusTitleEN
      ];
  @override
  String get aliasedName => _alias ?? 'arts';
  @override
  String get actualTableName => 'arts';
  @override
  VerificationContext validateIntegrity(Insertable<Art> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('name_e_n')) {
      context.handle(_nameENMeta,
          nameEN.isAcceptableOrUnknown(data['name_e_n']!, _nameENMeta));
    } else if (isInserting) {
      context.missing(_nameENMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description']!, _descriptionMeta));
    } else if (isInserting) {
      context.missing(_descriptionMeta);
    }
    if (data.containsKey('description_e_n')) {
      context.handle(
          _descriptionENMeta,
          descriptionEN.isAcceptableOrUnknown(
              data['description_e_n']!, _descriptionENMeta));
    } else if (isInserting) {
      context.missing(_descriptionENMeta);
    }
    if (data.containsKey('has_a_r')) {
      context.handle(_hasARMeta,
          hasAR.isAcceptableOrUnknown(data['has_a_r']!, _hasARMeta));
    } else if (isInserting) {
      context.missing(_hasARMeta);
    }
    if (data.containsKey('has_audio')) {
      context.handle(_hasAudioMeta,
          hasAudio.isAcceptableOrUnknown(data['has_audio']!, _hasAudioMeta));
    } else if (isInserting) {
      context.missing(_hasAudioMeta);
    }
    if (data.containsKey('is_paid_audio')) {
      context.handle(
          _isPaidAudioMeta,
          isPaidAudio.isAcceptableOrUnknown(
              data['is_paid_audio']!, _isPaidAudioMeta));
    } else if (isInserting) {
      context.missing(_isPaidAudioMeta);
    }
    if (data.containsKey('status_title')) {
      context.handle(
          _statusTitleMeta,
          statusTitle.isAcceptableOrUnknown(
              data['status_title']!, _statusTitleMeta));
    } else if (isInserting) {
      context.missing(_statusTitleMeta);
    }
    if (data.containsKey('status_title_e_n')) {
      context.handle(
          _statusTitleENMeta,
          statusTitleEN.isAcceptableOrUnknown(
              data['status_title_e_n']!, _statusTitleENMeta));
    } else if (isInserting) {
      context.missing(_statusTitleENMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Art map(Map<String, dynamic> data, {String? tablePrefix}) {
    return Art.fromData(data,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $ArtsTable createAlias(String alias) {
    return $ArtsTable(attachedDatabase, alias);
  }
}

class ArtWork extends DataClass implements Insertable<ArtWork> {
  final String artId;
  final String authorId;
  ArtWork({required this.artId, required this.authorId});
  factory ArtWork.fromData(Map<String, dynamic> data, {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return ArtWork(
      artId: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}art_id'])!,
      authorId: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}author_id'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['art_id'] = Variable<String>(artId);
    map['author_id'] = Variable<String>(authorId);
    return map;
  }

  ArtWorksCompanion toCompanion(bool nullToAbsent) {
    return ArtWorksCompanion(
      artId: Value(artId),
      authorId: Value(authorId),
    );
  }

  factory ArtWork.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ArtWork(
      artId: serializer.fromJson<String>(json['artId']),
      authorId: serializer.fromJson<String>(json['authorId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'artId': serializer.toJson<String>(artId),
      'authorId': serializer.toJson<String>(authorId),
    };
  }

  ArtWork copyWith({String? artId, String? authorId}) => ArtWork(
        artId: artId ?? this.artId,
        authorId: authorId ?? this.authorId,
      );
  @override
  String toString() {
    return (StringBuffer('ArtWork(')
          ..write('artId: $artId, ')
          ..write('authorId: $authorId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(artId, authorId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ArtWork &&
          other.artId == this.artId &&
          other.authorId == this.authorId);
}

class ArtWorksCompanion extends UpdateCompanion<ArtWork> {
  final Value<String> artId;
  final Value<String> authorId;
  const ArtWorksCompanion({
    this.artId = const Value.absent(),
    this.authorId = const Value.absent(),
  });
  ArtWorksCompanion.insert({
    required String artId,
    required String authorId,
  })  : artId = Value(artId),
        authorId = Value(authorId);
  static Insertable<ArtWork> custom({
    Expression<String>? artId,
    Expression<String>? authorId,
  }) {
    return RawValuesInsertable({
      if (artId != null) 'art_id': artId,
      if (authorId != null) 'author_id': authorId,
    });
  }

  ArtWorksCompanion copyWith({Value<String>? artId, Value<String>? authorId}) {
    return ArtWorksCompanion(
      artId: artId ?? this.artId,
      authorId: authorId ?? this.authorId,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (artId.present) {
      map['art_id'] = Variable<String>(artId.value);
    }
    if (authorId.present) {
      map['author_id'] = Variable<String>(authorId.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ArtWorksCompanion(')
          ..write('artId: $artId, ')
          ..write('authorId: $authorId')
          ..write(')'))
        .toString();
  }
}

class $ArtWorksTable extends ArtWorks with TableInfo<$ArtWorksTable, ArtWork> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ArtWorksTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _artIdMeta = const VerificationMeta('artId');
  @override
  late final GeneratedColumn<String?> artId = GeneratedColumn<String?>(
      'art_id', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _authorIdMeta = const VerificationMeta('authorId');
  @override
  late final GeneratedColumn<String?> authorId = GeneratedColumn<String?>(
      'author_id', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [artId, authorId];
  @override
  String get aliasedName => _alias ?? 'art_works';
  @override
  String get actualTableName => 'art_works';
  @override
  VerificationContext validateIntegrity(Insertable<ArtWork> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('art_id')) {
      context.handle(
          _artIdMeta, artId.isAcceptableOrUnknown(data['art_id']!, _artIdMeta));
    } else if (isInserting) {
      context.missing(_artIdMeta);
    }
    if (data.containsKey('author_id')) {
      context.handle(_authorIdMeta,
          authorId.isAcceptableOrUnknown(data['author_id']!, _authorIdMeta));
    } else if (isInserting) {
      context.missing(_authorIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {artId, authorId};
  @override
  ArtWork map(Map<String, dynamic> data, {String? tablePrefix}) {
    return ArtWork.fromData(data,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $ArtWorksTable createAlias(String alias) {
    return $ArtWorksTable(attachedDatabase, alias);
  }
}

class ArtCategory extends DataClass implements Insertable<ArtCategory> {
  final String artId;
  final int categoryId;
  ArtCategory({required this.artId, required this.categoryId});
  factory ArtCategory.fromData(Map<String, dynamic> data, {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return ArtCategory(
      artId: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}art_id'])!,
      categoryId: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}category_id'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['art_id'] = Variable<String>(artId);
    map['category_id'] = Variable<int>(categoryId);
    return map;
  }

  ArtCategoriesCompanion toCompanion(bool nullToAbsent) {
    return ArtCategoriesCompanion(
      artId: Value(artId),
      categoryId: Value(categoryId),
    );
  }

  factory ArtCategory.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ArtCategory(
      artId: serializer.fromJson<String>(json['artId']),
      categoryId: serializer.fromJson<int>(json['categoryId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'artId': serializer.toJson<String>(artId),
      'categoryId': serializer.toJson<int>(categoryId),
    };
  }

  ArtCategory copyWith({String? artId, int? categoryId}) => ArtCategory(
        artId: artId ?? this.artId,
        categoryId: categoryId ?? this.categoryId,
      );
  @override
  String toString() {
    return (StringBuffer('ArtCategory(')
          ..write('artId: $artId, ')
          ..write('categoryId: $categoryId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(artId, categoryId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ArtCategory &&
          other.artId == this.artId &&
          other.categoryId == this.categoryId);
}

class ArtCategoriesCompanion extends UpdateCompanion<ArtCategory> {
  final Value<String> artId;
  final Value<int> categoryId;
  const ArtCategoriesCompanion({
    this.artId = const Value.absent(),
    this.categoryId = const Value.absent(),
  });
  ArtCategoriesCompanion.insert({
    required String artId,
    required int categoryId,
  })  : artId = Value(artId),
        categoryId = Value(categoryId);
  static Insertable<ArtCategory> custom({
    Expression<String>? artId,
    Expression<int>? categoryId,
  }) {
    return RawValuesInsertable({
      if (artId != null) 'art_id': artId,
      if (categoryId != null) 'category_id': categoryId,
    });
  }

  ArtCategoriesCompanion copyWith(
      {Value<String>? artId, Value<int>? categoryId}) {
    return ArtCategoriesCompanion(
      artId: artId ?? this.artId,
      categoryId: categoryId ?? this.categoryId,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (artId.present) {
      map['art_id'] = Variable<String>(artId.value);
    }
    if (categoryId.present) {
      map['category_id'] = Variable<int>(categoryId.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ArtCategoriesCompanion(')
          ..write('artId: $artId, ')
          ..write('categoryId: $categoryId')
          ..write(')'))
        .toString();
  }
}

class $ArtCategoriesTable extends ArtCategories
    with TableInfo<$ArtCategoriesTable, ArtCategory> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ArtCategoriesTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _artIdMeta = const VerificationMeta('artId');
  @override
  late final GeneratedColumn<String?> artId = GeneratedColumn<String?>(
      'art_id', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _categoryIdMeta = const VerificationMeta('categoryId');
  @override
  late final GeneratedColumn<int?> categoryId = GeneratedColumn<int?>(
      'category_id', aliasedName, false,
      type: const IntType(), requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [artId, categoryId];
  @override
  String get aliasedName => _alias ?? 'art_categories';
  @override
  String get actualTableName => 'art_categories';
  @override
  VerificationContext validateIntegrity(Insertable<ArtCategory> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('art_id')) {
      context.handle(
          _artIdMeta, artId.isAcceptableOrUnknown(data['art_id']!, _artIdMeta));
    } else if (isInserting) {
      context.missing(_artIdMeta);
    }
    if (data.containsKey('category_id')) {
      context.handle(
          _categoryIdMeta,
          categoryId.isAcceptableOrUnknown(
              data['category_id']!, _categoryIdMeta));
    } else if (isInserting) {
      context.missing(_categoryIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {artId, categoryId};
  @override
  ArtCategory map(Map<String, dynamic> data, {String? tablePrefix}) {
    return ArtCategory.fromData(data,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $ArtCategoriesTable createAlias(String alias) {
    return $ArtCategoriesTable(attachedDatabase, alias);
  }
}

class NewsPaper extends DataClass implements Insertable<NewsPaper> {
  final String id;
  final String title;
  final String titleEN;
  final String subtitle;
  final String subtitleEN;
  final String description;
  final String descriptionEN;
  final String importantInfo;
  final String importantInfoEN;
  final String eternalLink;
  final DateTime eventStart;
  final DateTime eventFinish;
  final String eventAddress;
  final String eventAddressEN;
  final double lat;
  final double lng;
  final bool isPinned;
  final bool isEvent;
  final DateTime eventDate;
  NewsPaper(
      {required this.id,
      required this.title,
      required this.titleEN,
      required this.subtitle,
      required this.subtitleEN,
      required this.description,
      required this.descriptionEN,
      required this.importantInfo,
      required this.importantInfoEN,
      required this.eternalLink,
      required this.eventStart,
      required this.eventFinish,
      required this.eventAddress,
      required this.eventAddressEN,
      required this.lat,
      required this.lng,
      required this.isPinned,
      required this.isEvent,
      required this.eventDate});
  factory NewsPaper.fromData(Map<String, dynamic> data, {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return NewsPaper(
      id: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      title: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}title'])!,
      titleEN: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}title_e_n'])!,
      subtitle: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}subtitle'])!,
      subtitleEN: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}subtitle_e_n'])!,
      description: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}description'])!,
      descriptionEN: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}description_e_n'])!,
      importantInfo: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}important_info'])!,
      importantInfoEN: const StringType().mapFromDatabaseResponse(
          data['${effectivePrefix}important_info_e_n'])!,
      eternalLink: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}eternal_link'])!,
      eventStart: const DateTimeType()
          .mapFromDatabaseResponse(data['${effectivePrefix}event_start'])!,
      eventFinish: const DateTimeType()
          .mapFromDatabaseResponse(data['${effectivePrefix}event_finish'])!,
      eventAddress: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}event_address'])!,
      eventAddressEN: const StringType().mapFromDatabaseResponse(
          data['${effectivePrefix}event_address_e_n'])!,
      lat: const RealType()
          .mapFromDatabaseResponse(data['${effectivePrefix}lat'])!,
      lng: const RealType()
          .mapFromDatabaseResponse(data['${effectivePrefix}lng'])!,
      isPinned: const BoolType()
          .mapFromDatabaseResponse(data['${effectivePrefix}is_pinned'])!,
      isEvent: const BoolType()
          .mapFromDatabaseResponse(data['${effectivePrefix}is_event'])!,
      eventDate: const DateTimeType()
          .mapFromDatabaseResponse(data['${effectivePrefix}event_date'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['title'] = Variable<String>(title);
    map['title_e_n'] = Variable<String>(titleEN);
    map['subtitle'] = Variable<String>(subtitle);
    map['subtitle_e_n'] = Variable<String>(subtitleEN);
    map['description'] = Variable<String>(description);
    map['description_e_n'] = Variable<String>(descriptionEN);
    map['important_info'] = Variable<String>(importantInfo);
    map['important_info_e_n'] = Variable<String>(importantInfoEN);
    map['eternal_link'] = Variable<String>(eternalLink);
    map['event_start'] = Variable<DateTime>(eventStart);
    map['event_finish'] = Variable<DateTime>(eventFinish);
    map['event_address'] = Variable<String>(eventAddress);
    map['event_address_e_n'] = Variable<String>(eventAddressEN);
    map['lat'] = Variable<double>(lat);
    map['lng'] = Variable<double>(lng);
    map['is_pinned'] = Variable<bool>(isPinned);
    map['is_event'] = Variable<bool>(isEvent);
    map['event_date'] = Variable<DateTime>(eventDate);
    return map;
  }

  NewsPapersCompanion toCompanion(bool nullToAbsent) {
    return NewsPapersCompanion(
      id: Value(id),
      title: Value(title),
      titleEN: Value(titleEN),
      subtitle: Value(subtitle),
      subtitleEN: Value(subtitleEN),
      description: Value(description),
      descriptionEN: Value(descriptionEN),
      importantInfo: Value(importantInfo),
      importantInfoEN: Value(importantInfoEN),
      eternalLink: Value(eternalLink),
      eventStart: Value(eventStart),
      eventFinish: Value(eventFinish),
      eventAddress: Value(eventAddress),
      eventAddressEN: Value(eventAddressEN),
      lat: Value(lat),
      lng: Value(lng),
      isPinned: Value(isPinned),
      isEvent: Value(isEvent),
      eventDate: Value(eventDate),
    );
  }

  factory NewsPaper.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return NewsPaper(
      id: serializer.fromJson<String>(json['id']),
      title: serializer.fromJson<String>(json['title']),
      titleEN: serializer.fromJson<String>(json['titleEN']),
      subtitle: serializer.fromJson<String>(json['subtitle']),
      subtitleEN: serializer.fromJson<String>(json['subtitleEN']),
      description: serializer.fromJson<String>(json['description']),
      descriptionEN: serializer.fromJson<String>(json['descriptionEN']),
      importantInfo: serializer.fromJson<String>(json['importantInfo']),
      importantInfoEN: serializer.fromJson<String>(json['importantInfoEN']),
      eternalLink: serializer.fromJson<String>(json['eternalLink']),
      eventStart: serializer.fromJson<DateTime>(json['eventStart']),
      eventFinish: serializer.fromJson<DateTime>(json['eventFinish']),
      eventAddress: serializer.fromJson<String>(json['eventAddress']),
      eventAddressEN: serializer.fromJson<String>(json['eventAddressEN']),
      lat: serializer.fromJson<double>(json['lat']),
      lng: serializer.fromJson<double>(json['lng']),
      isPinned: serializer.fromJson<bool>(json['isPinned']),
      isEvent: serializer.fromJson<bool>(json['isEvent']),
      eventDate: serializer.fromJson<DateTime>(json['eventDate']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'title': serializer.toJson<String>(title),
      'titleEN': serializer.toJson<String>(titleEN),
      'subtitle': serializer.toJson<String>(subtitle),
      'subtitleEN': serializer.toJson<String>(subtitleEN),
      'description': serializer.toJson<String>(description),
      'descriptionEN': serializer.toJson<String>(descriptionEN),
      'importantInfo': serializer.toJson<String>(importantInfo),
      'importantInfoEN': serializer.toJson<String>(importantInfoEN),
      'eternalLink': serializer.toJson<String>(eternalLink),
      'eventStart': serializer.toJson<DateTime>(eventStart),
      'eventFinish': serializer.toJson<DateTime>(eventFinish),
      'eventAddress': serializer.toJson<String>(eventAddress),
      'eventAddressEN': serializer.toJson<String>(eventAddressEN),
      'lat': serializer.toJson<double>(lat),
      'lng': serializer.toJson<double>(lng),
      'isPinned': serializer.toJson<bool>(isPinned),
      'isEvent': serializer.toJson<bool>(isEvent),
      'eventDate': serializer.toJson<DateTime>(eventDate),
    };
  }

  NewsPaper copyWith(
          {String? id,
          String? title,
          String? titleEN,
          String? subtitle,
          String? subtitleEN,
          String? description,
          String? descriptionEN,
          String? importantInfo,
          String? importantInfoEN,
          String? eternalLink,
          DateTime? eventStart,
          DateTime? eventFinish,
          String? eventAddress,
          String? eventAddressEN,
          double? lat,
          double? lng,
          bool? isPinned,
          bool? isEvent,
          DateTime? eventDate}) =>
      NewsPaper(
        id: id ?? this.id,
        title: title ?? this.title,
        titleEN: titleEN ?? this.titleEN,
        subtitle: subtitle ?? this.subtitle,
        subtitleEN: subtitleEN ?? this.subtitleEN,
        description: description ?? this.description,
        descriptionEN: descriptionEN ?? this.descriptionEN,
        importantInfo: importantInfo ?? this.importantInfo,
        importantInfoEN: importantInfoEN ?? this.importantInfoEN,
        eternalLink: eternalLink ?? this.eternalLink,
        eventStart: eventStart ?? this.eventStart,
        eventFinish: eventFinish ?? this.eventFinish,
        eventAddress: eventAddress ?? this.eventAddress,
        eventAddressEN: eventAddressEN ?? this.eventAddressEN,
        lat: lat ?? this.lat,
        lng: lng ?? this.lng,
        isPinned: isPinned ?? this.isPinned,
        isEvent: isEvent ?? this.isEvent,
        eventDate: eventDate ?? this.eventDate,
      );
  @override
  String toString() {
    return (StringBuffer('NewsPaper(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('titleEN: $titleEN, ')
          ..write('subtitle: $subtitle, ')
          ..write('subtitleEN: $subtitleEN, ')
          ..write('description: $description, ')
          ..write('descriptionEN: $descriptionEN, ')
          ..write('importantInfo: $importantInfo, ')
          ..write('importantInfoEN: $importantInfoEN, ')
          ..write('eternalLink: $eternalLink, ')
          ..write('eventStart: $eventStart, ')
          ..write('eventFinish: $eventFinish, ')
          ..write('eventAddress: $eventAddress, ')
          ..write('eventAddressEN: $eventAddressEN, ')
          ..write('lat: $lat, ')
          ..write('lng: $lng, ')
          ..write('isPinned: $isPinned, ')
          ..write('isEvent: $isEvent, ')
          ..write('eventDate: $eventDate')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id,
      title,
      titleEN,
      subtitle,
      subtitleEN,
      description,
      descriptionEN,
      importantInfo,
      importantInfoEN,
      eternalLink,
      eventStart,
      eventFinish,
      eventAddress,
      eventAddressEN,
      lat,
      lng,
      isPinned,
      isEvent,
      eventDate);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is NewsPaper &&
          other.id == this.id &&
          other.title == this.title &&
          other.titleEN == this.titleEN &&
          other.subtitle == this.subtitle &&
          other.subtitleEN == this.subtitleEN &&
          other.description == this.description &&
          other.descriptionEN == this.descriptionEN &&
          other.importantInfo == this.importantInfo &&
          other.importantInfoEN == this.importantInfoEN &&
          other.eternalLink == this.eternalLink &&
          other.eventStart == this.eventStart &&
          other.eventFinish == this.eventFinish &&
          other.eventAddress == this.eventAddress &&
          other.eventAddressEN == this.eventAddressEN &&
          other.lat == this.lat &&
          other.lng == this.lng &&
          other.isPinned == this.isPinned &&
          other.isEvent == this.isEvent &&
          other.eventDate == this.eventDate);
}

class NewsPapersCompanion extends UpdateCompanion<NewsPaper> {
  final Value<String> id;
  final Value<String> title;
  final Value<String> titleEN;
  final Value<String> subtitle;
  final Value<String> subtitleEN;
  final Value<String> description;
  final Value<String> descriptionEN;
  final Value<String> importantInfo;
  final Value<String> importantInfoEN;
  final Value<String> eternalLink;
  final Value<DateTime> eventStart;
  final Value<DateTime> eventFinish;
  final Value<String> eventAddress;
  final Value<String> eventAddressEN;
  final Value<double> lat;
  final Value<double> lng;
  final Value<bool> isPinned;
  final Value<bool> isEvent;
  final Value<DateTime> eventDate;
  const NewsPapersCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.titleEN = const Value.absent(),
    this.subtitle = const Value.absent(),
    this.subtitleEN = const Value.absent(),
    this.description = const Value.absent(),
    this.descriptionEN = const Value.absent(),
    this.importantInfo = const Value.absent(),
    this.importantInfoEN = const Value.absent(),
    this.eternalLink = const Value.absent(),
    this.eventStart = const Value.absent(),
    this.eventFinish = const Value.absent(),
    this.eventAddress = const Value.absent(),
    this.eventAddressEN = const Value.absent(),
    this.lat = const Value.absent(),
    this.lng = const Value.absent(),
    this.isPinned = const Value.absent(),
    this.isEvent = const Value.absent(),
    this.eventDate = const Value.absent(),
  });
  NewsPapersCompanion.insert({
    this.id = const Value.absent(),
    required String title,
    required String titleEN,
    required String subtitle,
    required String subtitleEN,
    required String description,
    required String descriptionEN,
    required String importantInfo,
    required String importantInfoEN,
    required String eternalLink,
    required DateTime eventStart,
    required DateTime eventFinish,
    required String eventAddress,
    required String eventAddressEN,
    required double lat,
    required double lng,
    required bool isPinned,
    required bool isEvent,
    required DateTime eventDate,
  })  : title = Value(title),
        titleEN = Value(titleEN),
        subtitle = Value(subtitle),
        subtitleEN = Value(subtitleEN),
        description = Value(description),
        descriptionEN = Value(descriptionEN),
        importantInfo = Value(importantInfo),
        importantInfoEN = Value(importantInfoEN),
        eternalLink = Value(eternalLink),
        eventStart = Value(eventStart),
        eventFinish = Value(eventFinish),
        eventAddress = Value(eventAddress),
        eventAddressEN = Value(eventAddressEN),
        lat = Value(lat),
        lng = Value(lng),
        isPinned = Value(isPinned),
        isEvent = Value(isEvent),
        eventDate = Value(eventDate);
  static Insertable<NewsPaper> custom({
    Expression<String>? id,
    Expression<String>? title,
    Expression<String>? titleEN,
    Expression<String>? subtitle,
    Expression<String>? subtitleEN,
    Expression<String>? description,
    Expression<String>? descriptionEN,
    Expression<String>? importantInfo,
    Expression<String>? importantInfoEN,
    Expression<String>? eternalLink,
    Expression<DateTime>? eventStart,
    Expression<DateTime>? eventFinish,
    Expression<String>? eventAddress,
    Expression<String>? eventAddressEN,
    Expression<double>? lat,
    Expression<double>? lng,
    Expression<bool>? isPinned,
    Expression<bool>? isEvent,
    Expression<DateTime>? eventDate,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (titleEN != null) 'title_e_n': titleEN,
      if (subtitle != null) 'subtitle': subtitle,
      if (subtitleEN != null) 'subtitle_e_n': subtitleEN,
      if (description != null) 'description': description,
      if (descriptionEN != null) 'description_e_n': descriptionEN,
      if (importantInfo != null) 'important_info': importantInfo,
      if (importantInfoEN != null) 'important_info_e_n': importantInfoEN,
      if (eternalLink != null) 'eternal_link': eternalLink,
      if (eventStart != null) 'event_start': eventStart,
      if (eventFinish != null) 'event_finish': eventFinish,
      if (eventAddress != null) 'event_address': eventAddress,
      if (eventAddressEN != null) 'event_address_e_n': eventAddressEN,
      if (lat != null) 'lat': lat,
      if (lng != null) 'lng': lng,
      if (isPinned != null) 'is_pinned': isPinned,
      if (isEvent != null) 'is_event': isEvent,
      if (eventDate != null) 'event_date': eventDate,
    });
  }

  NewsPapersCompanion copyWith(
      {Value<String>? id,
      Value<String>? title,
      Value<String>? titleEN,
      Value<String>? subtitle,
      Value<String>? subtitleEN,
      Value<String>? description,
      Value<String>? descriptionEN,
      Value<String>? importantInfo,
      Value<String>? importantInfoEN,
      Value<String>? eternalLink,
      Value<DateTime>? eventStart,
      Value<DateTime>? eventFinish,
      Value<String>? eventAddress,
      Value<String>? eventAddressEN,
      Value<double>? lat,
      Value<double>? lng,
      Value<bool>? isPinned,
      Value<bool>? isEvent,
      Value<DateTime>? eventDate}) {
    return NewsPapersCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      titleEN: titleEN ?? this.titleEN,
      subtitle: subtitle ?? this.subtitle,
      subtitleEN: subtitleEN ?? this.subtitleEN,
      description: description ?? this.description,
      descriptionEN: descriptionEN ?? this.descriptionEN,
      importantInfo: importantInfo ?? this.importantInfo,
      importantInfoEN: importantInfoEN ?? this.importantInfoEN,
      eternalLink: eternalLink ?? this.eternalLink,
      eventStart: eventStart ?? this.eventStart,
      eventFinish: eventFinish ?? this.eventFinish,
      eventAddress: eventAddress ?? this.eventAddress,
      eventAddressEN: eventAddressEN ?? this.eventAddressEN,
      lat: lat ?? this.lat,
      lng: lng ?? this.lng,
      isPinned: isPinned ?? this.isPinned,
      isEvent: isEvent ?? this.isEvent,
      eventDate: eventDate ?? this.eventDate,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (titleEN.present) {
      map['title_e_n'] = Variable<String>(titleEN.value);
    }
    if (subtitle.present) {
      map['subtitle'] = Variable<String>(subtitle.value);
    }
    if (subtitleEN.present) {
      map['subtitle_e_n'] = Variable<String>(subtitleEN.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (descriptionEN.present) {
      map['description_e_n'] = Variable<String>(descriptionEN.value);
    }
    if (importantInfo.present) {
      map['important_info'] = Variable<String>(importantInfo.value);
    }
    if (importantInfoEN.present) {
      map['important_info_e_n'] = Variable<String>(importantInfoEN.value);
    }
    if (eternalLink.present) {
      map['eternal_link'] = Variable<String>(eternalLink.value);
    }
    if (eventStart.present) {
      map['event_start'] = Variable<DateTime>(eventStart.value);
    }
    if (eventFinish.present) {
      map['event_finish'] = Variable<DateTime>(eventFinish.value);
    }
    if (eventAddress.present) {
      map['event_address'] = Variable<String>(eventAddress.value);
    }
    if (eventAddressEN.present) {
      map['event_address_e_n'] = Variable<String>(eventAddressEN.value);
    }
    if (lat.present) {
      map['lat'] = Variable<double>(lat.value);
    }
    if (lng.present) {
      map['lng'] = Variable<double>(lng.value);
    }
    if (isPinned.present) {
      map['is_pinned'] = Variable<bool>(isPinned.value);
    }
    if (isEvent.present) {
      map['is_event'] = Variable<bool>(isEvent.value);
    }
    if (eventDate.present) {
      map['event_date'] = Variable<DateTime>(eventDate.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('NewsPapersCompanion(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('titleEN: $titleEN, ')
          ..write('subtitle: $subtitle, ')
          ..write('subtitleEN: $subtitleEN, ')
          ..write('description: $description, ')
          ..write('descriptionEN: $descriptionEN, ')
          ..write('importantInfo: $importantInfo, ')
          ..write('importantInfoEN: $importantInfoEN, ')
          ..write('eternalLink: $eternalLink, ')
          ..write('eventStart: $eventStart, ')
          ..write('eventFinish: $eventFinish, ')
          ..write('eventAddress: $eventAddress, ')
          ..write('eventAddressEN: $eventAddressEN, ')
          ..write('lat: $lat, ')
          ..write('lng: $lng, ')
          ..write('isPinned: $isPinned, ')
          ..write('isEvent: $isEvent, ')
          ..write('eventDate: $eventDate')
          ..write(')'))
        .toString();
  }
}

class $NewsPapersTable extends NewsPapers
    with TableInfo<$NewsPapersTable, NewsPaper> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $NewsPapersTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String?> id = GeneratedColumn<String?>(
      'id', aliasedName, false,
      type: const StringType(),
      requiredDuringInsert: false,
      clientDefault: () => _uuid.v4());
  final VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String?> title = GeneratedColumn<String?>(
      'title', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _titleENMeta = const VerificationMeta('titleEN');
  @override
  late final GeneratedColumn<String?> titleEN = GeneratedColumn<String?>(
      'title_e_n', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _subtitleMeta = const VerificationMeta('subtitle');
  @override
  late final GeneratedColumn<String?> subtitle = GeneratedColumn<String?>(
      'subtitle', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _subtitleENMeta = const VerificationMeta('subtitleEN');
  @override
  late final GeneratedColumn<String?> subtitleEN = GeneratedColumn<String?>(
      'subtitle_e_n', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  @override
  late final GeneratedColumn<String?> description = GeneratedColumn<String?>(
      'description', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _descriptionENMeta =
      const VerificationMeta('descriptionEN');
  @override
  late final GeneratedColumn<String?> descriptionEN = GeneratedColumn<String?>(
      'description_e_n', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _importantInfoMeta =
      const VerificationMeta('importantInfo');
  @override
  late final GeneratedColumn<String?> importantInfo = GeneratedColumn<String?>(
      'important_info', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _importantInfoENMeta =
      const VerificationMeta('importantInfoEN');
  @override
  late final GeneratedColumn<String?> importantInfoEN =
      GeneratedColumn<String?>('important_info_e_n', aliasedName, false,
          type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _eternalLinkMeta =
      const VerificationMeta('eternalLink');
  @override
  late final GeneratedColumn<String?> eternalLink = GeneratedColumn<String?>(
      'eternal_link', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _eventStartMeta = const VerificationMeta('eventStart');
  @override
  late final GeneratedColumn<DateTime?> eventStart = GeneratedColumn<DateTime?>(
      'event_start', aliasedName, false,
      type: const IntType(), requiredDuringInsert: true);
  final VerificationMeta _eventFinishMeta =
      const VerificationMeta('eventFinish');
  @override
  late final GeneratedColumn<DateTime?> eventFinish =
      GeneratedColumn<DateTime?>('event_finish', aliasedName, false,
          type: const IntType(), requiredDuringInsert: true);
  final VerificationMeta _eventAddressMeta =
      const VerificationMeta('eventAddress');
  @override
  late final GeneratedColumn<String?> eventAddress = GeneratedColumn<String?>(
      'event_address', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _eventAddressENMeta =
      const VerificationMeta('eventAddressEN');
  @override
  late final GeneratedColumn<String?> eventAddressEN = GeneratedColumn<String?>(
      'event_address_e_n', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _latMeta = const VerificationMeta('lat');
  @override
  late final GeneratedColumn<double?> lat = GeneratedColumn<double?>(
      'lat', aliasedName, false,
      type: const RealType(), requiredDuringInsert: true);
  final VerificationMeta _lngMeta = const VerificationMeta('lng');
  @override
  late final GeneratedColumn<double?> lng = GeneratedColumn<double?>(
      'lng', aliasedName, false,
      type: const RealType(), requiredDuringInsert: true);
  final VerificationMeta _isPinnedMeta = const VerificationMeta('isPinned');
  @override
  late final GeneratedColumn<bool?> isPinned = GeneratedColumn<bool?>(
      'is_pinned', aliasedName, false,
      type: const BoolType(),
      requiredDuringInsert: true,
      defaultConstraints: 'CHECK (is_pinned IN (0, 1))');
  final VerificationMeta _isEventMeta = const VerificationMeta('isEvent');
  @override
  late final GeneratedColumn<bool?> isEvent = GeneratedColumn<bool?>(
      'is_event', aliasedName, false,
      type: const BoolType(),
      requiredDuringInsert: true,
      defaultConstraints: 'CHECK (is_event IN (0, 1))');
  final VerificationMeta _eventDateMeta = const VerificationMeta('eventDate');
  @override
  late final GeneratedColumn<DateTime?> eventDate = GeneratedColumn<DateTime?>(
      'event_date', aliasedName, false,
      type: const IntType(), requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        title,
        titleEN,
        subtitle,
        subtitleEN,
        description,
        descriptionEN,
        importantInfo,
        importantInfoEN,
        eternalLink,
        eventStart,
        eventFinish,
        eventAddress,
        eventAddressEN,
        lat,
        lng,
        isPinned,
        isEvent,
        eventDate
      ];
  @override
  String get aliasedName => _alias ?? 'news_papers';
  @override
  String get actualTableName => 'news_papers';
  @override
  VerificationContext validateIntegrity(Insertable<NewsPaper> instance,
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
    if (data.containsKey('title_e_n')) {
      context.handle(_titleENMeta,
          titleEN.isAcceptableOrUnknown(data['title_e_n']!, _titleENMeta));
    } else if (isInserting) {
      context.missing(_titleENMeta);
    }
    if (data.containsKey('subtitle')) {
      context.handle(_subtitleMeta,
          subtitle.isAcceptableOrUnknown(data['subtitle']!, _subtitleMeta));
    } else if (isInserting) {
      context.missing(_subtitleMeta);
    }
    if (data.containsKey('subtitle_e_n')) {
      context.handle(
          _subtitleENMeta,
          subtitleEN.isAcceptableOrUnknown(
              data['subtitle_e_n']!, _subtitleENMeta));
    } else if (isInserting) {
      context.missing(_subtitleENMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description']!, _descriptionMeta));
    } else if (isInserting) {
      context.missing(_descriptionMeta);
    }
    if (data.containsKey('description_e_n')) {
      context.handle(
          _descriptionENMeta,
          descriptionEN.isAcceptableOrUnknown(
              data['description_e_n']!, _descriptionENMeta));
    } else if (isInserting) {
      context.missing(_descriptionENMeta);
    }
    if (data.containsKey('important_info')) {
      context.handle(
          _importantInfoMeta,
          importantInfo.isAcceptableOrUnknown(
              data['important_info']!, _importantInfoMeta));
    } else if (isInserting) {
      context.missing(_importantInfoMeta);
    }
    if (data.containsKey('important_info_e_n')) {
      context.handle(
          _importantInfoENMeta,
          importantInfoEN.isAcceptableOrUnknown(
              data['important_info_e_n']!, _importantInfoENMeta));
    } else if (isInserting) {
      context.missing(_importantInfoENMeta);
    }
    if (data.containsKey('eternal_link')) {
      context.handle(
          _eternalLinkMeta,
          eternalLink.isAcceptableOrUnknown(
              data['eternal_link']!, _eternalLinkMeta));
    } else if (isInserting) {
      context.missing(_eternalLinkMeta);
    }
    if (data.containsKey('event_start')) {
      context.handle(
          _eventStartMeta,
          eventStart.isAcceptableOrUnknown(
              data['event_start']!, _eventStartMeta));
    } else if (isInserting) {
      context.missing(_eventStartMeta);
    }
    if (data.containsKey('event_finish')) {
      context.handle(
          _eventFinishMeta,
          eventFinish.isAcceptableOrUnknown(
              data['event_finish']!, _eventFinishMeta));
    } else if (isInserting) {
      context.missing(_eventFinishMeta);
    }
    if (data.containsKey('event_address')) {
      context.handle(
          _eventAddressMeta,
          eventAddress.isAcceptableOrUnknown(
              data['event_address']!, _eventAddressMeta));
    } else if (isInserting) {
      context.missing(_eventAddressMeta);
    }
    if (data.containsKey('event_address_e_n')) {
      context.handle(
          _eventAddressENMeta,
          eventAddressEN.isAcceptableOrUnknown(
              data['event_address_e_n']!, _eventAddressENMeta));
    } else if (isInserting) {
      context.missing(_eventAddressENMeta);
    }
    if (data.containsKey('lat')) {
      context.handle(
          _latMeta, lat.isAcceptableOrUnknown(data['lat']!, _latMeta));
    } else if (isInserting) {
      context.missing(_latMeta);
    }
    if (data.containsKey('lng')) {
      context.handle(
          _lngMeta, lng.isAcceptableOrUnknown(data['lng']!, _lngMeta));
    } else if (isInserting) {
      context.missing(_lngMeta);
    }
    if (data.containsKey('is_pinned')) {
      context.handle(_isPinnedMeta,
          isPinned.isAcceptableOrUnknown(data['is_pinned']!, _isPinnedMeta));
    } else if (isInserting) {
      context.missing(_isPinnedMeta);
    }
    if (data.containsKey('is_event')) {
      context.handle(_isEventMeta,
          isEvent.isAcceptableOrUnknown(data['is_event']!, _isEventMeta));
    } else if (isInserting) {
      context.missing(_isEventMeta);
    }
    if (data.containsKey('event_date')) {
      context.handle(_eventDateMeta,
          eventDate.isAcceptableOrUnknown(data['event_date']!, _eventDateMeta));
    } else if (isInserting) {
      context.missing(_eventDateMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  NewsPaper map(Map<String, dynamic> data, {String? tablePrefix}) {
    return NewsPaper.fromData(data,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $NewsPapersTable createAlias(String alias) {
    return $NewsPapersTable(attachedDatabase, alias);
  }
}

class NewsPaperTag extends DataClass implements Insertable<NewsPaperTag> {
  final String newsPaperId;
  final int tagId;
  NewsPaperTag({required this.newsPaperId, required this.tagId});
  factory NewsPaperTag.fromData(Map<String, dynamic> data, {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return NewsPaperTag(
      newsPaperId: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}news_paper_id'])!,
      tagId: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}tag_id'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['news_paper_id'] = Variable<String>(newsPaperId);
    map['tag_id'] = Variable<int>(tagId);
    return map;
  }

  NewsPaperTagsCompanion toCompanion(bool nullToAbsent) {
    return NewsPaperTagsCompanion(
      newsPaperId: Value(newsPaperId),
      tagId: Value(tagId),
    );
  }

  factory NewsPaperTag.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return NewsPaperTag(
      newsPaperId: serializer.fromJson<String>(json['newsPaperId']),
      tagId: serializer.fromJson<int>(json['tagId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'newsPaperId': serializer.toJson<String>(newsPaperId),
      'tagId': serializer.toJson<int>(tagId),
    };
  }

  NewsPaperTag copyWith({String? newsPaperId, int? tagId}) => NewsPaperTag(
        newsPaperId: newsPaperId ?? this.newsPaperId,
        tagId: tagId ?? this.tagId,
      );
  @override
  String toString() {
    return (StringBuffer('NewsPaperTag(')
          ..write('newsPaperId: $newsPaperId, ')
          ..write('tagId: $tagId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(newsPaperId, tagId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is NewsPaperTag &&
          other.newsPaperId == this.newsPaperId &&
          other.tagId == this.tagId);
}

class NewsPaperTagsCompanion extends UpdateCompanion<NewsPaperTag> {
  final Value<String> newsPaperId;
  final Value<int> tagId;
  const NewsPaperTagsCompanion({
    this.newsPaperId = const Value.absent(),
    this.tagId = const Value.absent(),
  });
  NewsPaperTagsCompanion.insert({
    required String newsPaperId,
    required int tagId,
  })  : newsPaperId = Value(newsPaperId),
        tagId = Value(tagId);
  static Insertable<NewsPaperTag> custom({
    Expression<String>? newsPaperId,
    Expression<int>? tagId,
  }) {
    return RawValuesInsertable({
      if (newsPaperId != null) 'news_paper_id': newsPaperId,
      if (tagId != null) 'tag_id': tagId,
    });
  }

  NewsPaperTagsCompanion copyWith(
      {Value<String>? newsPaperId, Value<int>? tagId}) {
    return NewsPaperTagsCompanion(
      newsPaperId: newsPaperId ?? this.newsPaperId,
      tagId: tagId ?? this.tagId,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (newsPaperId.present) {
      map['news_paper_id'] = Variable<String>(newsPaperId.value);
    }
    if (tagId.present) {
      map['tag_id'] = Variable<int>(tagId.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('NewsPaperTagsCompanion(')
          ..write('newsPaperId: $newsPaperId, ')
          ..write('tagId: $tagId')
          ..write(')'))
        .toString();
  }
}

class $NewsPaperTagsTable extends NewsPaperTags
    with TableInfo<$NewsPaperTagsTable, NewsPaperTag> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $NewsPaperTagsTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _newsPaperIdMeta =
      const VerificationMeta('newsPaperId');
  @override
  late final GeneratedColumn<String?> newsPaperId = GeneratedColumn<String?>(
      'news_paper_id', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _tagIdMeta = const VerificationMeta('tagId');
  @override
  late final GeneratedColumn<int?> tagId = GeneratedColumn<int?>(
      'tag_id', aliasedName, false,
      type: const IntType(), requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [newsPaperId, tagId];
  @override
  String get aliasedName => _alias ?? 'news_paper_tags';
  @override
  String get actualTableName => 'news_paper_tags';
  @override
  VerificationContext validateIntegrity(Insertable<NewsPaperTag> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('news_paper_id')) {
      context.handle(
          _newsPaperIdMeta,
          newsPaperId.isAcceptableOrUnknown(
              data['news_paper_id']!, _newsPaperIdMeta));
    } else if (isInserting) {
      context.missing(_newsPaperIdMeta);
    }
    if (data.containsKey('tag_id')) {
      context.handle(
          _tagIdMeta, tagId.isAcceptableOrUnknown(data['tag_id']!, _tagIdMeta));
    } else if (isInserting) {
      context.missing(_tagIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {newsPaperId, tagId};
  @override
  NewsPaperTag map(Map<String, dynamic> data, {String? tablePrefix}) {
    return NewsPaperTag.fromData(data,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $NewsPaperTagsTable createAlias(String alias) {
    return $NewsPaperTagsTable(attachedDatabase, alias);
  }
}

class NewsPaperLink extends DataClass implements Insertable<NewsPaperLink> {
  final String newsPaperId;
  final String linkId;
  NewsPaperLink({required this.newsPaperId, required this.linkId});
  factory NewsPaperLink.fromData(Map<String, dynamic> data, {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return NewsPaperLink(
      newsPaperId: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}news_paper_id'])!,
      linkId: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}link_id'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['news_paper_id'] = Variable<String>(newsPaperId);
    map['link_id'] = Variable<String>(linkId);
    return map;
  }

  NewsPaperLinksCompanion toCompanion(bool nullToAbsent) {
    return NewsPaperLinksCompanion(
      newsPaperId: Value(newsPaperId),
      linkId: Value(linkId),
    );
  }

  factory NewsPaperLink.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return NewsPaperLink(
      newsPaperId: serializer.fromJson<String>(json['newsPaperId']),
      linkId: serializer.fromJson<String>(json['linkId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'newsPaperId': serializer.toJson<String>(newsPaperId),
      'linkId': serializer.toJson<String>(linkId),
    };
  }

  NewsPaperLink copyWith({String? newsPaperId, String? linkId}) =>
      NewsPaperLink(
        newsPaperId: newsPaperId ?? this.newsPaperId,
        linkId: linkId ?? this.linkId,
      );
  @override
  String toString() {
    return (StringBuffer('NewsPaperLink(')
          ..write('newsPaperId: $newsPaperId, ')
          ..write('linkId: $linkId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(newsPaperId, linkId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is NewsPaperLink &&
          other.newsPaperId == this.newsPaperId &&
          other.linkId == this.linkId);
}

class NewsPaperLinksCompanion extends UpdateCompanion<NewsPaperLink> {
  final Value<String> newsPaperId;
  final Value<String> linkId;
  const NewsPaperLinksCompanion({
    this.newsPaperId = const Value.absent(),
    this.linkId = const Value.absent(),
  });
  NewsPaperLinksCompanion.insert({
    required String newsPaperId,
    required String linkId,
  })  : newsPaperId = Value(newsPaperId),
        linkId = Value(linkId);
  static Insertable<NewsPaperLink> custom({
    Expression<String>? newsPaperId,
    Expression<String>? linkId,
  }) {
    return RawValuesInsertable({
      if (newsPaperId != null) 'news_paper_id': newsPaperId,
      if (linkId != null) 'link_id': linkId,
    });
  }

  NewsPaperLinksCompanion copyWith(
      {Value<String>? newsPaperId, Value<String>? linkId}) {
    return NewsPaperLinksCompanion(
      newsPaperId: newsPaperId ?? this.newsPaperId,
      linkId: linkId ?? this.linkId,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (newsPaperId.present) {
      map['news_paper_id'] = Variable<String>(newsPaperId.value);
    }
    if (linkId.present) {
      map['link_id'] = Variable<String>(linkId.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('NewsPaperLinksCompanion(')
          ..write('newsPaperId: $newsPaperId, ')
          ..write('linkId: $linkId')
          ..write(')'))
        .toString();
  }
}

class $NewsPaperLinksTable extends NewsPaperLinks
    with TableInfo<$NewsPaperLinksTable, NewsPaperLink> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $NewsPaperLinksTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _newsPaperIdMeta =
      const VerificationMeta('newsPaperId');
  @override
  late final GeneratedColumn<String?> newsPaperId = GeneratedColumn<String?>(
      'news_paper_id', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _linkIdMeta = const VerificationMeta('linkId');
  @override
  late final GeneratedColumn<String?> linkId = GeneratedColumn<String?>(
      'link_id', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [newsPaperId, linkId];
  @override
  String get aliasedName => _alias ?? 'news_paper_links';
  @override
  String get actualTableName => 'news_paper_links';
  @override
  VerificationContext validateIntegrity(Insertable<NewsPaperLink> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('news_paper_id')) {
      context.handle(
          _newsPaperIdMeta,
          newsPaperId.isAcceptableOrUnknown(
              data['news_paper_id']!, _newsPaperIdMeta));
    } else if (isInserting) {
      context.missing(_newsPaperIdMeta);
    }
    if (data.containsKey('link_id')) {
      context.handle(_linkIdMeta,
          linkId.isAcceptableOrUnknown(data['link_id']!, _linkIdMeta));
    } else if (isInserting) {
      context.missing(_linkIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {newsPaperId, linkId};
  @override
  NewsPaperLink map(Map<String, dynamic> data, {String? tablePrefix}) {
    return NewsPaperLink.fromData(data,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $NewsPaperLinksTable createAlias(String alias) {
    return $NewsPaperLinksTable(attachedDatabase, alias);
  }
}

class NewsPaperImage extends DataClass implements Insertable<NewsPaperImage> {
  final String newsPaperId;
  final String imageId;
  NewsPaperImage({required this.newsPaperId, required this.imageId});
  factory NewsPaperImage.fromData(Map<String, dynamic> data, {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return NewsPaperImage(
      newsPaperId: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}news_paper_id'])!,
      imageId: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}image_id'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['news_paper_id'] = Variable<String>(newsPaperId);
    map['image_id'] = Variable<String>(imageId);
    return map;
  }

  NewsPaperImagesCompanion toCompanion(bool nullToAbsent) {
    return NewsPaperImagesCompanion(
      newsPaperId: Value(newsPaperId),
      imageId: Value(imageId),
    );
  }

  factory NewsPaperImage.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return NewsPaperImage(
      newsPaperId: serializer.fromJson<String>(json['newsPaperId']),
      imageId: serializer.fromJson<String>(json['imageId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'newsPaperId': serializer.toJson<String>(newsPaperId),
      'imageId': serializer.toJson<String>(imageId),
    };
  }

  NewsPaperImage copyWith({String? newsPaperId, String? imageId}) =>
      NewsPaperImage(
        newsPaperId: newsPaperId ?? this.newsPaperId,
        imageId: imageId ?? this.imageId,
      );
  @override
  String toString() {
    return (StringBuffer('NewsPaperImage(')
          ..write('newsPaperId: $newsPaperId, ')
          ..write('imageId: $imageId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(newsPaperId, imageId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is NewsPaperImage &&
          other.newsPaperId == this.newsPaperId &&
          other.imageId == this.imageId);
}

class NewsPaperImagesCompanion extends UpdateCompanion<NewsPaperImage> {
  final Value<String> newsPaperId;
  final Value<String> imageId;
  const NewsPaperImagesCompanion({
    this.newsPaperId = const Value.absent(),
    this.imageId = const Value.absent(),
  });
  NewsPaperImagesCompanion.insert({
    required String newsPaperId,
    required String imageId,
  })  : newsPaperId = Value(newsPaperId),
        imageId = Value(imageId);
  static Insertable<NewsPaperImage> custom({
    Expression<String>? newsPaperId,
    Expression<String>? imageId,
  }) {
    return RawValuesInsertable({
      if (newsPaperId != null) 'news_paper_id': newsPaperId,
      if (imageId != null) 'image_id': imageId,
    });
  }

  NewsPaperImagesCompanion copyWith(
      {Value<String>? newsPaperId, Value<String>? imageId}) {
    return NewsPaperImagesCompanion(
      newsPaperId: newsPaperId ?? this.newsPaperId,
      imageId: imageId ?? this.imageId,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (newsPaperId.present) {
      map['news_paper_id'] = Variable<String>(newsPaperId.value);
    }
    if (imageId.present) {
      map['image_id'] = Variable<String>(imageId.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('NewsPaperImagesCompanion(')
          ..write('newsPaperId: $newsPaperId, ')
          ..write('imageId: $imageId')
          ..write(')'))
        .toString();
  }
}

class $NewsPaperImagesTable extends NewsPaperImages
    with TableInfo<$NewsPaperImagesTable, NewsPaperImage> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $NewsPaperImagesTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _newsPaperIdMeta =
      const VerificationMeta('newsPaperId');
  @override
  late final GeneratedColumn<String?> newsPaperId = GeneratedColumn<String?>(
      'news_paper_id', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _imageIdMeta = const VerificationMeta('imageId');
  @override
  late final GeneratedColumn<String?> imageId = GeneratedColumn<String?>(
      'image_id', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [newsPaperId, imageId];
  @override
  String get aliasedName => _alias ?? 'news_paper_images';
  @override
  String get actualTableName => 'news_paper_images';
  @override
  VerificationContext validateIntegrity(Insertable<NewsPaperImage> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('news_paper_id')) {
      context.handle(
          _newsPaperIdMeta,
          newsPaperId.isAcceptableOrUnknown(
              data['news_paper_id']!, _newsPaperIdMeta));
    } else if (isInserting) {
      context.missing(_newsPaperIdMeta);
    }
    if (data.containsKey('image_id')) {
      context.handle(_imageIdMeta,
          imageId.isAcceptableOrUnknown(data['image_id']!, _imageIdMeta));
    } else if (isInserting) {
      context.missing(_imageIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {newsPaperId, imageId};
  @override
  NewsPaperImage map(Map<String, dynamic> data, {String? tablePrefix}) {
    return NewsPaperImage.fromData(data,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $NewsPaperImagesTable createAlias(String alias) {
    return $NewsPaperImagesTable(attachedDatabase, alias);
  }
}

class NewsPaperVideo extends DataClass implements Insertable<NewsPaperVideo> {
  final String newsPaperId;
  final String videoId;
  NewsPaperVideo({required this.newsPaperId, required this.videoId});
  factory NewsPaperVideo.fromData(Map<String, dynamic> data, {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return NewsPaperVideo(
      newsPaperId: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}news_paper_id'])!,
      videoId: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}video_id'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['news_paper_id'] = Variable<String>(newsPaperId);
    map['video_id'] = Variable<String>(videoId);
    return map;
  }

  NewsPaperVideosCompanion toCompanion(bool nullToAbsent) {
    return NewsPaperVideosCompanion(
      newsPaperId: Value(newsPaperId),
      videoId: Value(videoId),
    );
  }

  factory NewsPaperVideo.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return NewsPaperVideo(
      newsPaperId: serializer.fromJson<String>(json['newsPaperId']),
      videoId: serializer.fromJson<String>(json['videoId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'newsPaperId': serializer.toJson<String>(newsPaperId),
      'videoId': serializer.toJson<String>(videoId),
    };
  }

  NewsPaperVideo copyWith({String? newsPaperId, String? videoId}) =>
      NewsPaperVideo(
        newsPaperId: newsPaperId ?? this.newsPaperId,
        videoId: videoId ?? this.videoId,
      );
  @override
  String toString() {
    return (StringBuffer('NewsPaperVideo(')
          ..write('newsPaperId: $newsPaperId, ')
          ..write('videoId: $videoId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(newsPaperId, videoId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is NewsPaperVideo &&
          other.newsPaperId == this.newsPaperId &&
          other.videoId == this.videoId);
}

class NewsPaperVideosCompanion extends UpdateCompanion<NewsPaperVideo> {
  final Value<String> newsPaperId;
  final Value<String> videoId;
  const NewsPaperVideosCompanion({
    this.newsPaperId = const Value.absent(),
    this.videoId = const Value.absent(),
  });
  NewsPaperVideosCompanion.insert({
    required String newsPaperId,
    required String videoId,
  })  : newsPaperId = Value(newsPaperId),
        videoId = Value(videoId);
  static Insertable<NewsPaperVideo> custom({
    Expression<String>? newsPaperId,
    Expression<String>? videoId,
  }) {
    return RawValuesInsertable({
      if (newsPaperId != null) 'news_paper_id': newsPaperId,
      if (videoId != null) 'video_id': videoId,
    });
  }

  NewsPaperVideosCompanion copyWith(
      {Value<String>? newsPaperId, Value<String>? videoId}) {
    return NewsPaperVideosCompanion(
      newsPaperId: newsPaperId ?? this.newsPaperId,
      videoId: videoId ?? this.videoId,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (newsPaperId.present) {
      map['news_paper_id'] = Variable<String>(newsPaperId.value);
    }
    if (videoId.present) {
      map['video_id'] = Variable<String>(videoId.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('NewsPaperVideosCompanion(')
          ..write('newsPaperId: $newsPaperId, ')
          ..write('videoId: $videoId')
          ..write(')'))
        .toString();
  }
}

class $NewsPaperVideosTable extends NewsPaperVideos
    with TableInfo<$NewsPaperVideosTable, NewsPaperVideo> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $NewsPaperVideosTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _newsPaperIdMeta =
      const VerificationMeta('newsPaperId');
  @override
  late final GeneratedColumn<String?> newsPaperId = GeneratedColumn<String?>(
      'news_paper_id', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _videoIdMeta = const VerificationMeta('videoId');
  @override
  late final GeneratedColumn<String?> videoId = GeneratedColumn<String?>(
      'video_id', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [newsPaperId, videoId];
  @override
  String get aliasedName => _alias ?? 'news_paper_videos';
  @override
  String get actualTableName => 'news_paper_videos';
  @override
  VerificationContext validateIntegrity(Insertable<NewsPaperVideo> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('news_paper_id')) {
      context.handle(
          _newsPaperIdMeta,
          newsPaperId.isAcceptableOrUnknown(
              data['news_paper_id']!, _newsPaperIdMeta));
    } else if (isInserting) {
      context.missing(_newsPaperIdMeta);
    }
    if (data.containsKey('video_id')) {
      context.handle(_videoIdMeta,
          videoId.isAcceptableOrUnknown(data['video_id']!, _videoIdMeta));
    } else if (isInserting) {
      context.missing(_videoIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {newsPaperId, videoId};
  @override
  NewsPaperVideo map(Map<String, dynamic> data, {String? tablePrefix}) {
    return NewsPaperVideo.fromData(data,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $NewsPaperVideosTable createAlias(String alias) {
    return $NewsPaperVideosTable(attachedDatabase, alias);
  }
}

class NewsPaperAddress extends DataClass
    implements Insertable<NewsPaperAddress> {
  final String newsPaperId;
  final String addressId;
  NewsPaperAddress({required this.newsPaperId, required this.addressId});
  factory NewsPaperAddress.fromData(Map<String, dynamic> data,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return NewsPaperAddress(
      newsPaperId: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}news_paper_id'])!,
      addressId: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}address_id'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['news_paper_id'] = Variable<String>(newsPaperId);
    map['address_id'] = Variable<String>(addressId);
    return map;
  }

  NewsPaperAddressesCompanion toCompanion(bool nullToAbsent) {
    return NewsPaperAddressesCompanion(
      newsPaperId: Value(newsPaperId),
      addressId: Value(addressId),
    );
  }

  factory NewsPaperAddress.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return NewsPaperAddress(
      newsPaperId: serializer.fromJson<String>(json['newsPaperId']),
      addressId: serializer.fromJson<String>(json['addressId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'newsPaperId': serializer.toJson<String>(newsPaperId),
      'addressId': serializer.toJson<String>(addressId),
    };
  }

  NewsPaperAddress copyWith({String? newsPaperId, String? addressId}) =>
      NewsPaperAddress(
        newsPaperId: newsPaperId ?? this.newsPaperId,
        addressId: addressId ?? this.addressId,
      );
  @override
  String toString() {
    return (StringBuffer('NewsPaperAddress(')
          ..write('newsPaperId: $newsPaperId, ')
          ..write('addressId: $addressId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(newsPaperId, addressId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is NewsPaperAddress &&
          other.newsPaperId == this.newsPaperId &&
          other.addressId == this.addressId);
}

class NewsPaperAddressesCompanion extends UpdateCompanion<NewsPaperAddress> {
  final Value<String> newsPaperId;
  final Value<String> addressId;
  const NewsPaperAddressesCompanion({
    this.newsPaperId = const Value.absent(),
    this.addressId = const Value.absent(),
  });
  NewsPaperAddressesCompanion.insert({
    required String newsPaperId,
    required String addressId,
  })  : newsPaperId = Value(newsPaperId),
        addressId = Value(addressId);
  static Insertable<NewsPaperAddress> custom({
    Expression<String>? newsPaperId,
    Expression<String>? addressId,
  }) {
    return RawValuesInsertable({
      if (newsPaperId != null) 'news_paper_id': newsPaperId,
      if (addressId != null) 'address_id': addressId,
    });
  }

  NewsPaperAddressesCompanion copyWith(
      {Value<String>? newsPaperId, Value<String>? addressId}) {
    return NewsPaperAddressesCompanion(
      newsPaperId: newsPaperId ?? this.newsPaperId,
      addressId: addressId ?? this.addressId,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (newsPaperId.present) {
      map['news_paper_id'] = Variable<String>(newsPaperId.value);
    }
    if (addressId.present) {
      map['address_id'] = Variable<String>(addressId.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('NewsPaperAddressesCompanion(')
          ..write('newsPaperId: $newsPaperId, ')
          ..write('addressId: $addressId')
          ..write(')'))
        .toString();
  }
}

class $NewsPaperAddressesTable extends NewsPaperAddresses
    with TableInfo<$NewsPaperAddressesTable, NewsPaperAddress> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $NewsPaperAddressesTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _newsPaperIdMeta =
      const VerificationMeta('newsPaperId');
  @override
  late final GeneratedColumn<String?> newsPaperId = GeneratedColumn<String?>(
      'news_paper_id', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _addressIdMeta = const VerificationMeta('addressId');
  @override
  late final GeneratedColumn<String?> addressId = GeneratedColumn<String?>(
      'address_id', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [newsPaperId, addressId];
  @override
  String get aliasedName => _alias ?? 'news_paper_addresses';
  @override
  String get actualTableName => 'news_paper_addresses';
  @override
  VerificationContext validateIntegrity(Insertable<NewsPaperAddress> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('news_paper_id')) {
      context.handle(
          _newsPaperIdMeta,
          newsPaperId.isAcceptableOrUnknown(
              data['news_paper_id']!, _newsPaperIdMeta));
    } else if (isInserting) {
      context.missing(_newsPaperIdMeta);
    }
    if (data.containsKey('address_id')) {
      context.handle(_addressIdMeta,
          addressId.isAcceptableOrUnknown(data['address_id']!, _addressIdMeta));
    } else if (isInserting) {
      context.missing(_addressIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {newsPaperId, addressId};
  @override
  NewsPaperAddress map(Map<String, dynamic> data, {String? tablePrefix}) {
    return NewsPaperAddress.fromData(data,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $NewsPaperAddressesTable createAlias(String alias) {
    return $NewsPaperAddressesTable(attachedDatabase, alias);
  }
}

class Partner extends DataClass implements Insertable<Partner> {
  final String id;
  final String name;
  final String nameEN;
  final String description;
  final String descriptionEN;
  final String addressId;
  Partner(
      {required this.id,
      required this.name,
      required this.nameEN,
      required this.description,
      required this.descriptionEN,
      required this.addressId});
  factory Partner.fromData(Map<String, dynamic> data, {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return Partner(
      id: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      name: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}name'])!,
      nameEN: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}name_e_n'])!,
      description: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}description'])!,
      descriptionEN: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}description_e_n'])!,
      addressId: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}address_id'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['name'] = Variable<String>(name);
    map['name_e_n'] = Variable<String>(nameEN);
    map['description'] = Variable<String>(description);
    map['description_e_n'] = Variable<String>(descriptionEN);
    map['address_id'] = Variable<String>(addressId);
    return map;
  }

  PartnersCompanion toCompanion(bool nullToAbsent) {
    return PartnersCompanion(
      id: Value(id),
      name: Value(name),
      nameEN: Value(nameEN),
      description: Value(description),
      descriptionEN: Value(descriptionEN),
      addressId: Value(addressId),
    );
  }

  factory Partner.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Partner(
      id: serializer.fromJson<String>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      nameEN: serializer.fromJson<String>(json['nameEN']),
      description: serializer.fromJson<String>(json['description']),
      descriptionEN: serializer.fromJson<String>(json['descriptionEN']),
      addressId: serializer.fromJson<String>(json['addressId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'name': serializer.toJson<String>(name),
      'nameEN': serializer.toJson<String>(nameEN),
      'description': serializer.toJson<String>(description),
      'descriptionEN': serializer.toJson<String>(descriptionEN),
      'addressId': serializer.toJson<String>(addressId),
    };
  }

  Partner copyWith(
          {String? id,
          String? name,
          String? nameEN,
          String? description,
          String? descriptionEN,
          String? addressId}) =>
      Partner(
        id: id ?? this.id,
        name: name ?? this.name,
        nameEN: nameEN ?? this.nameEN,
        description: description ?? this.description,
        descriptionEN: descriptionEN ?? this.descriptionEN,
        addressId: addressId ?? this.addressId,
      );
  @override
  String toString() {
    return (StringBuffer('Partner(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('nameEN: $nameEN, ')
          ..write('description: $description, ')
          ..write('descriptionEN: $descriptionEN, ')
          ..write('addressId: $addressId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, name, nameEN, description, descriptionEN, addressId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Partner &&
          other.id == this.id &&
          other.name == this.name &&
          other.nameEN == this.nameEN &&
          other.description == this.description &&
          other.descriptionEN == this.descriptionEN &&
          other.addressId == this.addressId);
}

class PartnersCompanion extends UpdateCompanion<Partner> {
  final Value<String> id;
  final Value<String> name;
  final Value<String> nameEN;
  final Value<String> description;
  final Value<String> descriptionEN;
  final Value<String> addressId;
  const PartnersCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.nameEN = const Value.absent(),
    this.description = const Value.absent(),
    this.descriptionEN = const Value.absent(),
    this.addressId = const Value.absent(),
  });
  PartnersCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required String nameEN,
    required String description,
    required String descriptionEN,
    required String addressId,
  })  : name = Value(name),
        nameEN = Value(nameEN),
        description = Value(description),
        descriptionEN = Value(descriptionEN),
        addressId = Value(addressId);
  static Insertable<Partner> custom({
    Expression<String>? id,
    Expression<String>? name,
    Expression<String>? nameEN,
    Expression<String>? description,
    Expression<String>? descriptionEN,
    Expression<String>? addressId,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (nameEN != null) 'name_e_n': nameEN,
      if (description != null) 'description': description,
      if (descriptionEN != null) 'description_e_n': descriptionEN,
      if (addressId != null) 'address_id': addressId,
    });
  }

  PartnersCompanion copyWith(
      {Value<String>? id,
      Value<String>? name,
      Value<String>? nameEN,
      Value<String>? description,
      Value<String>? descriptionEN,
      Value<String>? addressId}) {
    return PartnersCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      nameEN: nameEN ?? this.nameEN,
      description: description ?? this.description,
      descriptionEN: descriptionEN ?? this.descriptionEN,
      addressId: addressId ?? this.addressId,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (nameEN.present) {
      map['name_e_n'] = Variable<String>(nameEN.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (descriptionEN.present) {
      map['description_e_n'] = Variable<String>(descriptionEN.value);
    }
    if (addressId.present) {
      map['address_id'] = Variable<String>(addressId.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PartnersCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('nameEN: $nameEN, ')
          ..write('description: $description, ')
          ..write('descriptionEN: $descriptionEN, ')
          ..write('addressId: $addressId')
          ..write(')'))
        .toString();
  }
}

class $PartnersTable extends Partners with TableInfo<$PartnersTable, Partner> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PartnersTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String?> id = GeneratedColumn<String?>(
      'id', aliasedName, false,
      type: const StringType(),
      requiredDuringInsert: false,
      clientDefault: () => _uuid.v4());
  final VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String?> name = GeneratedColumn<String?>(
      'name', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _nameENMeta = const VerificationMeta('nameEN');
  @override
  late final GeneratedColumn<String?> nameEN = GeneratedColumn<String?>(
      'name_e_n', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  @override
  late final GeneratedColumn<String?> description = GeneratedColumn<String?>(
      'description', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _descriptionENMeta =
      const VerificationMeta('descriptionEN');
  @override
  late final GeneratedColumn<String?> descriptionEN = GeneratedColumn<String?>(
      'description_e_n', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _addressIdMeta = const VerificationMeta('addressId');
  @override
  late final GeneratedColumn<String?> addressId = GeneratedColumn<String?>(
      'address_id', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [id, name, nameEN, description, descriptionEN, addressId];
  @override
  String get aliasedName => _alias ?? 'partners';
  @override
  String get actualTableName => 'partners';
  @override
  VerificationContext validateIntegrity(Insertable<Partner> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('name_e_n')) {
      context.handle(_nameENMeta,
          nameEN.isAcceptableOrUnknown(data['name_e_n']!, _nameENMeta));
    } else if (isInserting) {
      context.missing(_nameENMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description']!, _descriptionMeta));
    } else if (isInserting) {
      context.missing(_descriptionMeta);
    }
    if (data.containsKey('description_e_n')) {
      context.handle(
          _descriptionENMeta,
          descriptionEN.isAcceptableOrUnknown(
              data['description_e_n']!, _descriptionENMeta));
    } else if (isInserting) {
      context.missing(_descriptionENMeta);
    }
    if (data.containsKey('address_id')) {
      context.handle(_addressIdMeta,
          addressId.isAcceptableOrUnknown(data['address_id']!, _addressIdMeta));
    } else if (isInserting) {
      context.missing(_addressIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Partner map(Map<String, dynamic> data, {String? tablePrefix}) {
    return Partner.fromData(data,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $PartnersTable createAlias(String alias) {
    return $PartnersTable(attachedDatabase, alias);
  }
}

class PartnerImage extends DataClass implements Insertable<PartnerImage> {
  final String partnerId;
  final String imageId;
  PartnerImage({required this.partnerId, required this.imageId});
  factory PartnerImage.fromData(Map<String, dynamic> data, {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return PartnerImage(
      partnerId: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}partner_id'])!,
      imageId: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}image_id'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['partner_id'] = Variable<String>(partnerId);
    map['image_id'] = Variable<String>(imageId);
    return map;
  }

  PartnerImagesCompanion toCompanion(bool nullToAbsent) {
    return PartnerImagesCompanion(
      partnerId: Value(partnerId),
      imageId: Value(imageId),
    );
  }

  factory PartnerImage.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return PartnerImage(
      partnerId: serializer.fromJson<String>(json['partnerId']),
      imageId: serializer.fromJson<String>(json['imageId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'partnerId': serializer.toJson<String>(partnerId),
      'imageId': serializer.toJson<String>(imageId),
    };
  }

  PartnerImage copyWith({String? partnerId, String? imageId}) => PartnerImage(
        partnerId: partnerId ?? this.partnerId,
        imageId: imageId ?? this.imageId,
      );
  @override
  String toString() {
    return (StringBuffer('PartnerImage(')
          ..write('partnerId: $partnerId, ')
          ..write('imageId: $imageId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(partnerId, imageId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PartnerImage &&
          other.partnerId == this.partnerId &&
          other.imageId == this.imageId);
}

class PartnerImagesCompanion extends UpdateCompanion<PartnerImage> {
  final Value<String> partnerId;
  final Value<String> imageId;
  const PartnerImagesCompanion({
    this.partnerId = const Value.absent(),
    this.imageId = const Value.absent(),
  });
  PartnerImagesCompanion.insert({
    required String partnerId,
    required String imageId,
  })  : partnerId = Value(partnerId),
        imageId = Value(imageId);
  static Insertable<PartnerImage> custom({
    Expression<String>? partnerId,
    Expression<String>? imageId,
  }) {
    return RawValuesInsertable({
      if (partnerId != null) 'partner_id': partnerId,
      if (imageId != null) 'image_id': imageId,
    });
  }

  PartnerImagesCompanion copyWith(
      {Value<String>? partnerId, Value<String>? imageId}) {
    return PartnerImagesCompanion(
      partnerId: partnerId ?? this.partnerId,
      imageId: imageId ?? this.imageId,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (partnerId.present) {
      map['partner_id'] = Variable<String>(partnerId.value);
    }
    if (imageId.present) {
      map['image_id'] = Variable<String>(imageId.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PartnerImagesCompanion(')
          ..write('partnerId: $partnerId, ')
          ..write('imageId: $imageId')
          ..write(')'))
        .toString();
  }
}

class $PartnerImagesTable extends PartnerImages
    with TableInfo<$PartnerImagesTable, PartnerImage> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PartnerImagesTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _partnerIdMeta = const VerificationMeta('partnerId');
  @override
  late final GeneratedColumn<String?> partnerId = GeneratedColumn<String?>(
      'partner_id', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _imageIdMeta = const VerificationMeta('imageId');
  @override
  late final GeneratedColumn<String?> imageId = GeneratedColumn<String?>(
      'image_id', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [partnerId, imageId];
  @override
  String get aliasedName => _alias ?? 'partner_images';
  @override
  String get actualTableName => 'partner_images';
  @override
  VerificationContext validateIntegrity(Insertable<PartnerImage> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('partner_id')) {
      context.handle(_partnerIdMeta,
          partnerId.isAcceptableOrUnknown(data['partner_id']!, _partnerIdMeta));
    } else if (isInserting) {
      context.missing(_partnerIdMeta);
    }
    if (data.containsKey('image_id')) {
      context.handle(_imageIdMeta,
          imageId.isAcceptableOrUnknown(data['image_id']!, _imageIdMeta));
    } else if (isInserting) {
      context.missing(_imageIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {partnerId, imageId};
  @override
  PartnerImage map(Map<String, dynamic> data, {String? tablePrefix}) {
    return PartnerImage.fromData(data,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $PartnerImagesTable createAlias(String alias) {
    return $PartnerImagesTable(attachedDatabase, alias);
  }
}

class PartnerCategory extends DataClass implements Insertable<PartnerCategory> {
  final String partnerId;
  final int categoryId;
  PartnerCategory({required this.partnerId, required this.categoryId});
  factory PartnerCategory.fromData(Map<String, dynamic> data,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return PartnerCategory(
      partnerId: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}partner_id'])!,
      categoryId: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}category_id'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['partner_id'] = Variable<String>(partnerId);
    map['category_id'] = Variable<int>(categoryId);
    return map;
  }

  PartnerCategoriesCompanion toCompanion(bool nullToAbsent) {
    return PartnerCategoriesCompanion(
      partnerId: Value(partnerId),
      categoryId: Value(categoryId),
    );
  }

  factory PartnerCategory.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return PartnerCategory(
      partnerId: serializer.fromJson<String>(json['partnerId']),
      categoryId: serializer.fromJson<int>(json['categoryId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'partnerId': serializer.toJson<String>(partnerId),
      'categoryId': serializer.toJson<int>(categoryId),
    };
  }

  PartnerCategory copyWith({String? partnerId, int? categoryId}) =>
      PartnerCategory(
        partnerId: partnerId ?? this.partnerId,
        categoryId: categoryId ?? this.categoryId,
      );
  @override
  String toString() {
    return (StringBuffer('PartnerCategory(')
          ..write('partnerId: $partnerId, ')
          ..write('categoryId: $categoryId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(partnerId, categoryId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PartnerCategory &&
          other.partnerId == this.partnerId &&
          other.categoryId == this.categoryId);
}

class PartnerCategoriesCompanion extends UpdateCompanion<PartnerCategory> {
  final Value<String> partnerId;
  final Value<int> categoryId;
  const PartnerCategoriesCompanion({
    this.partnerId = const Value.absent(),
    this.categoryId = const Value.absent(),
  });
  PartnerCategoriesCompanion.insert({
    required String partnerId,
    required int categoryId,
  })  : partnerId = Value(partnerId),
        categoryId = Value(categoryId);
  static Insertable<PartnerCategory> custom({
    Expression<String>? partnerId,
    Expression<int>? categoryId,
  }) {
    return RawValuesInsertable({
      if (partnerId != null) 'partner_id': partnerId,
      if (categoryId != null) 'category_id': categoryId,
    });
  }

  PartnerCategoriesCompanion copyWith(
      {Value<String>? partnerId, Value<int>? categoryId}) {
    return PartnerCategoriesCompanion(
      partnerId: partnerId ?? this.partnerId,
      categoryId: categoryId ?? this.categoryId,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (partnerId.present) {
      map['partner_id'] = Variable<String>(partnerId.value);
    }
    if (categoryId.present) {
      map['category_id'] = Variable<int>(categoryId.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PartnerCategoriesCompanion(')
          ..write('partnerId: $partnerId, ')
          ..write('categoryId: $categoryId')
          ..write(')'))
        .toString();
  }
}

class $PartnerCategoriesTable extends PartnerCategories
    with TableInfo<$PartnerCategoriesTable, PartnerCategory> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PartnerCategoriesTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _partnerIdMeta = const VerificationMeta('partnerId');
  @override
  late final GeneratedColumn<String?> partnerId = GeneratedColumn<String?>(
      'partner_id', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _categoryIdMeta = const VerificationMeta('categoryId');
  @override
  late final GeneratedColumn<int?> categoryId = GeneratedColumn<int?>(
      'category_id', aliasedName, false,
      type: const IntType(), requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [partnerId, categoryId];
  @override
  String get aliasedName => _alias ?? 'partner_categories';
  @override
  String get actualTableName => 'partner_categories';
  @override
  VerificationContext validateIntegrity(Insertable<PartnerCategory> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('partner_id')) {
      context.handle(_partnerIdMeta,
          partnerId.isAcceptableOrUnknown(data['partner_id']!, _partnerIdMeta));
    } else if (isInserting) {
      context.missing(_partnerIdMeta);
    }
    if (data.containsKey('category_id')) {
      context.handle(
          _categoryIdMeta,
          categoryId.isAcceptableOrUnknown(
              data['category_id']!, _categoryIdMeta));
    } else if (isInserting) {
      context.missing(_categoryIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {partnerId, categoryId};
  @override
  PartnerCategory map(Map<String, dynamic> data, {String? tablePrefix}) {
    return PartnerCategory.fromData(data,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $PartnerCategoriesTable createAlias(String alias) {
    return $PartnerCategoriesTable(attachedDatabase, alias);
  }
}

class Route extends DataClass implements Insertable<Route> {
  final String id;
  final String name;
  final String nameEN;
  final String author;
  final String authorEN;
  final int cityId;
  final int lengthMeters;
  final bool idPaidRoute;
  final DateTime lastChangedDate;
  Route(
      {required this.id,
      required this.name,
      required this.nameEN,
      required this.author,
      required this.authorEN,
      required this.cityId,
      required this.lengthMeters,
      required this.idPaidRoute,
      required this.lastChangedDate});
  factory Route.fromData(Map<String, dynamic> data, {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return Route(
      id: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      name: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}name'])!,
      nameEN: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}name_e_n'])!,
      author: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}author'])!,
      authorEN: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}author_e_n'])!,
      cityId: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}city_id'])!,
      lengthMeters: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}length_meters'])!,
      idPaidRoute: const BoolType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id_paid_route'])!,
      lastChangedDate: const DateTimeType().mapFromDatabaseResponse(
          data['${effectivePrefix}last_changed_date'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['name'] = Variable<String>(name);
    map['name_e_n'] = Variable<String>(nameEN);
    map['author'] = Variable<String>(author);
    map['author_e_n'] = Variable<String>(authorEN);
    map['city_id'] = Variable<int>(cityId);
    map['length_meters'] = Variable<int>(lengthMeters);
    map['id_paid_route'] = Variable<bool>(idPaidRoute);
    map['last_changed_date'] = Variable<DateTime>(lastChangedDate);
    return map;
  }

  RoutesCompanion toCompanion(bool nullToAbsent) {
    return RoutesCompanion(
      id: Value(id),
      name: Value(name),
      nameEN: Value(nameEN),
      author: Value(author),
      authorEN: Value(authorEN),
      cityId: Value(cityId),
      lengthMeters: Value(lengthMeters),
      idPaidRoute: Value(idPaidRoute),
      lastChangedDate: Value(lastChangedDate),
    );
  }

  factory Route.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Route(
      id: serializer.fromJson<String>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      nameEN: serializer.fromJson<String>(json['nameEN']),
      author: serializer.fromJson<String>(json['author']),
      authorEN: serializer.fromJson<String>(json['authorEN']),
      cityId: serializer.fromJson<int>(json['cityId']),
      lengthMeters: serializer.fromJson<int>(json['lengthMeters']),
      idPaidRoute: serializer.fromJson<bool>(json['idPaidRoute']),
      lastChangedDate: serializer.fromJson<DateTime>(json['lastChangedDate']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'name': serializer.toJson<String>(name),
      'nameEN': serializer.toJson<String>(nameEN),
      'author': serializer.toJson<String>(author),
      'authorEN': serializer.toJson<String>(authorEN),
      'cityId': serializer.toJson<int>(cityId),
      'lengthMeters': serializer.toJson<int>(lengthMeters),
      'idPaidRoute': serializer.toJson<bool>(idPaidRoute),
      'lastChangedDate': serializer.toJson<DateTime>(lastChangedDate),
    };
  }

  Route copyWith(
          {String? id,
          String? name,
          String? nameEN,
          String? author,
          String? authorEN,
          int? cityId,
          int? lengthMeters,
          bool? idPaidRoute,
          DateTime? lastChangedDate}) =>
      Route(
        id: id ?? this.id,
        name: name ?? this.name,
        nameEN: nameEN ?? this.nameEN,
        author: author ?? this.author,
        authorEN: authorEN ?? this.authorEN,
        cityId: cityId ?? this.cityId,
        lengthMeters: lengthMeters ?? this.lengthMeters,
        idPaidRoute: idPaidRoute ?? this.idPaidRoute,
        lastChangedDate: lastChangedDate ?? this.lastChangedDate,
      );
  @override
  String toString() {
    return (StringBuffer('Route(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('nameEN: $nameEN, ')
          ..write('author: $author, ')
          ..write('authorEN: $authorEN, ')
          ..write('cityId: $cityId, ')
          ..write('lengthMeters: $lengthMeters, ')
          ..write('idPaidRoute: $idPaidRoute, ')
          ..write('lastChangedDate: $lastChangedDate')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, nameEN, author, authorEN, cityId,
      lengthMeters, idPaidRoute, lastChangedDate);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Route &&
          other.id == this.id &&
          other.name == this.name &&
          other.nameEN == this.nameEN &&
          other.author == this.author &&
          other.authorEN == this.authorEN &&
          other.cityId == this.cityId &&
          other.lengthMeters == this.lengthMeters &&
          other.idPaidRoute == this.idPaidRoute &&
          other.lastChangedDate == this.lastChangedDate);
}

class RoutesCompanion extends UpdateCompanion<Route> {
  final Value<String> id;
  final Value<String> name;
  final Value<String> nameEN;
  final Value<String> author;
  final Value<String> authorEN;
  final Value<int> cityId;
  final Value<int> lengthMeters;
  final Value<bool> idPaidRoute;
  final Value<DateTime> lastChangedDate;
  const RoutesCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.nameEN = const Value.absent(),
    this.author = const Value.absent(),
    this.authorEN = const Value.absent(),
    this.cityId = const Value.absent(),
    this.lengthMeters = const Value.absent(),
    this.idPaidRoute = const Value.absent(),
    this.lastChangedDate = const Value.absent(),
  });
  RoutesCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required String nameEN,
    required String author,
    required String authorEN,
    required int cityId,
    required int lengthMeters,
    required bool idPaidRoute,
    required DateTime lastChangedDate,
  })  : name = Value(name),
        nameEN = Value(nameEN),
        author = Value(author),
        authorEN = Value(authorEN),
        cityId = Value(cityId),
        lengthMeters = Value(lengthMeters),
        idPaidRoute = Value(idPaidRoute),
        lastChangedDate = Value(lastChangedDate);
  static Insertable<Route> custom({
    Expression<String>? id,
    Expression<String>? name,
    Expression<String>? nameEN,
    Expression<String>? author,
    Expression<String>? authorEN,
    Expression<int>? cityId,
    Expression<int>? lengthMeters,
    Expression<bool>? idPaidRoute,
    Expression<DateTime>? lastChangedDate,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (nameEN != null) 'name_e_n': nameEN,
      if (author != null) 'author': author,
      if (authorEN != null) 'author_e_n': authorEN,
      if (cityId != null) 'city_id': cityId,
      if (lengthMeters != null) 'length_meters': lengthMeters,
      if (idPaidRoute != null) 'id_paid_route': idPaidRoute,
      if (lastChangedDate != null) 'last_changed_date': lastChangedDate,
    });
  }

  RoutesCompanion copyWith(
      {Value<String>? id,
      Value<String>? name,
      Value<String>? nameEN,
      Value<String>? author,
      Value<String>? authorEN,
      Value<int>? cityId,
      Value<int>? lengthMeters,
      Value<bool>? idPaidRoute,
      Value<DateTime>? lastChangedDate}) {
    return RoutesCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      nameEN: nameEN ?? this.nameEN,
      author: author ?? this.author,
      authorEN: authorEN ?? this.authorEN,
      cityId: cityId ?? this.cityId,
      lengthMeters: lengthMeters ?? this.lengthMeters,
      idPaidRoute: idPaidRoute ?? this.idPaidRoute,
      lastChangedDate: lastChangedDate ?? this.lastChangedDate,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (nameEN.present) {
      map['name_e_n'] = Variable<String>(nameEN.value);
    }
    if (author.present) {
      map['author'] = Variable<String>(author.value);
    }
    if (authorEN.present) {
      map['author_e_n'] = Variable<String>(authorEN.value);
    }
    if (cityId.present) {
      map['city_id'] = Variable<int>(cityId.value);
    }
    if (lengthMeters.present) {
      map['length_meters'] = Variable<int>(lengthMeters.value);
    }
    if (idPaidRoute.present) {
      map['id_paid_route'] = Variable<bool>(idPaidRoute.value);
    }
    if (lastChangedDate.present) {
      map['last_changed_date'] = Variable<DateTime>(lastChangedDate.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('RoutesCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('nameEN: $nameEN, ')
          ..write('author: $author, ')
          ..write('authorEN: $authorEN, ')
          ..write('cityId: $cityId, ')
          ..write('lengthMeters: $lengthMeters, ')
          ..write('idPaidRoute: $idPaidRoute, ')
          ..write('lastChangedDate: $lastChangedDate')
          ..write(')'))
        .toString();
  }
}

class $RoutesTable extends Routes with TableInfo<$RoutesTable, Route> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $RoutesTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String?> id = GeneratedColumn<String?>(
      'id', aliasedName, false,
      type: const StringType(),
      requiredDuringInsert: false,
      clientDefault: () => _uuid.v4());
  final VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String?> name = GeneratedColumn<String?>(
      'name', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _nameENMeta = const VerificationMeta('nameEN');
  @override
  late final GeneratedColumn<String?> nameEN = GeneratedColumn<String?>(
      'name_e_n', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _authorMeta = const VerificationMeta('author');
  @override
  late final GeneratedColumn<String?> author = GeneratedColumn<String?>(
      'author', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _authorENMeta = const VerificationMeta('authorEN');
  @override
  late final GeneratedColumn<String?> authorEN = GeneratedColumn<String?>(
      'author_e_n', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _cityIdMeta = const VerificationMeta('cityId');
  @override
  late final GeneratedColumn<int?> cityId = GeneratedColumn<int?>(
      'city_id', aliasedName, false,
      type: const IntType(), requiredDuringInsert: true);
  final VerificationMeta _lengthMetersMeta =
      const VerificationMeta('lengthMeters');
  @override
  late final GeneratedColumn<int?> lengthMeters = GeneratedColumn<int?>(
      'length_meters', aliasedName, false,
      type: const IntType(), requiredDuringInsert: true);
  final VerificationMeta _idPaidRouteMeta =
      const VerificationMeta('idPaidRoute');
  @override
  late final GeneratedColumn<bool?> idPaidRoute = GeneratedColumn<bool?>(
      'id_paid_route', aliasedName, false,
      type: const BoolType(),
      requiredDuringInsert: true,
      defaultConstraints: 'CHECK (id_paid_route IN (0, 1))');
  final VerificationMeta _lastChangedDateMeta =
      const VerificationMeta('lastChangedDate');
  @override
  late final GeneratedColumn<DateTime?> lastChangedDate =
      GeneratedColumn<DateTime?>('last_changed_date', aliasedName, false,
          type: const IntType(), requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        name,
        nameEN,
        author,
        authorEN,
        cityId,
        lengthMeters,
        idPaidRoute,
        lastChangedDate
      ];
  @override
  String get aliasedName => _alias ?? 'routes';
  @override
  String get actualTableName => 'routes';
  @override
  VerificationContext validateIntegrity(Insertable<Route> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('name_e_n')) {
      context.handle(_nameENMeta,
          nameEN.isAcceptableOrUnknown(data['name_e_n']!, _nameENMeta));
    } else if (isInserting) {
      context.missing(_nameENMeta);
    }
    if (data.containsKey('author')) {
      context.handle(_authorMeta,
          author.isAcceptableOrUnknown(data['author']!, _authorMeta));
    } else if (isInserting) {
      context.missing(_authorMeta);
    }
    if (data.containsKey('author_e_n')) {
      context.handle(_authorENMeta,
          authorEN.isAcceptableOrUnknown(data['author_e_n']!, _authorENMeta));
    } else if (isInserting) {
      context.missing(_authorENMeta);
    }
    if (data.containsKey('city_id')) {
      context.handle(_cityIdMeta,
          cityId.isAcceptableOrUnknown(data['city_id']!, _cityIdMeta));
    } else if (isInserting) {
      context.missing(_cityIdMeta);
    }
    if (data.containsKey('length_meters')) {
      context.handle(
          _lengthMetersMeta,
          lengthMeters.isAcceptableOrUnknown(
              data['length_meters']!, _lengthMetersMeta));
    } else if (isInserting) {
      context.missing(_lengthMetersMeta);
    }
    if (data.containsKey('id_paid_route')) {
      context.handle(
          _idPaidRouteMeta,
          idPaidRoute.isAcceptableOrUnknown(
              data['id_paid_route']!, _idPaidRouteMeta));
    } else if (isInserting) {
      context.missing(_idPaidRouteMeta);
    }
    if (data.containsKey('last_changed_date')) {
      context.handle(
          _lastChangedDateMeta,
          lastChangedDate.isAcceptableOrUnknown(
              data['last_changed_date']!, _lastChangedDateMeta));
    } else if (isInserting) {
      context.missing(_lastChangedDateMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Route map(Map<String, dynamic> data, {String? tablePrefix}) {
    return Route.fromData(data,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $RoutesTable createAlias(String alias) {
    return $RoutesTable(attachedDatabase, alias);
  }
}

class RouteArt extends DataClass implements Insertable<RouteArt> {
  final String routeId;
  final String artId;
  RouteArt({required this.routeId, required this.artId});
  factory RouteArt.fromData(Map<String, dynamic> data, {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return RouteArt(
      routeId: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}route_id'])!,
      artId: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}art_id'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['route_id'] = Variable<String>(routeId);
    map['art_id'] = Variable<String>(artId);
    return map;
  }

  RouteArtsCompanion toCompanion(bool nullToAbsent) {
    return RouteArtsCompanion(
      routeId: Value(routeId),
      artId: Value(artId),
    );
  }

  factory RouteArt.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return RouteArt(
      routeId: serializer.fromJson<String>(json['routeId']),
      artId: serializer.fromJson<String>(json['artId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'routeId': serializer.toJson<String>(routeId),
      'artId': serializer.toJson<String>(artId),
    };
  }

  RouteArt copyWith({String? routeId, String? artId}) => RouteArt(
        routeId: routeId ?? this.routeId,
        artId: artId ?? this.artId,
      );
  @override
  String toString() {
    return (StringBuffer('RouteArt(')
          ..write('routeId: $routeId, ')
          ..write('artId: $artId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(routeId, artId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is RouteArt &&
          other.routeId == this.routeId &&
          other.artId == this.artId);
}

class RouteArtsCompanion extends UpdateCompanion<RouteArt> {
  final Value<String> routeId;
  final Value<String> artId;
  const RouteArtsCompanion({
    this.routeId = const Value.absent(),
    this.artId = const Value.absent(),
  });
  RouteArtsCompanion.insert({
    required String routeId,
    required String artId,
  })  : routeId = Value(routeId),
        artId = Value(artId);
  static Insertable<RouteArt> custom({
    Expression<String>? routeId,
    Expression<String>? artId,
  }) {
    return RawValuesInsertable({
      if (routeId != null) 'route_id': routeId,
      if (artId != null) 'art_id': artId,
    });
  }

  RouteArtsCompanion copyWith({Value<String>? routeId, Value<String>? artId}) {
    return RouteArtsCompanion(
      routeId: routeId ?? this.routeId,
      artId: artId ?? this.artId,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (routeId.present) {
      map['route_id'] = Variable<String>(routeId.value);
    }
    if (artId.present) {
      map['art_id'] = Variable<String>(artId.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('RouteArtsCompanion(')
          ..write('routeId: $routeId, ')
          ..write('artId: $artId')
          ..write(')'))
        .toString();
  }
}

class $RouteArtsTable extends RouteArts
    with TableInfo<$RouteArtsTable, RouteArt> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $RouteArtsTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _routeIdMeta = const VerificationMeta('routeId');
  @override
  late final GeneratedColumn<String?> routeId = GeneratedColumn<String?>(
      'route_id', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _artIdMeta = const VerificationMeta('artId');
  @override
  late final GeneratedColumn<String?> artId = GeneratedColumn<String?>(
      'art_id', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [routeId, artId];
  @override
  String get aliasedName => _alias ?? 'route_arts';
  @override
  String get actualTableName => 'route_arts';
  @override
  VerificationContext validateIntegrity(Insertable<RouteArt> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('route_id')) {
      context.handle(_routeIdMeta,
          routeId.isAcceptableOrUnknown(data['route_id']!, _routeIdMeta));
    } else if (isInserting) {
      context.missing(_routeIdMeta);
    }
    if (data.containsKey('art_id')) {
      context.handle(
          _artIdMeta, artId.isAcceptableOrUnknown(data['art_id']!, _artIdMeta));
    } else if (isInserting) {
      context.missing(_artIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {routeId, artId};
  @override
  RouteArt map(Map<String, dynamic> data, {String? tablePrefix}) {
    return RouteArt.fromData(data,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $RouteArtsTable createAlias(String alias) {
    return $RouteArtsTable(attachedDatabase, alias);
  }
}

class RouteAddress extends DataClass implements Insertable<RouteAddress> {
  final String routeId;
  final String addressId;
  RouteAddress({required this.routeId, required this.addressId});
  factory RouteAddress.fromData(Map<String, dynamic> data, {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return RouteAddress(
      routeId: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}route_id'])!,
      addressId: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}address_id'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['route_id'] = Variable<String>(routeId);
    map['address_id'] = Variable<String>(addressId);
    return map;
  }

  RouteAddressesCompanion toCompanion(bool nullToAbsent) {
    return RouteAddressesCompanion(
      routeId: Value(routeId),
      addressId: Value(addressId),
    );
  }

  factory RouteAddress.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return RouteAddress(
      routeId: serializer.fromJson<String>(json['routeId']),
      addressId: serializer.fromJson<String>(json['addressId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'routeId': serializer.toJson<String>(routeId),
      'addressId': serializer.toJson<String>(addressId),
    };
  }

  RouteAddress copyWith({String? routeId, String? addressId}) => RouteAddress(
        routeId: routeId ?? this.routeId,
        addressId: addressId ?? this.addressId,
      );
  @override
  String toString() {
    return (StringBuffer('RouteAddress(')
          ..write('routeId: $routeId, ')
          ..write('addressId: $addressId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(routeId, addressId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is RouteAddress &&
          other.routeId == this.routeId &&
          other.addressId == this.addressId);
}

class RouteAddressesCompanion extends UpdateCompanion<RouteAddress> {
  final Value<String> routeId;
  final Value<String> addressId;
  const RouteAddressesCompanion({
    this.routeId = const Value.absent(),
    this.addressId = const Value.absent(),
  });
  RouteAddressesCompanion.insert({
    required String routeId,
    required String addressId,
  })  : routeId = Value(routeId),
        addressId = Value(addressId);
  static Insertable<RouteAddress> custom({
    Expression<String>? routeId,
    Expression<String>? addressId,
  }) {
    return RawValuesInsertable({
      if (routeId != null) 'route_id': routeId,
      if (addressId != null) 'address_id': addressId,
    });
  }

  RouteAddressesCompanion copyWith(
      {Value<String>? routeId, Value<String>? addressId}) {
    return RouteAddressesCompanion(
      routeId: routeId ?? this.routeId,
      addressId: addressId ?? this.addressId,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (routeId.present) {
      map['route_id'] = Variable<String>(routeId.value);
    }
    if (addressId.present) {
      map['address_id'] = Variable<String>(addressId.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('RouteAddressesCompanion(')
          ..write('routeId: $routeId, ')
          ..write('addressId: $addressId')
          ..write(')'))
        .toString();
  }
}

class $RouteAddressesTable extends RouteAddresses
    with TableInfo<$RouteAddressesTable, RouteAddress> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $RouteAddressesTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _routeIdMeta = const VerificationMeta('routeId');
  @override
  late final GeneratedColumn<String?> routeId = GeneratedColumn<String?>(
      'route_id', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _addressIdMeta = const VerificationMeta('addressId');
  @override
  late final GeneratedColumn<String?> addressId = GeneratedColumn<String?>(
      'address_id', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [routeId, addressId];
  @override
  String get aliasedName => _alias ?? 'route_addresses';
  @override
  String get actualTableName => 'route_addresses';
  @override
  VerificationContext validateIntegrity(Insertable<RouteAddress> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('route_id')) {
      context.handle(_routeIdMeta,
          routeId.isAcceptableOrUnknown(data['route_id']!, _routeIdMeta));
    } else if (isInserting) {
      context.missing(_routeIdMeta);
    }
    if (data.containsKey('address_id')) {
      context.handle(_addressIdMeta,
          addressId.isAcceptableOrUnknown(data['address_id']!, _addressIdMeta));
    } else if (isInserting) {
      context.missing(_addressIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {routeId, addressId};
  @override
  RouteAddress map(Map<String, dynamic> data, {String? tablePrefix}) {
    return RouteAddress.fromData(data,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $RouteAddressesTable createAlias(String alias) {
    return $RouteAddressesTable(attachedDatabase, alias);
  }
}

class RouteCategory extends DataClass implements Insertable<RouteCategory> {
  final String routeId;
  final int categoryId;
  RouteCategory({required this.routeId, required this.categoryId});
  factory RouteCategory.fromData(Map<String, dynamic> data, {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return RouteCategory(
      routeId: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}route_id'])!,
      categoryId: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}category_id'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['route_id'] = Variable<String>(routeId);
    map['category_id'] = Variable<int>(categoryId);
    return map;
  }

  RouteCategoriesCompanion toCompanion(bool nullToAbsent) {
    return RouteCategoriesCompanion(
      routeId: Value(routeId),
      categoryId: Value(categoryId),
    );
  }

  factory RouteCategory.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return RouteCategory(
      routeId: serializer.fromJson<String>(json['routeId']),
      categoryId: serializer.fromJson<int>(json['categoryId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'routeId': serializer.toJson<String>(routeId),
      'categoryId': serializer.toJson<int>(categoryId),
    };
  }

  RouteCategory copyWith({String? routeId, int? categoryId}) => RouteCategory(
        routeId: routeId ?? this.routeId,
        categoryId: categoryId ?? this.categoryId,
      );
  @override
  String toString() {
    return (StringBuffer('RouteCategory(')
          ..write('routeId: $routeId, ')
          ..write('categoryId: $categoryId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(routeId, categoryId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is RouteCategory &&
          other.routeId == this.routeId &&
          other.categoryId == this.categoryId);
}

class RouteCategoriesCompanion extends UpdateCompanion<RouteCategory> {
  final Value<String> routeId;
  final Value<int> categoryId;
  const RouteCategoriesCompanion({
    this.routeId = const Value.absent(),
    this.categoryId = const Value.absent(),
  });
  RouteCategoriesCompanion.insert({
    required String routeId,
    required int categoryId,
  })  : routeId = Value(routeId),
        categoryId = Value(categoryId);
  static Insertable<RouteCategory> custom({
    Expression<String>? routeId,
    Expression<int>? categoryId,
  }) {
    return RawValuesInsertable({
      if (routeId != null) 'route_id': routeId,
      if (categoryId != null) 'category_id': categoryId,
    });
  }

  RouteCategoriesCompanion copyWith(
      {Value<String>? routeId, Value<int>? categoryId}) {
    return RouteCategoriesCompanion(
      routeId: routeId ?? this.routeId,
      categoryId: categoryId ?? this.categoryId,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (routeId.present) {
      map['route_id'] = Variable<String>(routeId.value);
    }
    if (categoryId.present) {
      map['category_id'] = Variable<int>(categoryId.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('RouteCategoriesCompanion(')
          ..write('routeId: $routeId, ')
          ..write('categoryId: $categoryId')
          ..write(')'))
        .toString();
  }
}

class $RouteCategoriesTable extends RouteCategories
    with TableInfo<$RouteCategoriesTable, RouteCategory> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $RouteCategoriesTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _routeIdMeta = const VerificationMeta('routeId');
  @override
  late final GeneratedColumn<String?> routeId = GeneratedColumn<String?>(
      'route_id', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _categoryIdMeta = const VerificationMeta('categoryId');
  @override
  late final GeneratedColumn<int?> categoryId = GeneratedColumn<int?>(
      'category_id', aliasedName, false,
      type: const IntType(), requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [routeId, categoryId];
  @override
  String get aliasedName => _alias ?? 'route_categories';
  @override
  String get actualTableName => 'route_categories';
  @override
  VerificationContext validateIntegrity(Insertable<RouteCategory> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('route_id')) {
      context.handle(_routeIdMeta,
          routeId.isAcceptableOrUnknown(data['route_id']!, _routeIdMeta));
    } else if (isInserting) {
      context.missing(_routeIdMeta);
    }
    if (data.containsKey('category_id')) {
      context.handle(
          _categoryIdMeta,
          categoryId.isAcceptableOrUnknown(
              data['category_id']!, _categoryIdMeta));
    } else if (isInserting) {
      context.missing(_categoryIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {routeId, categoryId};
  @override
  RouteCategory map(Map<String, dynamic> data, {String? tablePrefix}) {
    return RouteCategory.fromData(data,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $RouteCategoriesTable createAlias(String alias) {
    return $RouteCategoriesTable(attachedDatabase, alias);
  }
}

class Address extends DataClass implements Insertable<Address> {
  final String id;
  final String name;
  final String nameEN;
  final int cityId;
  final double lat;
  final double lng;
  Address(
      {required this.id,
      required this.name,
      required this.nameEN,
      required this.cityId,
      required this.lat,
      required this.lng});
  factory Address.fromData(Map<String, dynamic> data, {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return Address(
      id: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      name: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}name'])!,
      nameEN: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}name_e_n'])!,
      cityId: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}city_id'])!,
      lat: const RealType()
          .mapFromDatabaseResponse(data['${effectivePrefix}lat'])!,
      lng: const RealType()
          .mapFromDatabaseResponse(data['${effectivePrefix}lng'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['name'] = Variable<String>(name);
    map['name_e_n'] = Variable<String>(nameEN);
    map['city_id'] = Variable<int>(cityId);
    map['lat'] = Variable<double>(lat);
    map['lng'] = Variable<double>(lng);
    return map;
  }

  AddressesCompanion toCompanion(bool nullToAbsent) {
    return AddressesCompanion(
      id: Value(id),
      name: Value(name),
      nameEN: Value(nameEN),
      cityId: Value(cityId),
      lat: Value(lat),
      lng: Value(lng),
    );
  }

  factory Address.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Address(
      id: serializer.fromJson<String>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      nameEN: serializer.fromJson<String>(json['nameEN']),
      cityId: serializer.fromJson<int>(json['cityId']),
      lat: serializer.fromJson<double>(json['lat']),
      lng: serializer.fromJson<double>(json['lng']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'name': serializer.toJson<String>(name),
      'nameEN': serializer.toJson<String>(nameEN),
      'cityId': serializer.toJson<int>(cityId),
      'lat': serializer.toJson<double>(lat),
      'lng': serializer.toJson<double>(lng),
    };
  }

  Address copyWith(
          {String? id,
          String? name,
          String? nameEN,
          int? cityId,
          double? lat,
          double? lng}) =>
      Address(
        id: id ?? this.id,
        name: name ?? this.name,
        nameEN: nameEN ?? this.nameEN,
        cityId: cityId ?? this.cityId,
        lat: lat ?? this.lat,
        lng: lng ?? this.lng,
      );
  @override
  String toString() {
    return (StringBuffer('Address(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('nameEN: $nameEN, ')
          ..write('cityId: $cityId, ')
          ..write('lat: $lat, ')
          ..write('lng: $lng')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, nameEN, cityId, lat, lng);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Address &&
          other.id == this.id &&
          other.name == this.name &&
          other.nameEN == this.nameEN &&
          other.cityId == this.cityId &&
          other.lat == this.lat &&
          other.lng == this.lng);
}

class AddressesCompanion extends UpdateCompanion<Address> {
  final Value<String> id;
  final Value<String> name;
  final Value<String> nameEN;
  final Value<int> cityId;
  final Value<double> lat;
  final Value<double> lng;
  const AddressesCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.nameEN = const Value.absent(),
    this.cityId = const Value.absent(),
    this.lat = const Value.absent(),
    this.lng = const Value.absent(),
  });
  AddressesCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required String nameEN,
    required int cityId,
    required double lat,
    required double lng,
  })  : name = Value(name),
        nameEN = Value(nameEN),
        cityId = Value(cityId),
        lat = Value(lat),
        lng = Value(lng);
  static Insertable<Address> custom({
    Expression<String>? id,
    Expression<String>? name,
    Expression<String>? nameEN,
    Expression<int>? cityId,
    Expression<double>? lat,
    Expression<double>? lng,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (nameEN != null) 'name_e_n': nameEN,
      if (cityId != null) 'city_id': cityId,
      if (lat != null) 'lat': lat,
      if (lng != null) 'lng': lng,
    });
  }

  AddressesCompanion copyWith(
      {Value<String>? id,
      Value<String>? name,
      Value<String>? nameEN,
      Value<int>? cityId,
      Value<double>? lat,
      Value<double>? lng}) {
    return AddressesCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      nameEN: nameEN ?? this.nameEN,
      cityId: cityId ?? this.cityId,
      lat: lat ?? this.lat,
      lng: lng ?? this.lng,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (nameEN.present) {
      map['name_e_n'] = Variable<String>(nameEN.value);
    }
    if (cityId.present) {
      map['city_id'] = Variable<int>(cityId.value);
    }
    if (lat.present) {
      map['lat'] = Variable<double>(lat.value);
    }
    if (lng.present) {
      map['lng'] = Variable<double>(lng.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AddressesCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('nameEN: $nameEN, ')
          ..write('cityId: $cityId, ')
          ..write('lat: $lat, ')
          ..write('lng: $lng')
          ..write(')'))
        .toString();
  }
}

class $AddressesTable extends Addresses
    with TableInfo<$AddressesTable, Address> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $AddressesTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String?> id = GeneratedColumn<String?>(
      'id', aliasedName, false,
      type: const StringType(),
      requiredDuringInsert: false,
      clientDefault: () => _uuid.v4());
  final VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String?> name = GeneratedColumn<String?>(
      'name', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _nameENMeta = const VerificationMeta('nameEN');
  @override
  late final GeneratedColumn<String?> nameEN = GeneratedColumn<String?>(
      'name_e_n', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _cityIdMeta = const VerificationMeta('cityId');
  @override
  late final GeneratedColumn<int?> cityId = GeneratedColumn<int?>(
      'city_id', aliasedName, false,
      type: const IntType(), requiredDuringInsert: true);
  final VerificationMeta _latMeta = const VerificationMeta('lat');
  @override
  late final GeneratedColumn<double?> lat = GeneratedColumn<double?>(
      'lat', aliasedName, false,
      type: const RealType(), requiredDuringInsert: true);
  final VerificationMeta _lngMeta = const VerificationMeta('lng');
  @override
  late final GeneratedColumn<double?> lng = GeneratedColumn<double?>(
      'lng', aliasedName, false,
      type: const RealType(), requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, name, nameEN, cityId, lat, lng];
  @override
  String get aliasedName => _alias ?? 'addresses';
  @override
  String get actualTableName => 'addresses';
  @override
  VerificationContext validateIntegrity(Insertable<Address> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('name_e_n')) {
      context.handle(_nameENMeta,
          nameEN.isAcceptableOrUnknown(data['name_e_n']!, _nameENMeta));
    } else if (isInserting) {
      context.missing(_nameENMeta);
    }
    if (data.containsKey('city_id')) {
      context.handle(_cityIdMeta,
          cityId.isAcceptableOrUnknown(data['city_id']!, _cityIdMeta));
    } else if (isInserting) {
      context.missing(_cityIdMeta);
    }
    if (data.containsKey('lat')) {
      context.handle(
          _latMeta, lat.isAcceptableOrUnknown(data['lat']!, _latMeta));
    } else if (isInserting) {
      context.missing(_latMeta);
    }
    if (data.containsKey('lng')) {
      context.handle(
          _lngMeta, lng.isAcceptableOrUnknown(data['lng']!, _lngMeta));
    } else if (isInserting) {
      context.missing(_lngMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Address map(Map<String, dynamic> data, {String? tablePrefix}) {
    return Address.fromData(data,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $AddressesTable createAlias(String alias) {
    return $AddressesTable(attachedDatabase, alias);
  }
}

class City extends DataClass implements Insertable<City> {
  final int id;
  final String name;
  final String nameEN;
  final int countryId;
  City(
      {required this.id,
      required this.name,
      required this.nameEN,
      required this.countryId});
  factory City.fromData(Map<String, dynamic> data, {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return City(
      id: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      name: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}name'])!,
      nameEN: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}name_e_n'])!,
      countryId: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}country_id'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['name_e_n'] = Variable<String>(nameEN);
    map['country_id'] = Variable<int>(countryId);
    return map;
  }

  CitiesCompanion toCompanion(bool nullToAbsent) {
    return CitiesCompanion(
      id: Value(id),
      name: Value(name),
      nameEN: Value(nameEN),
      countryId: Value(countryId),
    );
  }

  factory City.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return City(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      nameEN: serializer.fromJson<String>(json['nameEN']),
      countryId: serializer.fromJson<int>(json['countryId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'nameEN': serializer.toJson<String>(nameEN),
      'countryId': serializer.toJson<int>(countryId),
    };
  }

  City copyWith({int? id, String? name, String? nameEN, int? countryId}) =>
      City(
        id: id ?? this.id,
        name: name ?? this.name,
        nameEN: nameEN ?? this.nameEN,
        countryId: countryId ?? this.countryId,
      );
  @override
  String toString() {
    return (StringBuffer('City(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('nameEN: $nameEN, ')
          ..write('countryId: $countryId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, nameEN, countryId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is City &&
          other.id == this.id &&
          other.name == this.name &&
          other.nameEN == this.nameEN &&
          other.countryId == this.countryId);
}

class CitiesCompanion extends UpdateCompanion<City> {
  final Value<int> id;
  final Value<String> name;
  final Value<String> nameEN;
  final Value<int> countryId;
  const CitiesCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.nameEN = const Value.absent(),
    this.countryId = const Value.absent(),
  });
  CitiesCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required String nameEN,
    required int countryId,
  })  : name = Value(name),
        nameEN = Value(nameEN),
        countryId = Value(countryId);
  static Insertable<City> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? nameEN,
    Expression<int>? countryId,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (nameEN != null) 'name_e_n': nameEN,
      if (countryId != null) 'country_id': countryId,
    });
  }

  CitiesCompanion copyWith(
      {Value<int>? id,
      Value<String>? name,
      Value<String>? nameEN,
      Value<int>? countryId}) {
    return CitiesCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      nameEN: nameEN ?? this.nameEN,
      countryId: countryId ?? this.countryId,
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
    if (nameEN.present) {
      map['name_e_n'] = Variable<String>(nameEN.value);
    }
    if (countryId.present) {
      map['country_id'] = Variable<int>(countryId.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CitiesCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('nameEN: $nameEN, ')
          ..write('countryId: $countryId')
          ..write(')'))
        .toString();
  }
}

class $CitiesTable extends Cities with TableInfo<$CitiesTable, City> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CitiesTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int?> id = GeneratedColumn<int?>(
      'id', aliasedName, false,
      type: const IntType(), requiredDuringInsert: false);
  final VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String?> name = GeneratedColumn<String?>(
      'name', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _nameENMeta = const VerificationMeta('nameEN');
  @override
  late final GeneratedColumn<String?> nameEN = GeneratedColumn<String?>(
      'name_e_n', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _countryIdMeta = const VerificationMeta('countryId');
  @override
  late final GeneratedColumn<int?> countryId = GeneratedColumn<int?>(
      'country_id', aliasedName, false,
      type: const IntType(), requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, name, nameEN, countryId];
  @override
  String get aliasedName => _alias ?? 'cities';
  @override
  String get actualTableName => 'cities';
  @override
  VerificationContext validateIntegrity(Insertable<City> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('name_e_n')) {
      context.handle(_nameENMeta,
          nameEN.isAcceptableOrUnknown(data['name_e_n']!, _nameENMeta));
    } else if (isInserting) {
      context.missing(_nameENMeta);
    }
    if (data.containsKey('country_id')) {
      context.handle(_countryIdMeta,
          countryId.isAcceptableOrUnknown(data['country_id']!, _countryIdMeta));
    } else if (isInserting) {
      context.missing(_countryIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  City map(Map<String, dynamic> data, {String? tablePrefix}) {
    return City.fromData(data,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $CitiesTable createAlias(String alias) {
    return $CitiesTable(attachedDatabase, alias);
  }
}

class Country extends DataClass implements Insertable<Country> {
  final int id;
  final String name;
  final String nameEN;
  Country({required this.id, required this.name, required this.nameEN});
  factory Country.fromData(Map<String, dynamic> data, {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return Country(
      id: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      name: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}name'])!,
      nameEN: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}name_e_n'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['name_e_n'] = Variable<String>(nameEN);
    return map;
  }

  CountriesCompanion toCompanion(bool nullToAbsent) {
    return CountriesCompanion(
      id: Value(id),
      name: Value(name),
      nameEN: Value(nameEN),
    );
  }

  factory Country.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Country(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      nameEN: serializer.fromJson<String>(json['nameEN']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'nameEN': serializer.toJson<String>(nameEN),
    };
  }

  Country copyWith({int? id, String? name, String? nameEN}) => Country(
        id: id ?? this.id,
        name: name ?? this.name,
        nameEN: nameEN ?? this.nameEN,
      );
  @override
  String toString() {
    return (StringBuffer('Country(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('nameEN: $nameEN')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, nameEN);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Country &&
          other.id == this.id &&
          other.name == this.name &&
          other.nameEN == this.nameEN);
}

class CountriesCompanion extends UpdateCompanion<Country> {
  final Value<int> id;
  final Value<String> name;
  final Value<String> nameEN;
  const CountriesCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.nameEN = const Value.absent(),
  });
  CountriesCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required String nameEN,
  })  : name = Value(name),
        nameEN = Value(nameEN);
  static Insertable<Country> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? nameEN,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (nameEN != null) 'name_e_n': nameEN,
    });
  }

  CountriesCompanion copyWith(
      {Value<int>? id, Value<String>? name, Value<String>? nameEN}) {
    return CountriesCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      nameEN: nameEN ?? this.nameEN,
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
    if (nameEN.present) {
      map['name_e_n'] = Variable<String>(nameEN.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CountriesCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('nameEN: $nameEN')
          ..write(')'))
        .toString();
  }
}

class $CountriesTable extends Countries
    with TableInfo<$CountriesTable, Country> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CountriesTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int?> id = GeneratedColumn<int?>(
      'id', aliasedName, false,
      type: const IntType(), requiredDuringInsert: false);
  final VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String?> name = GeneratedColumn<String?>(
      'name', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _nameENMeta = const VerificationMeta('nameEN');
  @override
  late final GeneratedColumn<String?> nameEN = GeneratedColumn<String?>(
      'name_e_n', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, name, nameEN];
  @override
  String get aliasedName => _alias ?? 'countries';
  @override
  String get actualTableName => 'countries';
  @override
  VerificationContext validateIntegrity(Insertable<Country> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('name_e_n')) {
      context.handle(_nameENMeta,
          nameEN.isAcceptableOrUnknown(data['name_e_n']!, _nameENMeta));
    } else if (isInserting) {
      context.missing(_nameENMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Country map(Map<String, dynamic> data, {String? tablePrefix}) {
    return Country.fromData(data,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $CountriesTable createAlias(String alias) {
    return $CountriesTable(attachedDatabase, alias);
  }
}

class Image extends DataClass implements Insertable<Image> {
  final String id;
  final String imageUrl;
  Image({required this.id, required this.imageUrl});
  factory Image.fromData(Map<String, dynamic> data, {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return Image(
      id: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      imageUrl: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}image_url'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['image_url'] = Variable<String>(imageUrl);
    return map;
  }

  ImagesCompanion toCompanion(bool nullToAbsent) {
    return ImagesCompanion(
      id: Value(id),
      imageUrl: Value(imageUrl),
    );
  }

  factory Image.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Image(
      id: serializer.fromJson<String>(json['id']),
      imageUrl: serializer.fromJson<String>(json['imageUrl']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'imageUrl': serializer.toJson<String>(imageUrl),
    };
  }

  Image copyWith({String? id, String? imageUrl}) => Image(
        id: id ?? this.id,
        imageUrl: imageUrl ?? this.imageUrl,
      );
  @override
  String toString() {
    return (StringBuffer('Image(')
          ..write('id: $id, ')
          ..write('imageUrl: $imageUrl')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, imageUrl);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Image &&
          other.id == this.id &&
          other.imageUrl == this.imageUrl);
}

class ImagesCompanion extends UpdateCompanion<Image> {
  final Value<String> id;
  final Value<String> imageUrl;
  const ImagesCompanion({
    this.id = const Value.absent(),
    this.imageUrl = const Value.absent(),
  });
  ImagesCompanion.insert({
    this.id = const Value.absent(),
    required String imageUrl,
  }) : imageUrl = Value(imageUrl);
  static Insertable<Image> custom({
    Expression<String>? id,
    Expression<String>? imageUrl,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (imageUrl != null) 'image_url': imageUrl,
    });
  }

  ImagesCompanion copyWith({Value<String>? id, Value<String>? imageUrl}) {
    return ImagesCompanion(
      id: id ?? this.id,
      imageUrl: imageUrl ?? this.imageUrl,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (imageUrl.present) {
      map['image_url'] = Variable<String>(imageUrl.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ImagesCompanion(')
          ..write('id: $id, ')
          ..write('imageUrl: $imageUrl')
          ..write(')'))
        .toString();
  }
}

class $ImagesTable extends Images with TableInfo<$ImagesTable, Image> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ImagesTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String?> id = GeneratedColumn<String?>(
      'id', aliasedName, false,
      type: const StringType(),
      requiredDuringInsert: false,
      clientDefault: () => _uuid.v4());
  final VerificationMeta _imageUrlMeta = const VerificationMeta('imageUrl');
  @override
  late final GeneratedColumn<String?> imageUrl = GeneratedColumn<String?>(
      'image_url', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, imageUrl];
  @override
  String get aliasedName => _alias ?? 'images';
  @override
  String get actualTableName => 'images';
  @override
  VerificationContext validateIntegrity(Insertable<Image> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('image_url')) {
      context.handle(_imageUrlMeta,
          imageUrl.isAcceptableOrUnknown(data['image_url']!, _imageUrlMeta));
    } else if (isInserting) {
      context.missing(_imageUrlMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Image map(Map<String, dynamic> data, {String? tablePrefix}) {
    return Image.fromData(data,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $ImagesTable createAlias(String alias) {
    return $ImagesTable(attachedDatabase, alias);
  }
}

class Video extends DataClass implements Insertable<Video> {
  final String id;
  final String videoUrl;
  Video({required this.id, required this.videoUrl});
  factory Video.fromData(Map<String, dynamic> data, {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return Video(
      id: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      videoUrl: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}video_url'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['video_url'] = Variable<String>(videoUrl);
    return map;
  }

  VideosCompanion toCompanion(bool nullToAbsent) {
    return VideosCompanion(
      id: Value(id),
      videoUrl: Value(videoUrl),
    );
  }

  factory Video.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Video(
      id: serializer.fromJson<String>(json['id']),
      videoUrl: serializer.fromJson<String>(json['videoUrl']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'videoUrl': serializer.toJson<String>(videoUrl),
    };
  }

  Video copyWith({String? id, String? videoUrl}) => Video(
        id: id ?? this.id,
        videoUrl: videoUrl ?? this.videoUrl,
      );
  @override
  String toString() {
    return (StringBuffer('Video(')
          ..write('id: $id, ')
          ..write('videoUrl: $videoUrl')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, videoUrl);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Video &&
          other.id == this.id &&
          other.videoUrl == this.videoUrl);
}

class VideosCompanion extends UpdateCompanion<Video> {
  final Value<String> id;
  final Value<String> videoUrl;
  const VideosCompanion({
    this.id = const Value.absent(),
    this.videoUrl = const Value.absent(),
  });
  VideosCompanion.insert({
    this.id = const Value.absent(),
    required String videoUrl,
  }) : videoUrl = Value(videoUrl);
  static Insertable<Video> custom({
    Expression<String>? id,
    Expression<String>? videoUrl,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (videoUrl != null) 'video_url': videoUrl,
    });
  }

  VideosCompanion copyWith({Value<String>? id, Value<String>? videoUrl}) {
    return VideosCompanion(
      id: id ?? this.id,
      videoUrl: videoUrl ?? this.videoUrl,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (videoUrl.present) {
      map['video_url'] = Variable<String>(videoUrl.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('VideosCompanion(')
          ..write('id: $id, ')
          ..write('videoUrl: $videoUrl')
          ..write(')'))
        .toString();
  }
}

class $VideosTable extends Videos with TableInfo<$VideosTable, Video> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $VideosTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String?> id = GeneratedColumn<String?>(
      'id', aliasedName, false,
      type: const StringType(),
      requiredDuringInsert: false,
      clientDefault: () => _uuid.v4());
  final VerificationMeta _videoUrlMeta = const VerificationMeta('videoUrl');
  @override
  late final GeneratedColumn<String?> videoUrl = GeneratedColumn<String?>(
      'video_url', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, videoUrl];
  @override
  String get aliasedName => _alias ?? 'videos';
  @override
  String get actualTableName => 'videos';
  @override
  VerificationContext validateIntegrity(Insertable<Video> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('video_url')) {
      context.handle(_videoUrlMeta,
          videoUrl.isAcceptableOrUnknown(data['video_url']!, _videoUrlMeta));
    } else if (isInserting) {
      context.missing(_videoUrlMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Video map(Map<String, dynamic> data, {String? tablePrefix}) {
    return Video.fromData(data,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $VideosTable createAlias(String alias) {
    return $VideosTable(attachedDatabase, alias);
  }
}

class Category extends DataClass implements Insertable<Category> {
  final int id;
  final String name;
  final String nameEN;
  Category({required this.id, required this.name, required this.nameEN});
  factory Category.fromData(Map<String, dynamic> data, {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return Category(
      id: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      name: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}name'])!,
      nameEN: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}name_e_n'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['name_e_n'] = Variable<String>(nameEN);
    return map;
  }

  CategoriesCompanion toCompanion(bool nullToAbsent) {
    return CategoriesCompanion(
      id: Value(id),
      name: Value(name),
      nameEN: Value(nameEN),
    );
  }

  factory Category.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Category(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      nameEN: serializer.fromJson<String>(json['nameEN']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'nameEN': serializer.toJson<String>(nameEN),
    };
  }

  Category copyWith({int? id, String? name, String? nameEN}) => Category(
        id: id ?? this.id,
        name: name ?? this.name,
        nameEN: nameEN ?? this.nameEN,
      );
  @override
  String toString() {
    return (StringBuffer('Category(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('nameEN: $nameEN')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, nameEN);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Category &&
          other.id == this.id &&
          other.name == this.name &&
          other.nameEN == this.nameEN);
}

class CategoriesCompanion extends UpdateCompanion<Category> {
  final Value<int> id;
  final Value<String> name;
  final Value<String> nameEN;
  const CategoriesCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.nameEN = const Value.absent(),
  });
  CategoriesCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required String nameEN,
  })  : name = Value(name),
        nameEN = Value(nameEN);
  static Insertable<Category> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? nameEN,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (nameEN != null) 'name_e_n': nameEN,
    });
  }

  CategoriesCompanion copyWith(
      {Value<int>? id, Value<String>? name, Value<String>? nameEN}) {
    return CategoriesCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      nameEN: nameEN ?? this.nameEN,
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
    if (nameEN.present) {
      map['name_e_n'] = Variable<String>(nameEN.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CategoriesCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('nameEN: $nameEN')
          ..write(')'))
        .toString();
  }
}

class $CategoriesTable extends Categories
    with TableInfo<$CategoriesTable, Category> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CategoriesTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int?> id = GeneratedColumn<int?>(
      'id', aliasedName, false,
      type: const IntType(), requiredDuringInsert: false);
  final VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String?> name = GeneratedColumn<String?>(
      'name', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _nameENMeta = const VerificationMeta('nameEN');
  @override
  late final GeneratedColumn<String?> nameEN = GeneratedColumn<String?>(
      'name_e_n', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, name, nameEN];
  @override
  String get aliasedName => _alias ?? 'categories';
  @override
  String get actualTableName => 'categories';
  @override
  VerificationContext validateIntegrity(Insertable<Category> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('name_e_n')) {
      context.handle(_nameENMeta,
          nameEN.isAcceptableOrUnknown(data['name_e_n']!, _nameENMeta));
    } else if (isInserting) {
      context.missing(_nameENMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Category map(Map<String, dynamic> data, {String? tablePrefix}) {
    return Category.fromData(data,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $CategoriesTable createAlias(String alias) {
    return $CategoriesTable(attachedDatabase, alias);
  }
}

class Link extends DataClass implements Insertable<Link> {
  final String id;
  final String url;
  final String title;
  final String titleEN;
  Link(
      {required this.id,
      required this.url,
      required this.title,
      required this.titleEN});
  factory Link.fromData(Map<String, dynamic> data, {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return Link(
      id: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      url: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}url'])!,
      title: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}title'])!,
      titleEN: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}title_e_n'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['url'] = Variable<String>(url);
    map['title'] = Variable<String>(title);
    map['title_e_n'] = Variable<String>(titleEN);
    return map;
  }

  LinksCompanion toCompanion(bool nullToAbsent) {
    return LinksCompanion(
      id: Value(id),
      url: Value(url),
      title: Value(title),
      titleEN: Value(titleEN),
    );
  }

  factory Link.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Link(
      id: serializer.fromJson<String>(json['id']),
      url: serializer.fromJson<String>(json['url']),
      title: serializer.fromJson<String>(json['title']),
      titleEN: serializer.fromJson<String>(json['titleEN']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'url': serializer.toJson<String>(url),
      'title': serializer.toJson<String>(title),
      'titleEN': serializer.toJson<String>(titleEN),
    };
  }

  Link copyWith({String? id, String? url, String? title, String? titleEN}) =>
      Link(
        id: id ?? this.id,
        url: url ?? this.url,
        title: title ?? this.title,
        titleEN: titleEN ?? this.titleEN,
      );
  @override
  String toString() {
    return (StringBuffer('Link(')
          ..write('id: $id, ')
          ..write('url: $url, ')
          ..write('title: $title, ')
          ..write('titleEN: $titleEN')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, url, title, titleEN);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Link &&
          other.id == this.id &&
          other.url == this.url &&
          other.title == this.title &&
          other.titleEN == this.titleEN);
}

class LinksCompanion extends UpdateCompanion<Link> {
  final Value<String> id;
  final Value<String> url;
  final Value<String> title;
  final Value<String> titleEN;
  const LinksCompanion({
    this.id = const Value.absent(),
    this.url = const Value.absent(),
    this.title = const Value.absent(),
    this.titleEN = const Value.absent(),
  });
  LinksCompanion.insert({
    this.id = const Value.absent(),
    required String url,
    required String title,
    required String titleEN,
  })  : url = Value(url),
        title = Value(title),
        titleEN = Value(titleEN);
  static Insertable<Link> custom({
    Expression<String>? id,
    Expression<String>? url,
    Expression<String>? title,
    Expression<String>? titleEN,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (url != null) 'url': url,
      if (title != null) 'title': title,
      if (titleEN != null) 'title_e_n': titleEN,
    });
  }

  LinksCompanion copyWith(
      {Value<String>? id,
      Value<String>? url,
      Value<String>? title,
      Value<String>? titleEN}) {
    return LinksCompanion(
      id: id ?? this.id,
      url: url ?? this.url,
      title: title ?? this.title,
      titleEN: titleEN ?? this.titleEN,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (url.present) {
      map['url'] = Variable<String>(url.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (titleEN.present) {
      map['title_e_n'] = Variable<String>(titleEN.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('LinksCompanion(')
          ..write('id: $id, ')
          ..write('url: $url, ')
          ..write('title: $title, ')
          ..write('titleEN: $titleEN')
          ..write(')'))
        .toString();
  }
}

class $LinksTable extends Links with TableInfo<$LinksTable, Link> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $LinksTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String?> id = GeneratedColumn<String?>(
      'id', aliasedName, false,
      type: const StringType(),
      requiredDuringInsert: false,
      clientDefault: () => _uuid.v4());
  final VerificationMeta _urlMeta = const VerificationMeta('url');
  @override
  late final GeneratedColumn<String?> url = GeneratedColumn<String?>(
      'url', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String?> title = GeneratedColumn<String?>(
      'title', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _titleENMeta = const VerificationMeta('titleEN');
  @override
  late final GeneratedColumn<String?> titleEN = GeneratedColumn<String?>(
      'title_e_n', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, url, title, titleEN];
  @override
  String get aliasedName => _alias ?? 'links';
  @override
  String get actualTableName => 'links';
  @override
  VerificationContext validateIntegrity(Insertable<Link> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('url')) {
      context.handle(
          _urlMeta, url.isAcceptableOrUnknown(data['url']!, _urlMeta));
    } else if (isInserting) {
      context.missing(_urlMeta);
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('title_e_n')) {
      context.handle(_titleENMeta,
          titleEN.isAcceptableOrUnknown(data['title_e_n']!, _titleENMeta));
    } else if (isInserting) {
      context.missing(_titleENMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Link map(Map<String, dynamic> data, {String? tablePrefix}) {
    return Link.fromData(data,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $LinksTable createAlias(String alias) {
    return $LinksTable(attachedDatabase, alias);
  }
}

class Tag extends DataClass implements Insertable<Tag> {
  final int id;
  final String tag;
  final String tagEN;
  Tag({required this.id, required this.tag, required this.tagEN});
  factory Tag.fromData(Map<String, dynamic> data, {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return Tag(
      id: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      tag: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}tag'])!,
      tagEN: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}tag_e_n'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['tag'] = Variable<String>(tag);
    map['tag_e_n'] = Variable<String>(tagEN);
    return map;
  }

  TagsCompanion toCompanion(bool nullToAbsent) {
    return TagsCompanion(
      id: Value(id),
      tag: Value(tag),
      tagEN: Value(tagEN),
    );
  }

  factory Tag.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Tag(
      id: serializer.fromJson<int>(json['id']),
      tag: serializer.fromJson<String>(json['tag']),
      tagEN: serializer.fromJson<String>(json['tagEN']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'tag': serializer.toJson<String>(tag),
      'tagEN': serializer.toJson<String>(tagEN),
    };
  }

  Tag copyWith({int? id, String? tag, String? tagEN}) => Tag(
        id: id ?? this.id,
        tag: tag ?? this.tag,
        tagEN: tagEN ?? this.tagEN,
      );
  @override
  String toString() {
    return (StringBuffer('Tag(')
          ..write('id: $id, ')
          ..write('tag: $tag, ')
          ..write('tagEN: $tagEN')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, tag, tagEN);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Tag &&
          other.id == this.id &&
          other.tag == this.tag &&
          other.tagEN == this.tagEN);
}

class TagsCompanion extends UpdateCompanion<Tag> {
  final Value<int> id;
  final Value<String> tag;
  final Value<String> tagEN;
  const TagsCompanion({
    this.id = const Value.absent(),
    this.tag = const Value.absent(),
    this.tagEN = const Value.absent(),
  });
  TagsCompanion.insert({
    this.id = const Value.absent(),
    required String tag,
    required String tagEN,
  })  : tag = Value(tag),
        tagEN = Value(tagEN);
  static Insertable<Tag> custom({
    Expression<int>? id,
    Expression<String>? tag,
    Expression<String>? tagEN,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (tag != null) 'tag': tag,
      if (tagEN != null) 'tag_e_n': tagEN,
    });
  }

  TagsCompanion copyWith(
      {Value<int>? id, Value<String>? tag, Value<String>? tagEN}) {
    return TagsCompanion(
      id: id ?? this.id,
      tag: tag ?? this.tag,
      tagEN: tagEN ?? this.tagEN,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (tag.present) {
      map['tag'] = Variable<String>(tag.value);
    }
    if (tagEN.present) {
      map['tag_e_n'] = Variable<String>(tagEN.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TagsCompanion(')
          ..write('id: $id, ')
          ..write('tag: $tag, ')
          ..write('tagEN: $tagEN')
          ..write(')'))
        .toString();
  }
}

class $TagsTable extends Tags with TableInfo<$TagsTable, Tag> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TagsTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int?> id = GeneratedColumn<int?>(
      'id', aliasedName, false,
      type: const IntType(), requiredDuringInsert: false);
  final VerificationMeta _tagMeta = const VerificationMeta('tag');
  @override
  late final GeneratedColumn<String?> tag = GeneratedColumn<String?>(
      'tag', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _tagENMeta = const VerificationMeta('tagEN');
  @override
  late final GeneratedColumn<String?> tagEN = GeneratedColumn<String?>(
      'tag_e_n', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, tag, tagEN];
  @override
  String get aliasedName => _alias ?? 'tags';
  @override
  String get actualTableName => 'tags';
  @override
  VerificationContext validateIntegrity(Insertable<Tag> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('tag')) {
      context.handle(
          _tagMeta, tag.isAcceptableOrUnknown(data['tag']!, _tagMeta));
    } else if (isInserting) {
      context.missing(_tagMeta);
    }
    if (data.containsKey('tag_e_n')) {
      context.handle(_tagENMeta,
          tagEN.isAcceptableOrUnknown(data['tag_e_n']!, _tagENMeta));
    } else if (isInserting) {
      context.missing(_tagENMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Tag map(Map<String, dynamic> data, {String? tablePrefix}) {
    return Tag.fromData(data,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $TagsTable createAlias(String alias) {
    return $TagsTable(attachedDatabase, alias);
  }
}

abstract class _$PublicArtDB extends GeneratedDatabase {
  _$PublicArtDB(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  late final $AuthorsTable authors = $AuthorsTable(this);
  late final $AuthorTagsTable authorTags = $AuthorTagsTable(this);
  late final $AuthorLinksTable authorLinks = $AuthorLinksTable(this);
  late final $ArtsTable arts = $ArtsTable(this);
  late final $ArtWorksTable artWorks = $ArtWorksTable(this);
  late final $ArtCategoriesTable artCategories = $ArtCategoriesTable(this);
  late final $NewsPapersTable newsPapers = $NewsPapersTable(this);
  late final $NewsPaperTagsTable newsPaperTags = $NewsPaperTagsTable(this);
  late final $NewsPaperLinksTable newsPaperLinks = $NewsPaperLinksTable(this);
  late final $NewsPaperImagesTable newsPaperImages =
      $NewsPaperImagesTable(this);
  late final $NewsPaperVideosTable newsPaperVideos =
      $NewsPaperVideosTable(this);
  late final $NewsPaperAddressesTable newsPaperAddresses =
      $NewsPaperAddressesTable(this);
  late final $PartnersTable partners = $PartnersTable(this);
  late final $PartnerImagesTable partnerImages = $PartnerImagesTable(this);
  late final $PartnerCategoriesTable partnerCategories =
      $PartnerCategoriesTable(this);
  late final $RoutesTable routes = $RoutesTable(this);
  late final $RouteArtsTable routeArts = $RouteArtsTable(this);
  late final $RouteAddressesTable routeAddresses = $RouteAddressesTable(this);
  late final $RouteCategoriesTable routeCategories =
      $RouteCategoriesTable(this);
  late final $AddressesTable addresses = $AddressesTable(this);
  late final $CitiesTable cities = $CitiesTable(this);
  late final $CountriesTable countries = $CountriesTable(this);
  late final $ImagesTable images = $ImagesTable(this);
  late final $VideosTable videos = $VideosTable(this);
  late final $CategoriesTable categories = $CategoriesTable(this);
  late final $LinksTable links = $LinksTable(this);
  late final $TagsTable tags = $TagsTable(this);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
        authors,
        authorTags,
        authorLinks,
        arts,
        artWorks,
        artCategories,
        newsPapers,
        newsPaperTags,
        newsPaperLinks,
        newsPaperImages,
        newsPaperVideos,
        newsPaperAddresses,
        partners,
        partnerImages,
        partnerCategories,
        routes,
        routeArts,
        routeAddresses,
        routeCategories,
        addresses,
        cities,
        countries,
        images,
        videos,
        categories,
        links,
        tags
      ];
}

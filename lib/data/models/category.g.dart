// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CategoryTranslationsAdapter extends TypeAdapter<CategoryTranslations> {
  @override
  final int typeId = 3;

  @override
  CategoryTranslations read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CategoryTranslations(
      es: fields[0] as String,
      en: fields[1] as String,
      it: fields[2] as String,
      fr: fields[3] as String,
      de: fields[4] as String,
      pt: fields[5] as String,
    );
  }

  @override
  void write(BinaryWriter writer, CategoryTranslations obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.es)
      ..writeByte(1)
      ..write(obj.en)
      ..writeByte(2)
      ..write(obj.it)
      ..writeByte(3)
      ..write(obj.fr)
      ..writeByte(4)
      ..write(obj.de)
      ..writeByte(5)
      ..write(obj.pt);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CategoryTranslationsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class CategoryMeaningsAdapter extends TypeAdapter<CategoryMeanings> {
  @override
  final int typeId = 4;

  @override
  CategoryMeanings read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CategoryMeanings(
      es: fields[0] as String,
      en: fields[1] as String,
      it: fields[2] as String,
      fr: fields[3] as String,
      de: fields[4] as String,
      pt: fields[5] as String,
    );
  }

  @override
  void write(BinaryWriter writer, CategoryMeanings obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.es)
      ..writeByte(1)
      ..write(obj.en)
      ..writeByte(2)
      ..write(obj.it)
      ..writeByte(3)
      ..write(obj.fr)
      ..writeByte(4)
      ..write(obj.de)
      ..writeByte(5)
      ..write(obj.pt);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CategoryMeaningsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class CategoryAdapter extends TypeAdapter<Category> {
  @override
  final int typeId = 5;

  @override
  Category read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Category(
      idGroup: fields[0] as int,
      categories: fields[1] as CategoryTranslations,
      meanings: fields[2] as CategoryMeanings,
    );
  }

  @override
  void write(BinaryWriter writer, Category obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.idGroup)
      ..writeByte(1)
      ..write(obj.categories)
      ..writeByte(2)
      ..write(obj.meanings);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CategoryAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CategoryTranslationsImpl _$$CategoryTranslationsImplFromJson(
        Map<String, dynamic> json) =>
    _$CategoryTranslationsImpl(
      es: json['es'] as String,
      en: json['en'] as String,
      it: json['it'] as String,
      fr: json['fr'] as String,
      de: json['de'] as String,
      pt: json['pt'] as String,
    );

Map<String, dynamic> _$$CategoryTranslationsImplToJson(
        _$CategoryTranslationsImpl instance) =>
    <String, dynamic>{
      'es': instance.es,
      'en': instance.en,
      'it': instance.it,
      'fr': instance.fr,
      'de': instance.de,
      'pt': instance.pt,
    };

_$CategoryMeaningsImpl _$$CategoryMeaningsImplFromJson(
        Map<String, dynamic> json) =>
    _$CategoryMeaningsImpl(
      es: json['es'] as String,
      en: json['en'] as String,
      it: json['it'] as String,
      fr: json['fr'] as String,
      de: json['de'] as String,
      pt: json['pt'] as String,
    );

Map<String, dynamic> _$$CategoryMeaningsImplToJson(
        _$CategoryMeaningsImpl instance) =>
    <String, dynamic>{
      'es': instance.es,
      'en': instance.en,
      'it': instance.it,
      'fr': instance.fr,
      'de': instance.de,
      'pt': instance.pt,
    };

_$CategoryImpl _$$CategoryImplFromJson(Map<String, dynamic> json) =>
    _$CategoryImpl(
      idGroup: (json['idGroup'] as num).toInt(),
      categories: CategoryTranslations.fromJson(
          json['categories'] as Map<String, dynamic>),
      meanings:
          CategoryMeanings.fromJson(json['meanings'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$CategoryImplToJson(_$CategoryImpl instance) =>
    <String, dynamic>{
      'idGroup': instance.idGroup,
      'categories': instance.categories,
      'meanings': instance.meanings,
    };

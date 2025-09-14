// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'word.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class WordTranslationsAdapter extends TypeAdapter<WordTranslations> {
  @override
  final int typeId = 0;

  @override
  WordTranslations read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return WordTranslations(
      es: fields[0] as String,
      en: fields[1] as String,
      it: fields[2] as String,
      fr: fields[3] as String,
      de: fields[4] as String,
      pt: fields[5] as String,
    );
  }

  @override
  void write(BinaryWriter writer, WordTranslations obj) {
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
      other is WordTranslationsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class WordMeaningsAdapter extends TypeAdapter<WordMeanings> {
  @override
  final int typeId = 1;

  @override
  WordMeanings read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return WordMeanings(
      es: fields[0] as String,
      en: fields[1] as String,
      it: fields[2] as String,
      fr: fields[3] as String,
      de: fields[4] as String,
      pt: fields[5] as String,
    );
  }

  @override
  void write(BinaryWriter writer, WordMeanings obj) {
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
      other is WordMeaningsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class WordAdapter extends TypeAdapter<Word> {
  @override
  final int typeId = 2;

  @override
  Word read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Word(
      id: fields[0] as int,
      level: fields[1] as String,
      group: fields[2] as int,
      names: fields[3] as WordTranslations,
      meanings: fields[4] as WordMeanings,
    );
  }

  @override
  void write(BinaryWriter writer, Word obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.level)
      ..writeByte(2)
      ..write(obj.group)
      ..writeByte(3)
      ..write(obj.names)
      ..writeByte(4)
      ..write(obj.meanings);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is WordAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$WordTranslationsImpl _$$WordTranslationsImplFromJson(
        Map<String, dynamic> json) =>
    _$WordTranslationsImpl(
      es: json['es'] as String,
      en: json['en'] as String,
      it: json['it'] as String,
      fr: json['fr'] as String,
      de: json['de'] as String,
      pt: json['pt'] as String,
    );

Map<String, dynamic> _$$WordTranslationsImplToJson(
        _$WordTranslationsImpl instance) =>
    <String, dynamic>{
      'es': instance.es,
      'en': instance.en,
      'it': instance.it,
      'fr': instance.fr,
      'de': instance.de,
      'pt': instance.pt,
    };

_$WordMeaningsImpl _$$WordMeaningsImplFromJson(Map<String, dynamic> json) =>
    _$WordMeaningsImpl(
      es: json['es'] as String,
      en: json['en'] as String,
      it: json['it'] as String,
      fr: json['fr'] as String,
      de: json['de'] as String,
      pt: json['pt'] as String,
    );

Map<String, dynamic> _$$WordMeaningsImplToJson(_$WordMeaningsImpl instance) =>
    <String, dynamic>{
      'es': instance.es,
      'en': instance.en,
      'it': instance.it,
      'fr': instance.fr,
      'de': instance.de,
      'pt': instance.pt,
    };

_$WordImpl _$$WordImplFromJson(Map<String, dynamic> json) => _$WordImpl(
      id: (json['id'] as num).toInt(),
      level: json['level'] as String,
      group: (json['group'] as num).toInt(),
      names: WordTranslations.fromJson(json['names'] as Map<String, dynamic>),
      meanings: WordMeanings.fromJson(json['meanings'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$WordImplToJson(_$WordImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'level': instance.level,
      'group': instance.group,
      'names': instance.names,
      'meanings': instance.meanings,
    };

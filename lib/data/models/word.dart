import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

part 'word.freezed.dart';
part 'word.g.dart';

@freezed
@HiveType(typeId: 0)
class WordTranslations with _$WordTranslations {
  const factory WordTranslations({
    @HiveField(0) required String es,
    @HiveField(1) required String en,
    @HiveField(2) required String it,
    @HiveField(3) required String fr,
    @HiveField(4) required String de,
    @HiveField(5) required String pt,
  }) = _WordTranslations;

  factory WordTranslations.fromJson(Map<String, dynamic> json) =>
      _$WordTranslationsFromJson(json);
}

@freezed
@HiveType(typeId: 1)
class WordMeanings with _$WordMeanings {
  const factory WordMeanings({
    @HiveField(0) required String es,
    @HiveField(1) required String en,
    @HiveField(2) required String it,
    @HiveField(3) required String fr,
    @HiveField(4) required String de,
    @HiveField(5) required String pt,
  }) = _WordMeanings;

  factory WordMeanings.fromJson(Map<String, dynamic> json) =>
      _$WordMeaningsFromJson(json);
}

@freezed
@HiveType(typeId: 2)
class Word with _$Word {
  const Word._();

  const factory Word({
    @HiveField(0) required int id,
    @HiveField(1) required String level,
    @HiveField(2) required int group,
    @HiveField(3) required WordTranslations names,
    @HiveField(4) required WordMeanings meanings,
  }) = _Word;

  factory Word.fromJson(Map<String, dynamic> json) => _$WordFromJson(json);

  String getNameByLanguage(String language) {
    switch (language.toLowerCase()) {
      case 'es':
        return names.es;
      case 'en':
        return names.en;
      case 'it':
        return names.it;
      case 'fr':
        return names.fr;
      case 'de':
        return names.de;
      case 'pt':
        return names.pt;
      default:
        return names.en;
    }
  }

  String getMeaningByLanguage(String language) {
    switch (language.toLowerCase()) {
      case 'es':
        return meanings.es;
      case 'en':
        return meanings.en;
      case 'it':
        return meanings.it;
      case 'fr':
        return meanings.fr;
      case 'de':
        return meanings.de;
      case 'pt':
        return meanings.pt;
      default:
        return meanings.en;
    }
  }
}

// Remove extension - methods are now part of class

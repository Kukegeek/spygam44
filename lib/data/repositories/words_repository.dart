import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../models/word.dart';
import '../services/hive_service.dart';

part 'words_repository.g.dart';

@riverpod
WordsRepository wordsRepository(WordsRepositoryRef ref) {
  return WordsRepository();
}

class WordsRepository {
  List<Word> getAllWords() {
    return HiveService.wordsBox.values.toList();
  }

  List<Word> getWordsByLanguageAndLevel(String language, String level) {
    return HiveService.wordsBox.values
        .where((word) => word.level.toLowerCase() == level.toLowerCase())
        .toList();
  }

  Word? getWordById(int id) {
    return HiveService.wordsBox.values
        .where((word) => word.id == id)
        .firstOrNull;
  }

  bool wordExists(String wordText, String language) {
    return HiveService.wordsBox.values.any((word) {
      switch (language.toLowerCase()) {
        case 'es':
          return word.names.es.toLowerCase() == wordText.toLowerCase();
        case 'en':
          return word.names.en.toLowerCase() == wordText.toLowerCase();
        case 'it':
          return word.names.it.toLowerCase() == wordText.toLowerCase();
        case 'fr':
          return word.names.fr.toLowerCase() == wordText.toLowerCase();
        case 'de':
          return word.names.de.toLowerCase() == wordText.toLowerCase();
        case 'pt':
          return word.names.pt.toLowerCase() == wordText.toLowerCase();
        default:
          return word.names.en.toLowerCase() == wordText.toLowerCase();
      }
    });
  }

  Word? findWordByText(String wordText, String language) {
    for (Word word in HiveService.wordsBox.values) {
      String wordName = word.getNameByLanguage(language);
      if (wordName.toLowerCase() == wordText.toLowerCase()) {
        return word;
      }
    }
    return null;
  }

  Future<void> addWord(Word word) async {
    await HiveService.wordsBox.put(word.id, word);
  }

  Future<void> addWords(List<Word> words) async {
    final Map<int, Word> wordMap = {};
    for (Word word in words) {
      wordMap[word.id] = word;
    }
    await HiveService.wordsBox.putAll(wordMap);
  }

  Future<void> deleteWord(int id) async {
    await HiveService.wordsBox.delete(id);
  }

  Future<void> clear() async {
    await HiveService.wordsBox.clear();
  }

  int getWordCount() {
    return HiveService.wordsBox.length;
  }

  List<String> getAvailableLevels() {
    return HiveService.wordsBox.values
        .map((word) => word.level)
        .toSet()
        .toList()
      ..sort();
  }
}

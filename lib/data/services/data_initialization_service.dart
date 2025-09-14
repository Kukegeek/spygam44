import 'dart:convert';
import 'package:flutter/services.dart';
import '../models/word.dart';
import '../models/category.dart';
import 'hive_service.dart';

class DataInitializationService {
  static bool _isInitialized = false;

  static Future<void> initializeIfNeeded() async {
    if (_isInitialized) return;

    try {
      await _initializeWords();
      await _initializeCategories();
      _isInitialized = true;
    } catch (e) {
      print('Error initializing data: $e');
    }
  }

  static Future<void> _initializeWords() async {
    // Check if words are already loaded
    if (HiveService.wordsBox.isNotEmpty) return;

    try {
      final String jsonString =
          await rootBundle.loadString('assets/data/words.json');
      final List<dynamic> jsonList = json.decode(jsonString);

      final List<Word> words =
          jsonList.map((json) => Word.fromJson(json)).toList();

      // Save words to Hive
      final Map<int, Word> wordMap = {};
      for (Word word in words) {
        wordMap[word.id] = word;
      }

      await HiveService.wordsBox.putAll(wordMap);
      print('Loaded ${words.length} words');
    } catch (e) {
      print('Error loading words: $e');
    }
  }

  static Future<void> _initializeCategories() async {
    // Check if categories are already loaded
    if (HiveService.categoriesBox.isNotEmpty) return;

    try {
      final String jsonString =
          await rootBundle.loadString('assets/data/cat.json');
      final List<dynamic> jsonList = json.decode(jsonString);

      final List<Category> categories =
          jsonList.map((json) => Category.fromJson(json)).toList();

      // Save categories to Hive
      final Map<int, Category> categoryMap = {};
      for (Category category in categories) {
        categoryMap[category.idGroup] = category;
      }

      await HiveService.categoriesBox.putAll(categoryMap);
      print('Loaded ${categories.length} categories');
    } catch (e) {
      print('Error loading categories: $e');
    }
  }

  static void reset() {
    _isInitialized = false;
  }
}

import 'package:hive_flutter/hive_flutter.dart';
import '../models/word.dart';
import '../models/category.dart';
import '../models/user_profile.dart';

class HiveService {
  // Box names
  static const String wordsBoxName = 'words';
  static const String categoriesBoxName = 'categories';
  static const String userProfileBoxName = 'userProfile';

  // Boxes
  static late Box<Word> _wordsBox;
  static late Box<Category> _categoriesBox;
  static late Box<UserProfile> _userProfileBox;

  static Future<void> init() async {
    // Register adapters
    if (!Hive.isAdapterRegistered(0)) {
      Hive.registerAdapter(WordTranslationsAdapter());
    }
    if (!Hive.isAdapterRegistered(1)) {
      Hive.registerAdapter(WordMeaningsAdapter());
    }
    if (!Hive.isAdapterRegistered(2)) {
      Hive.registerAdapter(WordAdapter());
    }
    if (!Hive.isAdapterRegistered(3)) {
      Hive.registerAdapter(CategoryTranslationsAdapter());
    }
    if (!Hive.isAdapterRegistered(4)) {
      Hive.registerAdapter(CategoryMeaningsAdapter());
    }
    if (!Hive.isAdapterRegistered(5)) {
      Hive.registerAdapter(CategoryAdapter());
    }
    if (!Hive.isAdapterRegistered(6)) {
      Hive.registerAdapter(UserProfileAdapter());
    }

    // Open boxes
    _wordsBox = await Hive.openBox<Word>(wordsBoxName);
    _categoriesBox = await Hive.openBox<Category>(categoriesBoxName);
    _userProfileBox = await Hive.openBox<UserProfile>(userProfileBoxName);
  }

  // Getters for boxes
  static Box<Word> get wordsBox => _wordsBox;
  static Box<Category> get categoriesBox => _categoriesBox;
  static Box<UserProfile> get userProfileBox => _userProfileBox;

  static Future<void> close() async {
    await _wordsBox.close();
    await _categoriesBox.close();
    await _userProfileBox.close();
  }

  static Future<void> clear() async {
    await _wordsBox.clear();
    await _categoriesBox.clear();
    await _userProfileBox.clear();
  }
}

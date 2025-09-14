import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../models/category.dart';
import '../services/hive_service.dart';

part 'categories_repository.g.dart';

@riverpod
CategoriesRepository categoriesRepository(CategoriesRepositoryRef ref) {
  return CategoriesRepository();
}

class CategoriesRepository {
  List<Category> getAllCategories() {
    return HiveService.categoriesBox.values.toList();
  }

  Category? getCategoryByIdGroup(int idGroup) {
    return HiveService.categoriesBox.values
        .where((category) => category.idGroup == idGroup)
        .firstOrNull;
  }

  Category? findCategoryByPartialIdGroup(String partialIdGroup) {
    final partialInt = int.tryParse(partialIdGroup);
    if (partialInt == null) return null;
    
    return HiveService.categoriesBox.values
        .where((category) => category.idGroup.toString().startsWith(partialIdGroup))
        .firstOrNull;
  }

  String getCategoryHint(String group, String language) {
    // Try to find a category by removing digits from the right
    String searchGroup = group;

    while (searchGroup.isNotEmpty) {
      final groupInt = int.tryParse(searchGroup);
      if (groupInt != null) {
        final category = getCategoryByIdGroup(groupInt);
        if (category != null) {
          return category.getCategoryByLanguage(language);
        }
      }
      // Remove the last character
      searchGroup = searchGroup.substring(0, searchGroup.length - 1);
    }

    return 'Unknown Category';
  }

  Future<void> addCategory(Category category) async {
    await HiveService.categoriesBox.put(category.idGroup, category);
  }

  Future<void> addCategories(List<Category> categories) async {
    final Map<int, Category> categoryMap = {};
    for (Category category in categories) {
      categoryMap[category.idGroup] = category;
    }
    await HiveService.categoriesBox.putAll(categoryMap);
  }

  Future<void> deleteCategory(int idGroup) async {
    await HiveService.categoriesBox.delete(idGroup);
  }

  Future<void> clear() async {
    await HiveService.categoriesBox.clear();
  }

  int getCategoryCount() {
    return HiveService.categoriesBox.length;
  }
}

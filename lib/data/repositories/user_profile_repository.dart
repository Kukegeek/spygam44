import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../models/user_profile.dart';
import '../services/hive_service.dart';

part 'user_profile_repository.g.dart';

@riverpod
UserProfileRepository userProfileRepository(UserProfileRepositoryRef ref) {
  return UserProfileRepository();
}

class UserProfileRepository {
  UserProfile? getCurrentUserProfile() {
    if (HiveService.userProfileBox.isEmpty) {
      return null;
    }
    return HiveService.userProfileBox.values.first;
  }

  UserProfile? getUserProfileById(String userId) {
    return HiveService.userProfileBox.values
        .where((profile) => profile.userId == userId)
        .firstOrNull;
  }

  UserProfile? getUserProfileByEmail(String email) {
    return HiveService.userProfileBox.values
        .where((profile) => profile.email.toLowerCase() == email.toLowerCase())
        .firstOrNull;
  }

  Future<void> saveUserProfile(UserProfile profile) async {
    await HiveService.userProfileBox.put(profile.userId, profile);
  }

  Future<void> updateUserProfile(UserProfile profile) async {
    await HiveService.userProfileBox.put(profile.userId, profile);
  }

  Future<void> updateScore(
      String userId, String language, String level, int points) async {
    final profile = getUserProfileById(userId);
    if (profile != null) {
      final updatedProfile = profile.updateScore(language, level, points);
      await updateUserProfile(updatedProfile);
    }
  }

  Future<void> updateLanguages(
      String userId, String nativeLanguage, String learningLanguage) async {
    final profile = getUserProfileById(userId);
    if (profile != null) {
      final updatedProfile = profile.copyWith(
        nativeLanguage: nativeLanguage,
        learningLanguage: learningLanguage,
        lastUpdated: DateTime.now().millisecondsSinceEpoch,
      );
      await updateUserProfile(updatedProfile);
    }
  }

  Future<void> deleteUserProfile(String userId) async {
    await HiveService.userProfileBox.delete(userId);
  }

  Future<void> clear() async {
    await HiveService.userProfileBox.clear();
  }

  bool hasUserProfile() {
    return HiveService.userProfileBox.isNotEmpty;
  }

  int getUserCount() {
    return HiveService.userProfileBox.length;
  }

  List<UserProfile> getAllUserProfiles() {
    return HiveService.userProfileBox.values.toList();
  }
}

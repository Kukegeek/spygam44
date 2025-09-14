import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'user_profile_fixed.freezed.dart';
part 'user_profile_fixed.g.dart';

@freezed
@HiveType(typeId: 6)
class UserProfile with _$UserProfile {
  const UserProfile._();

  const factory UserProfile({
    @HiveField(0) required String userId,
    @HiveField(1) required String email,
    @HiveField(2) required String nativeLanguage,
    @HiveField(3) required String learningLanguage,
    @HiveField(4) required Map<String, Map<String, int>> scores,
    @HiveField(5) required int lastUpdated,
  }) = _UserProfile;

  factory UserProfile.fromJson(Map<String, dynamic> json) =>
      _$UserProfileFromJson(json);

  factory UserProfile.initial(String userId, String email) {
    return UserProfile(
      userId: userId,
      email: email,
      nativeLanguage: 'en',
      learningLanguage: 'es',
      scores: {
        'es': {'a1': 0, 'a2': 0, 'b1': 0, 'b2': 0, 'c1': 0, 'c2': 0},
        'en': {'a1': 0, 'a2': 0, 'b1': 0, 'b2': 0, 'c1': 0, 'c2': 0},
        'it': {'a1': 0, 'a2': 0, 'b1': 0, 'b2': 0, 'c1': 0, 'c2': 0},
        'fr': {'a1': 0, 'a2': 0, 'b1': 0, 'b2': 0, 'c1': 0, 'c2': 0},
        'de': {'a1': 0, 'a2': 0, 'b1': 0, 'b2': 0, 'c1': 0, 'c2': 0},
        'pt': {'a1': 0, 'a2': 0, 'b1': 0, 'b2': 0, 'c1': 0, 'c2': 0},
      },
      lastUpdated: DateTime.now().millisecondsSinceEpoch,
    );
  }

  int getScoreForLanguageAndLevel(String language, String level) {
    return scores[language]?[level] ?? 0;
  }

  int getTotalScoreForLanguage(String language) {
    final languageScores = scores[language];
    if (languageScores == null) return 0;
    return languageScores.values.fold(0, (sum, score) => sum + score);
  }

  int getTotalScore() {
    return scores.values.fold(0, (sum, languageScores) {
      return sum +
          languageScores.values.fold(0, (langSum, score) => langSum + score);
    });
  }

  bool isLevelUnlocked(String language, String level) {
    final languageScores = scores[language];
    if (languageScores == null) return false;

    const levelOrder = ['a1', 'a2', 'b1', 'b2', 'c1', 'c2'];
    final currentLevelIndex = levelOrder.indexOf(level.toLowerCase());

    if (currentLevelIndex <= 0) return true; // a1 is always unlocked

    // Check if previous level has at least 10 points
    final previousLevel = levelOrder[currentLevelIndex - 1];
    return (languageScores[previousLevel] ?? 0) >= 10;
  }

  int getRequiredPointsForNextLevel(String language, String level) {
    if (isLevelUnlocked(language, level)) return 0;

    const levelOrder = ['a1', 'a2', 'b1', 'b2', 'c1', 'c2'];
    final currentLevelIndex = levelOrder.indexOf(level.toLowerCase());

    if (currentLevelIndex <= 0) return 0;

    final previousLevel = levelOrder[currentLevelIndex - 1];
    final currentPoints = scores[language]?[previousLevel] ?? 0;
    return 10 - currentPoints;
  }

  Map<String, int> getLanguageRanking() {
    final ranking = <String, int>{};
    for (final language in scores.keys) {
      ranking[language] = getTotalScoreForLanguage(language);
    }
    return Map.fromEntries(
        ranking.entries.toList()..sort((a, b) => b.value.compareTo(a.value)));
  }

  String getCurrentLevelForLanguage(String language) {
    const levelOrder = ['a1', 'a2', 'b1', 'b2', 'c1', 'c2'];
    final languageScores = scores[language];
    if (languageScores == null) return 'a1';

    String currentLevel = 'a1';
    for (final level in levelOrder) {
      if ((languageScores[level] ?? 0) > 0) {
        currentLevel = level;
      }
    }
    return currentLevel;
  }

  double getProgressForLanguageAndLevel(String language, String level) {
    final currentScore = getScoreForLanguageAndLevel(language, level);
    const maxScore = 100; // Assuming 100 is the max score per level
    return (currentScore / maxScore).clamp(0.0, 1.0);
  }
}

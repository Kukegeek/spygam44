import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

part 'user_profile.freezed.dart';
part 'user_profile.g.dart';

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
}

extension UserProfileExtensions on UserProfile {
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

    switch (level.toLowerCase()) {
      case 'a1':
        return true; // A1 is always unlocked
      case 'a2':
        return languageScores['a1']! >= 20000;
      case 'b1':
        return languageScores['a2']! >= 50000;
      case 'b2':
        return languageScores['b1']! >= 100000;
      case 'c1':
        return languageScores['b2']! >= 200000;
      case 'c2':
        return languageScores['c1']! >= 500000;
      default:
        return false;
    }
  }

  String getHighestUnlockedLevel(String language) {
    const levels = ['a1', 'a2', 'b1', 'b2', 'c1', 'c2'];
    String highestLevel = 'a1';

    for (String level in levels) {
      if (isLevelUnlocked(language, level)) {
        highestLevel = level;
      } else {
        break;
      }
    }

    return highestLevel;
  }

  UserProfile updateScore(String language, String level, int points) {
    final updatedScores = Map<String, Map<String, int>>.from(scores);
    updatedScores[language] =
        Map<String, int>.from(updatedScores[language] ?? {});
    updatedScores[language]![level] =
        (updatedScores[language]![level] ?? 0) + points;

    return copyWith(
      scores: updatedScores,
      lastUpdated: DateTime.now().millisecondsSinceEpoch,
    );
  }
}

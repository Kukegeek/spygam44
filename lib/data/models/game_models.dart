import 'package:freezed_annotation/freezed_annotation.dart';
import '../models/word.dart';

part 'game_models.freezed.dart';

enum GameMode {
  apprentice,
  quickRounds,
  vsFriends,
}

enum GameStatus {
  initial,
  playing,
  success,
  gameOver,
  wordNotValid,
}

enum Temperature {
  veryCold,
  cold,
  warm,
  hot,
  burning,
}

@freezed
class Failure with _$Failure {
  const factory Failure({
    required String word,
    required String level,
    required double temperature,
    required String temperatureClue,
    required bool isHintUsed,
    String? hintText,
  }) = _Failure;
}

@freezed
class GameState with _$GameState {
  const factory GameState({
    @Default(GameStatus.initial) GameStatus status,
    @Default(GameMode.apprentice) GameMode mode,
    Word? currentWord,
    @Default(0) int points,
    @Default(0) int possiblePoints,
    @Default(10) int attemptsLeft,
    @Default(30) int timeLeft,
    @Default([]) List<Failure> failures,
    @Default(false) bool isFortuneWheelAvailable,
    @Default(false) bool hasUsedHint,
    String? currentGuess,
    String? errorMessage,
    String? successMessage,
    @Default(false) bool isTimerActive,
    @Default(0) int streak,
    @Default(0) int fortuneWheelSpins,
    @Default(3) int lives,
  }) = _GameState;
}

@freezed
class HangmanState with _$HangmanState {
  const factory HangmanState({
    required String word,
    @Default([]) List<String> guessedLetters,
    @Default([]) List<String> correctLetters,
    @Default([]) List<String> incorrectLetters,
    @Default(0) int incorrectGuesses,
    @Default(6) int maxIncorrectGuesses,
    @Default(false) bool isGameWon,
    @Default(false) bool isGameLost,
  }) = _HangmanState;

  const HangmanState._();

  bool get isGameOver => isGameWon || isGameLost;

  String get displayWord {
    return word
        .split('')
        .map((letter) =>
            correctLetters.contains(letter.toLowerCase()) ? letter : '_')
        .join(' ');
  }

  List<String> get availableLetters {
    const alphabet = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
    return alphabet
        .split('')
        .where((letter) => !guessedLetters.contains(letter.toLowerCase()))
        .toList();
  }
}

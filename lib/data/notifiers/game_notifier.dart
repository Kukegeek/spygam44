import 'dart:async';
import 'dart:math' as math;
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../models/game_models.dart';
import '../models/word.dart';
import '../models/user_profile.dart';
import '../repositories/words_repository.dart';
import '../repositories/categories_repository.dart';
import '../repositories/user_profile_repository.dart';
import 'auth_notifier.dart';

part 'game_notifier.g.dart';

@riverpod
class GameNotifier extends _$GameNotifier {
  Timer? _timer;

  @override
  GameState build() {
    return const GameState();
  }

  WordsRepository get _wordsRepository => ref.read(wordsRepositoryProvider);
  CategoriesRepository get _categoriesRepository =>
      ref.read(categoriesRepositoryProvider);
  UserProfileRepository get _userProfileRepository =>
      ref.read(userProfileRepositoryProvider);

  UserProfile? get _currentUser {
    final authState = ref.read(authNotifierProvider);
    return switch (authState) {
      AuthStateAuthenticated(user: final user) => user,
      AuthStateGuest(user: final user) => user,
      _ => null,
    };
  }

  void startGame({GameMode mode = GameMode.apprentice}) {
    final user = _currentUser;
    if (user == null) return;

    final words = _wordsRepository.getWordsByLanguageAndLevel(
      user.learningLanguage,
      _getCurrentLevel(user),
    );

    if (words.isEmpty) return;

    final random = math.Random();
    final selectedWord = words[random.nextInt(words.length)];
    final basePoints = _calculateBasePoints(_getCurrentLevel(user));

    state = state.copyWith(
      status: GameStatus.playing,
      mode: mode,
      currentWord: selectedWord,
      possiblePoints: basePoints,
      attemptsLeft: 10,
      timeLeft: mode == GameMode.quickRounds ? 30 : 0,
      failures: [],
      isFortuneWheelAvailable: false,
      hasUsedHint: false,
      errorMessage: null,
      successMessage: null,
    );

    if (mode == GameMode.quickRounds) {
      _startTimer();
    }
  }

  void submitGuess(String word) {
    if (state.status != GameStatus.playing || state.currentWord == null) return;

    final trimmedWord = word.trim().toLowerCase();
    final user = _currentUser;
    if (user == null) return;

    final correctAnswer = state.currentWord!
        .getNameByLanguage(user.learningLanguage)
        .toLowerCase();

    if (trimmedWord == correctAnswer) {
      _handleCorrectGuess();
    } else {
      _handleIncorrectGuess(trimmedWord, user.learningLanguage);
    }
  }

  void _handleCorrectGuess() {
    _stopTimer();

    final user = _currentUser;
    if (user == null) return;

    // Calculate final points
    final levelMultiplier = _getLevelMultiplier(_getCurrentLevel(user));
    final failureCount = state.failures.length;
    final basePoints = _calculatePointsByFailures(failureCount);
    final finalPoints = (basePoints * levelMultiplier).round();

    // Update user profile if authenticated (not guest)
    if (ref.read(authNotifierProvider) is AuthStateAuthenticated) {
      _userProfileRepository.updateScore(
        user.userId,
        user.learningLanguage,
        _getCurrentLevel(user),
        finalPoints,
      );
    }

    state = state.copyWith(
      status: GameStatus.success,
      points: finalPoints,
      successMessage: 'Congratulations! You earned $finalPoints points!',
    );
  }

  void _handleIncorrectGuess(String guessedWord, String language) {
    // Check if word exists
    if (!_wordsRepository.wordExists(guessedWord, language)) {
      state = state.copyWith(
        status: GameStatus.wordNotValid,
        errorMessage: 'Word not valid',
      );
      return;
    }

    // Find the guessed word to get its group for temperature calculation
    final guessedWordObj =
        _wordsRepository.findWordByText(guessedWord, language);
    final temperature = _calculateTemperature(
      state.currentWord!.group.toString(),
      guessedWordObj?.group.toString() ?? '',
    );

    // Create failure card
    final failureCard = Failure(
      word: guessedWord,
      level: guessedWordObj?.level ?? 'Unknown',
      temperature: _temperatureToDouble(temperature),
      temperatureClue:
          _getTemperatureClue(guessedWordObj?.group.toString() ?? '', temperature),
      isHintUsed: false,
    );

    final newFailures = [...state.failures, failureCard];
    final attemptsLeft = state.attemptsLeft - 1;
    final newPossiblePoints = _calculatePointsByFailures(newFailures.length);

    // Check if fortune wheel should be available (after 5th failure)
    final isFortuneWheelAvailable =
        newFailures.length >= 5 && !state.hasUsedHint;

    if (attemptsLeft <= 0) {
      _stopTimer();
      state = state.copyWith(
        status: GameStatus.gameOver,
        failures: newFailures,
        attemptsLeft: 0,
        possiblePoints: 0,
        isFortuneWheelAvailable: false,
      );
    } else {
      state = state.copyWith(
        status: GameStatus.playing,
        failures: newFailures,
        attemptsLeft: attemptsLeft,
        possiblePoints: newPossiblePoints,
        isFortuneWheelAvailable: isFortuneWheelAvailable,
        errorMessage: null,
      );
    }
  }

  void useFortuneWheel() {
    if (!state.isFortuneWheelAvailable ||
        state.hasUsedHint ||
        state.currentWord == null) {
      return;
    }

    final user = _currentUser;
    if (user == null) return;

    final hints = _generateHints(state.currentWord!, user.learningLanguage);
    final random = math.Random();
    final selectedHint = hints[random.nextInt(hints.length)];

    // Add hint failure card
    final hintCard = Failure(
      word: 'Hint Used',
      level: state.currentWord!.level,
      temperature: _temperatureToDouble(Temperature.cold),
      temperatureClue: selectedHint,
      isHintUsed: true,
      hintText: selectedHint,
    );

    final newFailures = [...state.failures, hintCard];
    final attemptsLeft = state.attemptsLeft - 1;
    final newPossiblePoints = _calculatePointsByFailures(newFailures.length);

    if (attemptsLeft <= 0) {
      _stopTimer();
      state = state.copyWith(
        status: GameStatus.gameOver,
        failures: newFailures,
        attemptsLeft: 0,
        possiblePoints: 0,
        hasUsedHint: true,
        isFortuneWheelAvailable: false,
      );
    } else {
      state = state.copyWith(
        failures: newFailures,
        attemptsLeft: attemptsLeft,
        possiblePoints: newPossiblePoints,
        hasUsedHint: true,
        isFortuneWheelAvailable: false,
      );
    }
  }

  void endRound() {
    _stopTimer();
    state = state.copyWith(
      status: GameStatus.initial,
      currentWord: null,
      points: 0,
      possiblePoints: 0,
      attemptsLeft: 10,
      timeLeft: 30,
      failures: [],
      isFortuneWheelAvailable: false,
      hasUsedHint: false,
      errorMessage: null,
      successMessage: null,
    );
  }

  void clearError() {
    if (state.status == GameStatus.wordNotValid) {
      state = state.copyWith(
        status: GameStatus.playing,
        errorMessage: null,
      );
    }
  }

  void _startTimer() {
    if (state.mode != GameMode.quickRounds) return;

    state = state.copyWith(isTimerActive: true);
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (state.timeLeft <= 0) {
        timer.cancel();
        state = state.copyWith(isTimerActive: false);
        _handleTimeUp();
      } else {
        state = state.copyWith(timeLeft: state.timeLeft - 1);
      }
    });
  }

  void _stopTimer() {
    _timer?.cancel();
    state = state.copyWith(isTimerActive: false);
  }

  void _handleTimeUp() {
    // Treat time up as an incorrect guess
    final failureCard = Failure(
      word: 'Time Up',
      level: state.currentWord?.level ?? 'Unknown',
      temperature: _temperatureToDouble(Temperature.veryCold),
      temperatureClue: 'Time expired',
      isHintUsed: false,
    );

    final newFailures = [...state.failures, failureCard];
    final attemptsLeft = state.attemptsLeft - 1;

    if (attemptsLeft <= 0) {
      state = state.copyWith(
        status: GameStatus.gameOver,
        failures: newFailures,
        attemptsLeft: 0,
        timeLeft: 0,
      );
    } else {
      state = state.copyWith(
        failures: newFailures,
        attemptsLeft: attemptsLeft,
        timeLeft: 30, // Reset timer for next guess
      );
      _startTimer(); // Restart timer
    }
  }

  Temperature _calculateTemperature(String correctGroup, String guessedGroup) {
    int matchingDigits = 0;
    final minLength = math.min(correctGroup.length, guessedGroup.length);

    for (int i = 0; i < minLength; i++) {
      if (correctGroup[i] == guessedGroup[i]) {
        matchingDigits++;
      } else {
        break;
      }
    }

    return switch (matchingDigits) {
      0 => Temperature.veryCold,
      1 => Temperature.cold,
      2 => Temperature.warm,
      3 => Temperature.hot,
      >= 4 => Temperature.burning,
      _ => Temperature.veryCold,
    };
  }

  String _getTemperatureClue(String group, Temperature temperature) {
    return switch (temperature) {
      Temperature.veryCold => 'Very Cold (0 matching digits)',
      Temperature.cold => 'Cold (1 matching digit)',
      Temperature.warm => 'Warm (2 matching digits)',
      Temperature.hot => 'Hot (3 matching digits)',
      Temperature.burning => 'Burning (4+ matching digits)',
    };
  }

  double _temperatureToDouble(Temperature temperature) {
    return switch (temperature) {
      Temperature.veryCold => 0.0,
      Temperature.cold => 0.25,
      Temperature.warm => 0.5,
      Temperature.hot => 0.75,
      Temperature.burning => 1.0,
    };
  }

  List<String> _generateHints(Word word, String language) {
    final wordText = word.getNameByLanguage(language);
    final user = _currentUser;
    if (user == null) return [];

    return [
      'First letter: ${wordText.isNotEmpty ? wordText[0].toUpperCase() : ''}',
      'Last letter: ${wordText.isNotEmpty ? wordText[wordText.length - 1].toUpperCase() : ''}',
      'Number of letters: ${wordText.length}',
      'Random letter: ${_getRandomLetterHint(wordText)}',
      'Category: ${_categoriesRepository.getCategoryHint(word.group.toString(), language)}',
    ];
  }

  String _getRandomLetterHint(String word) {
    if (word.isEmpty) return '';
    final random = math.Random();
    final index = random.nextInt(word.length);
    return 'Letter ${index + 1}: ${word[index].toUpperCase()}';
  }

  String _getCurrentLevel(UserProfile user) {
    return user.getHighestUnlockedLevel(user.learningLanguage);
  }

  int _calculateBasePoints(String level) {
    return switch (level.toLowerCase()) {
      'a1' => 1000,
      'a2' => 1000,
      'b1' => 1000,
      'b2' => 1000,
      'c1' => 1000,
      'c2' => 1000,
      _ => 1000,
    };
  }

  double _getLevelMultiplier(String level) {
    return switch (level.toLowerCase()) {
      'a1' => 1.0,
      'a2' => 1.5,
      'b1' => 2.0,
      'b2' => 3.0,
      'c1' => 5.0,
      'c2' => 10.0,
      _ => 1.0,
    };
  }

  int _calculatePointsByFailures(int failureCount) {
    return switch (failureCount) {
      0 => 1000,
      1 => 800,
      2 => 650,
      3 => 500,
      4 => 400,
      5 => 250,
      6 => 200,
      7 => 150,
      8 => 100,
      9 => 50,
      >= 10 => 0,
      _ => 0,
    };
  }

  void cleanupTimer() {
    _stopTimer();
  }
}

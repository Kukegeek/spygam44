import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../models/game_models.dart';
import '../models/user_profile.dart';
import '../repositories/user_profile_repository.dart';
import 'auth_notifier.dart';

part 'hangman_notifier.g.dart';

@riverpod
class HangmanNotifier extends _$HangmanNotifier {
  @override
  HangmanState build() {
    return const HangmanState(
      word: '',
      guessedLetters: [],
      correctLetters: [],
      incorrectLetters: [],
      incorrectGuesses: 0,
      maxIncorrectGuesses: 6,
      isGameWon: false,
      isGameLost: false,
    );
  }

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

  void startHangmanGame(String word) {
    state = HangmanState(
      word: word.toLowerCase(),
      guessedLetters: [],
      correctLetters: [],
      incorrectLetters: [],
      incorrectGuesses: 0,
      maxIncorrectGuesses: 6,
      isGameWon: false,
      isGameLost: false,
    );
  }

  void guessLetter(String letter) {
    final lowerLetter = letter.toLowerCase();

    if (state.guessedLetters.contains(lowerLetter) || state.isGameOver) {
      return;
    }

    final newGuessedLetters = [...state.guessedLetters, lowerLetter];

    if (state.word.contains(lowerLetter)) {
      // Correct guess
      final newCorrectLetters = [...state.correctLetters, lowerLetter];

      // Check if game is won (all letters guessed)
      final isGameWon = state.word.split('').every((char) =>
          newCorrectLetters.contains(char) ||
          !RegExp(r'[a-zA-Z]').hasMatch(char));

      state = state.copyWith(
        guessedLetters: newGuessedLetters,
        correctLetters: newCorrectLetters,
        isGameWon: isGameWon,
      );

      if (isGameWon) {
        _handleGameWon();
      }
    } else {
      // Incorrect guess
      final newIncorrectLetters = [...state.incorrectLetters, lowerLetter];
      final newIncorrectGuesses = state.incorrectGuesses + 1;
      final isGameLost = newIncorrectGuesses >= state.maxIncorrectGuesses;

      state = state.copyWith(
        guessedLetters: newGuessedLetters,
        incorrectLetters: newIncorrectLetters,
        incorrectGuesses: newIncorrectGuesses,
        isGameLost: isGameLost,
      );

      if (isGameLost) {
        _handleGameLost();
      }
    }
  }

  void _handleGameWon() {
    final user = _currentUser;
    if (user == null) return;

    // Award 100 base points multiplied by level multiplier
    final levelMultiplier = _getLevelMultiplier(_getCurrentLevel(user));
    final points = (100 * levelMultiplier).round();

    // Update user profile if authenticated (not guest)
    if (ref.read(authNotifierProvider) is AuthStateAuthenticated) {
      _userProfileRepository.updateScore(
        user.userId,
        user.learningLanguage,
        _getCurrentLevel(user),
        points,
      );
    }
  }

  void _handleGameLost() {
    // No points awarded for losing hangman
  }

  void resetGame() {
    state = const HangmanState(
      word: '',
      guessedLetters: [],
      correctLetters: [],
      incorrectLetters: [],
      incorrectGuesses: 0,
      maxIncorrectGuesses: 6,
      isGameWon: false,
      isGameLost: false,
    );
  }

  String _getCurrentLevel(UserProfile user) {
    return user.getHighestUnlockedLevel(user.learningLanguage);
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
}

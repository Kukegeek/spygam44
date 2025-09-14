// Remove the localization import since it causes errors
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../data/notifiers/game_notifier.dart';
import '../../data/notifiers/auth_notifier.dart';
import '../../data/models/game_models.dart';
import '../widgets/failure_card.dart';
import '../widgets/fortune_wheel.dart';
import '../widgets/game_hud.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  final _guessController = TextEditingController();
  final _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    final gameState = ref.watch(gameNotifierProvider);
    final authState = ref.watch(authNotifierProvider);

    // Auto-setup guest mode if no user is authenticated
    if (authState is AuthStateUnauthenticated) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        ref.read(authNotifierProvider.notifier).playAsGuest();
      });
    }

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // HUD (Heads-Up Display)
            GameHUD(gameState: gameState),
            const SizedBox(height: 16),

            // Game Mode Selection (when not playing)
            if (gameState.status == GameStatus.initial)
              _buildGameModeSelection(context),

            // Game Input (when playing)
            if (gameState.status == GameStatus.playing)
              _buildGameInput(context, gameState),

            // Game Results (success/game over)
            if (gameState.status == GameStatus.success)
              _buildSuccessMessage(context, gameState),

            if (gameState.status == GameStatus.gameOver)
              _buildGameOverOptions(context, gameState),

            // Error message
            if (gameState.status == GameStatus.wordNotValid)
              _buildErrorMessage(context, gameState),

            const SizedBox(height: 16),

            // Fortune Wheel
            if (gameState.isFortuneWheelAvailable &&
                gameState.status == GameStatus.playing)
              FortuneWheel(
                onUse: () {
                  ref.read(gameNotifierProvider.notifier).useFortuneWheel();
                },
              ),

            const SizedBox(height: 16),

            // Failures History
            Expanded(
              child: _buildFailuresHistory(context, gameState),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildGameModeSelection(BuildContext context) {
    final theme = Theme.of(context);

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              'Select Game Mode',
              style: theme.textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: () {
                      ref.read(gameNotifierProvider.notifier).startGame(
                            mode: GameMode.apprentice,
                          );
                    },
                    icon: const Icon(Icons.school),
                    label: const Text('Apprentice Mode'),
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: () {
                      ref.read(gameNotifierProvider.notifier).startGame(
                            mode: GameMode.quickRounds,
                          );
                    },
                    icon: const Icon(Icons.timer),
                    label: const Text('Quick Rounds'),
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            OutlinedButton.icon(
              onPressed: null, // Coming Soon
              icon: const Icon(Icons.people),
              label: const Text('Vs Friends (Coming Soon)'),
              style: OutlinedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildGameInput(BuildContext context, GameState gameState) {
    final theme = Theme.of(context);

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Current word meaning/hint
            if (gameState.currentWord != null) ...[
              Text(
                'Find the word that means:',
                style: theme.textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 8),
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: theme.colorScheme.primaryContainer,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  _getCurrentWordMeaning(gameState),
                  style: theme.textTheme.bodyLarge?.copyWith(
                    color: theme.colorScheme.onPrimaryContainer,
                    fontWeight: FontWeight.w500,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 16),
            ],

            // Input field
            TextField(
              controller: _guessController,
              decoration: const InputDecoration(
                labelText: 'Enter your guess',
                border: OutlineInputBorder(),
                suffixIcon: Icon(Icons.edit),
              ),
              onSubmitted: _submitGuess,
            ),
            const SizedBox(height: 12),

            // Submit button
            ElevatedButton(
              onPressed: _submitGuess,
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 16),
              ),
              child: const Text(
                'Submit',
                style: TextStyle(fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSuccessMessage(BuildContext context, GameState gameState) {
    final theme = Theme.of(context);

    return Card(
      color: theme.colorScheme.primaryContainer,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Icon(
              Icons.celebration,
              size: 48,
              color: theme.colorScheme.onPrimaryContainer,
            ),
            const SizedBox(height: 8),
            Text(
              'Congratulations!',
              style: theme.textTheme.headlineSmall?.copyWith(
                color: theme.colorScheme.onPrimaryContainer,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'You earned ${gameState.points} points!',
              style: theme.textTheme.titleMedium?.copyWith(
                color: theme.colorScheme.onPrimaryContainer,
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                ref.read(gameNotifierProvider.notifier).startGame(
                      mode: gameState.mode,
                    );
                _guessController.clear();
              },
              child: const Text('Next Round'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildGameOverOptions(BuildContext context, GameState gameState) {
    final theme = Theme.of(context);

    return Card(
      color: theme.colorScheme.errorContainer,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Icon(
              Icons.sentiment_dissatisfied,
              size: 48,
              color: theme.colorScheme.onErrorContainer,
            ),
            const SizedBox(height: 8),
            Text(
              'Game Over',
              style: theme.textTheme.headlineSmall?.copyWith(
                color: theme.colorScheme.onErrorContainer,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            if (gameState.currentWord != null) ...[
              Text(
                'The correct answer was:',
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: theme.colorScheme.onErrorContainer,
                ),
              ),
              Text(
                _getCurrentWordName(gameState),
                style: theme.textTheme.titleLarge?.copyWith(
                  color: theme.colorScheme.onErrorContainer,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
            ],
            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: () {
                      ref.read(gameNotifierProvider.notifier).endRound();
                      _guessController.clear();
                    },
                    child: const Text('End Round'),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      final word = _getCurrentWordName(gameState);
                      context.push('/hangman', extra: word);
                    },
                    child: const Text('Play Hangman'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildErrorMessage(BuildContext context, GameState gameState) {
    final theme = Theme.of(context);

    return Card(
      color: theme.colorScheme.errorContainer,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            Icon(
              Icons.error_outline,
              color: theme.colorScheme.onErrorContainer,
            ),
            const SizedBox(width: 8),
            Expanded(
              child: Text(
                gameState.errorMessage ?? 'Error',
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: theme.colorScheme.onErrorContainer,
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                ref.read(gameNotifierProvider.notifier).clearError();
              },
              child: Text(
                'OK',
                style: TextStyle(
                  color: theme.colorScheme.onErrorContainer,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFailuresHistory(BuildContext context, GameState gameState) {
    if (gameState.failures.isEmpty) {
      return const Center(
        child: Text(
          'Your guesses will appear here',
          style: TextStyle(
            fontSize: 16,
            color: Colors.grey,
          ),
        ),
      );
    }

    return ListView.builder(
      controller: _scrollController,
      itemCount: gameState.failures.length,
      itemBuilder: (context, index) {
        final failure = gameState.failures[index];
        return Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: FailureCard(failure: failure),
        );
      },
    );
  }

  void _submitGuess([String? value]) {
    final text = value ?? _guessController.text;
    if (text.trim().isEmpty) return;

    ref.read(gameNotifierProvider.notifier).submitGuess(text.trim());
    _guessController.clear();

    // Auto-scroll to bottom when new failure is added
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_scrollController.hasClients) {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });
  }

  String _getCurrentWordMeaning(GameState gameState) {
    final authState = ref.read(authNotifierProvider);
    String language = 'en';

    switch (authState) {
      case AuthStateAuthenticated(user: final user):
      case AuthStateGuest(user: final user):
        language = user.nativeLanguage;
        break;
      default:
        break;
    }

    return gameState.currentWord?.getMeaningByLanguage(language) ?? '';
  }

  String _getCurrentWordName(GameState gameState) {
    final authState = ref.read(authNotifierProvider);
    String language = 'en';

    switch (authState) {
      case AuthStateAuthenticated(user: final user):
      case AuthStateGuest(user: final user):
        language = user.learningLanguage;
        break;
      default:
        break;
    }

    return gameState.currentWord?.getNameByLanguage(language) ?? '';
  }

  @override
  void dispose() {
    _guessController.dispose();
    _scrollController.dispose();
    super.dispose();
  }
}

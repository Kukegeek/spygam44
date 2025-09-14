import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../data/notifiers/hangman_notifier.dart';
import '../../data/models/game_models.dart';

class HangmanScreen extends ConsumerStatefulWidget {
  final String word;

  const HangmanScreen({
    super.key,
    required this.word,
  });

  @override
  ConsumerState<HangmanScreen> createState() => _HangmanScreenState();
}

class _HangmanScreenState extends ConsumerState<HangmanScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(hangmanNotifierProvider.notifier).startHangmanGame(widget.word);
    });
  }

  @override
  Widget build(BuildContext context) {
    final hangmanState = ref.watch(hangmanNotifierProvider);
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Hangman Game'),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.pop(),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Hangman Drawing
            Expanded(
              flex: 2,
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: _buildHangmanDrawing(context, hangmanState),
                ),
              ),
            ),

            const SizedBox(height: 16),

            // Word Display
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Text(
                      'Guess the word:',
                      style: theme.textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      hangmanState.displayWord,
                      style: theme.textTheme.headlineMedium?.copyWith(
                        fontFamily: 'monospace',
                        fontWeight: FontWeight.bold,
                        letterSpacing: 4,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 16),

            // Game Status
            if (hangmanState.isGameOver) ...[
              Card(
                color: hangmanState.isGameWon
                    ? theme.colorScheme.primaryContainer
                    : theme.colorScheme.errorContainer,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      Icon(
                        hangmanState.isGameWon
                            ? Icons.celebration
                            : Icons.sentiment_dissatisfied,
                        size: 48,
                        color: hangmanState.isGameWon
                            ? theme.colorScheme.onPrimaryContainer
                            : theme.colorScheme.onErrorContainer,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        hangmanState.isGameWon
                            ? 'Congratulations! You won!'
                            : 'Game Over! Better luck next time.',
                        style: theme.textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: hangmanState.isGameWon
                              ? theme.colorScheme.onPrimaryContainer
                              : theme.colorScheme.onErrorContainer,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      if (!hangmanState.isGameWon) ...[
                        const SizedBox(height: 4),
                        Text(
                          'The word was: ${widget.word.toUpperCase()}',
                          style: theme.textTheme.bodyMedium?.copyWith(
                            color: theme.colorScheme.onErrorContainer,
                          ),
                        ),
                      ],
                      const SizedBox(height: 16),
                      Row(
                        children: [
                          Expanded(
                            child: OutlinedButton(
                              onPressed: () => context.pop(),
                              child: const Text('Back to Game'),
                            ),
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            child: ElevatedButton(
                              onPressed: () {
                                ref
                                    .read(hangmanNotifierProvider.notifier)
                                    .startHangmanGame(widget.word);
                              },
                              child: const Text('Play Again'),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ] else ...[
              // Progress Indicator
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        children: [
                          Text(
                            'Wrong Guesses',
                            style: theme.textTheme.labelMedium,
                          ),
                          Text(
                            '${hangmanState.incorrectGuesses} / ${hangmanState.maxIncorrectGuesses}',
                            style: theme.textTheme.titleMedium?.copyWith(
                              fontWeight: FontWeight.bold,
                              color: _getWrongGuessesColor(
                                hangmanState.incorrectGuesses,
                                hangmanState.maxIncorrectGuesses,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Text(
                            'Letters Remaining',
                            style: theme.textTheme.labelMedium,
                          ),
                          Text(
                            '${hangmanState.availableLetters.length}',
                            style: theme.textTheme.titleMedium?.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],

            const SizedBox(height: 16),

            // Letter Grid (only show if game is not over)
            if (!hangmanState.isGameOver)
              Expanded(
                flex: 3,
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          'Select a letter:',
                          style: theme.textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.w600,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 16),
                        Expanded(
                          child: _buildLetterGrid(context, hangmanState),
                        ),
                      ],
                    ),
                  ),
                ),
              ),

            // Used Letters Display
            if (hangmanState.guessedLetters.isNotEmpty &&
                !hangmanState.isGameOver)
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      Text(
                        'Used Letters:',
                        style: theme.textTheme.labelMedium,
                      ),
                      const SizedBox(height: 8),
                      Wrap(
                        spacing: 4,
                        children: hangmanState.guessedLetters.map((letter) {
                          final isCorrect =
                              hangmanState.correctLetters.contains(letter);
                          return Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 4,
                            ),
                            decoration: BoxDecoration(
                              color: isCorrect
                                  ? Colors.green.withOpacity(0.2)
                                  : Colors.red.withOpacity(0.2),
                              borderRadius: BorderRadius.circular(4),
                              border: Border.all(
                                color: isCorrect ? Colors.green : Colors.red,
                              ),
                            ),
                            child: Text(
                              letter.toUpperCase(),
                              style: theme.textTheme.labelMedium?.copyWith(
                                color: isCorrect ? Colors.green : Colors.red,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                    ],
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildHangmanDrawing(BuildContext context, HangmanState state) {
    return CustomPaint(
      size: const Size(200, 200),
      painter: HangmanPainter(incorrectGuesses: state.incorrectGuesses),
    );
  }

  Widget _buildLetterGrid(BuildContext context, HangmanState state) {
    const alphabet = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
    final letters = alphabet.split('');

    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 6,
        childAspectRatio: 1,
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
      ),
      itemCount: letters.length,
      itemBuilder: (context, index) {
        final letter = letters[index];
        final isUsed = state.guessedLetters.contains(letter.toLowerCase());
        final isCorrect = state.correctLetters.contains(letter.toLowerCase());
        final isIncorrect =
            state.incorrectLetters.contains(letter.toLowerCase());

        return ElevatedButton(
          onPressed: isUsed
              ? null
              : () {
                  ref
                      .read(hangmanNotifierProvider.notifier)
                      .guessLetter(letter.toLowerCase());
                },
          style: ElevatedButton.styleFrom(
            backgroundColor: isCorrect
                ? Colors.green
                : isIncorrect
                    ? Colors.red
                    : null,
            foregroundColor: isUsed ? Colors.white : null,
            padding: EdgeInsets.zero,
          ),
          child: Text(
            letter,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        );
      },
    );
  }

  Color _getWrongGuessesColor(int current, int max) {
    final ratio = current / max;
    if (ratio <= 0.3) return Colors.green;
    if (ratio <= 0.6) return Colors.orange;
    return Colors.red;
  }
}

class HangmanPainter extends CustomPainter {
  final int incorrectGuesses;

  HangmanPainter({required this.incorrectGuesses});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.brown
      ..strokeWidth = 4
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    final center = Offset(size.width / 2, size.height / 2);
    final scale = size.width / 200;

    // Draw gallows base
    if (incorrectGuesses >= 1) {
      canvas.drawLine(
        Offset(center.dx - 60 * scale, size.height - 20 * scale),
        Offset(center.dx + 20 * scale, size.height - 20 * scale),
        paint,
      );
    }

    // Draw gallows pole
    if (incorrectGuesses >= 2) {
      canvas.drawLine(
        Offset(center.dx - 40 * scale, size.height - 20 * scale),
        Offset(center.dx - 40 * scale, 20 * scale),
        paint,
      );
    }

    // Draw gallows top beam
    if (incorrectGuesses >= 3) {
      canvas.drawLine(
        Offset(center.dx - 40 * scale, 20 * scale),
        Offset(center.dx + 20 * scale, 20 * scale),
        paint,
      );
    }

    // Draw noose
    if (incorrectGuesses >= 4) {
      canvas.drawLine(
        Offset(center.dx + 20 * scale, 20 * scale),
        Offset(center.dx + 20 * scale, 40 * scale),
        paint,
      );
    }

    // Draw person parts
    paint.color = Colors.black;

    // Head
    if (incorrectGuesses >= 5) {
      canvas.drawCircle(
        Offset(center.dx + 20 * scale, 55 * scale),
        15 * scale,
        paint,
      );
    }

    // Body
    if (incorrectGuesses >= 6) {
      canvas.drawLine(
        Offset(center.dx + 20 * scale, 70 * scale),
        Offset(center.dx + 20 * scale, 130 * scale),
        paint,
      );
    }

    // Left arm
    if (incorrectGuesses >= 7) {
      canvas.drawLine(
        Offset(center.dx + 20 * scale, 90 * scale),
        Offset(center.dx - 5 * scale, 110 * scale),
        paint,
      );
    }

    // Right arm
    if (incorrectGuesses >= 8) {
      canvas.drawLine(
        Offset(center.dx + 20 * scale, 90 * scale),
        Offset(center.dx + 45 * scale, 110 * scale),
        paint,
      );
    }

    // Left leg
    if (incorrectGuesses >= 9) {
      canvas.drawLine(
        Offset(center.dx + 20 * scale, 130 * scale),
        Offset(center.dx - 5 * scale, 160 * scale),
        paint,
      );
    }

    // Right leg
    if (incorrectGuesses >= 10) {
      canvas.drawLine(
        Offset(center.dx + 20 * scale, 130 * scale),
        Offset(center.dx + 45 * scale, 160 * scale),
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}

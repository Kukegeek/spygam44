import 'package:flutter/material.dart';

import '../../data/models/game_models.dart';

class GameHUD extends StatelessWidget {
  final GameState gameState;

  const GameHUD({
    super.key,
    required this.gameState,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Mode and Status
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  _getModeText(),
                  style: theme.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: _getStatusColor(theme),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Text(
                    _getStatusText(),
                    style: theme.textTheme.labelMedium?.copyWith(
                      color: _getStatusTextColor(theme),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),

            // Stats Row
            Row(
              children: [
                Expanded(
                  child: _buildStatItem(
                    context,
                    icon: Icons.emoji_events,
                    label: 'Points',
                    value: '${gameState.points}',
                    color: Colors.amber,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: _buildStatItem(
                    context,
                    icon: Icons.whatshot,
                    label: 'Streak',
                    value: '${gameState.streak}',
                    color: Colors.orange,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: _buildStatItem(
                    context,
                    icon: Icons.casino,
                    label: 'Fortune',
                    value: '${gameState.fortuneWheelSpins}',
                    color: Colors.purple,
                  ),
                ),
              ],
            ),

            // Lives indicator (for quick rounds mode)
            if (gameState.mode == GameMode.quickRounds) ...[
              const SizedBox(height: 12),
              _buildLivesIndicator(context),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildStatItem(
    BuildContext context, {
    required IconData icon,
    required String label,
    required String value,
    required Color color,
  }) {
    final theme = Theme.of(context);

    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: color.withOpacity(0.3),
        ),
      ),
      child: Column(
        children: [
          Icon(
            icon,
            color: color,
            size: 24,
          ),
          const SizedBox(height: 4),
          Text(
            value,
            style: theme.textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.bold,
              color: color,
            ),
          ),
          Text(
            label,
            style: theme.textTheme.labelSmall?.copyWith(
              color: theme.colorScheme.onSurfaceVariant,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLivesIndicator(BuildContext context) {
    final theme = Theme.of(context);

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Lives: ',
          style: theme.textTheme.titleSmall?.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
        Row(
          children: List.generate(3, (index) {
            final isActive = index < gameState.lives;
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 2),
              child: Icon(
                isActive ? Icons.favorite : Icons.favorite_border,
                color: isActive ? Colors.red : Colors.grey,
                size: 20,
              ),
            );
          }),
        ),
      ],
    );
  }

  String _getModeText() {
    switch (gameState.mode) {
      case GameMode.apprentice:
        return 'Apprentice Mode';
      case GameMode.quickRounds:
        return 'Quick Rounds';
      case GameMode.vsFriends:
        return 'Vs Friends';
    }
  }

  String _getStatusText() {
    switch (gameState.status) {
      case GameStatus.initial:
        return 'Ready';
      case GameStatus.playing:
        return 'Playing';
      case GameStatus.success:
        return 'Success!';
      case GameStatus.gameOver:
        return 'Game Over';
      case GameStatus.wordNotValid:
        return 'Invalid';
    }
  }

  Color _getStatusColor(ThemeData theme) {
    switch (gameState.status) {
      case GameStatus.initial:
        return theme.colorScheme.primaryContainer;
      case GameStatus.playing:
        return Colors.blue.withOpacity(0.2);
      case GameStatus.success:
        return Colors.green.withOpacity(0.2);
      case GameStatus.gameOver:
        return Colors.red.withOpacity(0.2);
      case GameStatus.wordNotValid:
        return Colors.orange.withOpacity(0.2);
    }
  }

  Color _getStatusTextColor(ThemeData theme) {
    switch (gameState.status) {
      case GameStatus.initial:
        return theme.colorScheme.onPrimaryContainer;
      case GameStatus.playing:
        return Colors.blue;
      case GameStatus.success:
        return Colors.green;
      case GameStatus.gameOver:
        return Colors.red;
      case GameStatus.wordNotValid:
        return Colors.orange;
    }
  }
}

import 'package:flutter/material.dart';

import '../../data/models/game_models.dart';

class FailureCard extends StatelessWidget {
  final Failure failure;

  const FailureCard({
    super.key,
    required this.failure,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(
                  Icons.close_rounded,
                  color: theme.colorScheme.error,
                  size: 20,
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    'Guess: ${failure.word}',
                    style: theme.textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                      color: theme.colorScheme.onSurface,
                    ),
                  ),
                ),
                if (failure.isHintUsed) ...[
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: theme.colorScheme.primaryContainer,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      'Hint Used',
                      style: theme.textTheme.labelSmall?.copyWith(
                        color: theme.colorScheme.onPrimaryContainer,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ],
            ),
            const SizedBox(height: 8),

            // Temperature indicator
            Row(
              children: [
                Text(
                  'Temperature: ',
                  style: theme.textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Expanded(
                  child: _buildTemperatureBar(context, failure.temperature),
                ),
                Text(
                  '${(failure.temperature * 100).toInt()}%',
                  style: theme.textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                    color: _getTemperatureColor(failure.temperature),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),

            // Temperature clue
            Container(
              padding: const EdgeInsets.all(8),
              width: double.infinity,
              decoration: BoxDecoration(
                color:
                    _getTemperatureColor(failure.temperature).withOpacity(0.1),
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: _getTemperatureColor(failure.temperature)
                      .withOpacity(0.3),
                ),
              ),
              child: Text(
                failure.temperatureClue,
                style: theme.textTheme.bodySmall?.copyWith(
                  color: _getTemperatureColor(failure.temperature),
                  fontWeight: FontWeight.w500,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTemperatureBar(BuildContext context, double temperature) {
    final theme = Theme.of(context);

    return Container(
      height: 8,
      margin: const EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        color: theme.colorScheme.surfaceVariant,
      ),
      child: FractionallySizedBox(
        alignment: Alignment.centerLeft,
        widthFactor: temperature,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            color: _getTemperatureColor(temperature),
          ),
        ),
      ),
    );
  }

  Color _getTemperatureColor(double temperature) {
    if (temperature <= 0.2) {
      return Colors.blue; // Cold
    } else if (temperature <= 0.4) {
      return Colors.cyan; // Cool
    } else if (temperature <= 0.6) {
      return Colors.orange; // Warm
    } else if (temperature <= 0.8) {
      return Colors.deepOrange; // Hot
    } else {
      return Colors.red; // Very Hot
    }
  }
}

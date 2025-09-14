import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/notifiers/auth_notifier.dart';
import '../../data/models/user_profile.dart';
import '../../l10n/app_localizations.dart';

class PersistentHeader extends ConsumerWidget {
  const PersistentHeader({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authNotifierProvider);
    final l10n = AppLocalizations.of(context)!;
    final theme = Theme.of(context);

    UserProfile user;
    switch (authState) {
      case AuthStateAuthenticated(user: final u):
      case AuthStateGuest(user: final u):
        user = u;
        break;
      default:
        return const SizedBox.shrink();
    }

    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: theme.colorScheme.primaryContainer,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: SafeArea(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // User info
            Expanded(
              flex: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    user.email.split('@').first,
                    style: theme.textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: theme.colorScheme.onPrimaryContainer,
                    ),
                  ),
                  Text(
                    '${_getLanguageName(user.nativeLanguage, l10n)} → ${_getLanguageName(user.learningLanguage, l10n)}',
                    style: theme.textTheme.bodySmall?.copyWith(
                      color:
                          theme.colorScheme.onPrimaryContainer.withOpacity(0.8),
                    ),
                  ),
                ],
              ),
            ),
            // Stats
            Expanded(
              flex: 3,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildStatColumn(
                    context,
                    l10n.totalPoints,
                    user
                        .getTotalScoreForLanguage(user.learningLanguage)
                        .toString(),
                    Icons.stars,
                    theme.colorScheme.primary,
                  ),
                  _buildStatColumn(
                    context,
                    l10n.level,
                    user
                        .getHighestUnlockedLevel(user.learningLanguage)
                        .toUpperCase(),
                    Icons.trending_up,
                    theme.colorScheme.secondary,
                  ),
                  _buildStatColumn(
                    context,
                    'Current',
                    _getLevelDisplay(
                        user.getHighestUnlockedLevel(user.learningLanguage),
                        l10n),
                    Icons.school,
                    theme.colorScheme.tertiary,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatColumn(
    BuildContext context,
    String label,
    String value,
    IconData icon,
    Color color,
  ) {
    final theme = Theme.of(context);

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          icon,
          size: 20,
          color: color,
        ),
        const SizedBox(height: 4),
        Text(
          value,
          style: theme.textTheme.titleSmall?.copyWith(
            fontWeight: FontWeight.bold,
            color: theme.colorScheme.onPrimaryContainer,
          ),
        ),
        Text(
          label,
          style: theme.textTheme.labelSmall?.copyWith(
            color: theme.colorScheme.onPrimaryContainer.withOpacity(0.7),
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  String _getLanguageName(String code, AppLocalizations l10n) {
    return switch (code.toLowerCase()) {
      'es' => l10n.spanish,
      'en' => l10n.english,
      'it' => l10n.italian,
      'fr' => l10n.french,
      'de' => l10n.german,
      'pt' => l10n.portuguese,
      _ => code.toUpperCase(),
    };
  }

  String _getLevelDisplay(String level, AppLocalizations l10n) {
    return switch (level.toLowerCase()) {
      'a1' => l10n.levelA1,
      'a2' => l10n.levelA2,
      'b1' => l10n.levelB1,
      'b2' => l10n.levelB2,
      'c1' => l10n.levelC1,
      'c2' => l10n.levelC2,
      _ => level.toUpperCase(),
    };
  }
}

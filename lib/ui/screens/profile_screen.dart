import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fl_chart/fl_chart.dart';

import '../../data/notifiers/auth_notifier.dart';
import '../../data/models/user_profile.dart';
import '../../data/repositories/user_profile_repository.dart';
import '../../l10n/app_localizations.dart';

class ProfileScreen extends ConsumerStatefulWidget {
  const ProfileScreen({super.key});

  @override
  ConsumerState<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends ConsumerState<ProfileScreen> {
  String? _selectedNativeLanguage;
  String? _selectedLearningLanguage;
  String? _selectedLevel;

  @override
  Widget build(BuildContext context) {
    final authState = ref.watch(authNotifierProvider);
    final theme = Theme.of(context);

    UserProfile? user;
    switch (authState) {
      case AuthStateAuthenticated(user: final u):
      case AuthStateGuest(user: final u):
        user = u;
        break;
      default:
        return const Scaffold(
          body: Center(child: CircularProgressIndicator()),
        );
    }

    _selectedNativeLanguage ??= user.nativeLanguage;
    _selectedLearningLanguage ??= user.learningLanguage;
    _selectedLevel ??= user.getHighestUnlockedLevel(user.learningLanguage);

    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Language Configuration Section
            _buildLanguageConfigSection(context, user),
            const SizedBox(height: 24),

            // Level Configuration Section
            _buildLevelConfigSection(context, user),
            const SizedBox(height: 24),

            // Progress Chart Section
            _buildProgressChartSection(context, user),
            const SizedBox(height: 24),

            // Rankings Section
            _buildRankingsSection(context, user),
          ],
        ),
      ),
    );
  }

  Widget _buildLanguageConfigSection(BuildContext context, UserProfile user) {
    final theme = Theme.of(context);

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Language Configuration',
              style: theme.textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),

            // Native Language Dropdown
            DropdownButtonFormField<String>(
              value: _selectedNativeLanguage,
              decoration: const InputDecoration(
                labelText: 'Native Language',
                border: OutlineInputBorder(),
              ),
              items: _getLanguageDropdownItems(),
              onChanged: (value) {
                setState(() {
                  _selectedNativeLanguage = value;
                });
                if (value != null) {
                  _updateUserLanguages(user, value, _selectedLearningLanguage!);
                }
              },
            ),
            const SizedBox(height: 16),

            // Learning Language Dropdown
            DropdownButtonFormField<String>(
              value: _selectedLearningLanguage,
              decoration: const InputDecoration(
                labelText: 'Learning Language',
                border: OutlineInputBorder(),
              ),
              items: _getLanguageDropdownItems(),
              onChanged: (value) {
                setState(() {
                  _selectedLearningLanguage = value;
                });
                if (value != null) {
                  _updateUserLanguages(user, _selectedNativeLanguage!, value);
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLevelConfigSection(BuildContext context, UserProfile user) {
    final theme = Theme.of(context);
    const levels = ['a1', 'a2', 'b1', 'b2', 'c1', 'c2'];

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Learning Level',
              style: theme.textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),

            // Level Progress Bar
            SizedBox(
              height: 60,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: levels.length,
                itemBuilder: (context, index) {
                  final level = levels[index];
                  final isUnlocked =
                      user.isLevelUnlocked(_selectedLearningLanguage!, level);
                  final isSelected = level == _selectedLevel;

                  return Container(
                    margin: const EdgeInsets.only(right: 8),
                    child: InkWell(
                      onTap: isUnlocked
                          ? () {
                              setState(() {
                                _selectedLevel = level;
                              });
                            }
                          : null,
                      borderRadius: BorderRadius.circular(8),
                      child: Container(
                        width: 60,
                        decoration: BoxDecoration(
                          color: isSelected
                              ? theme.colorScheme.primary
                              : isUnlocked
                                  ? theme.colorScheme.primaryContainer
                                  : theme.colorScheme.surfaceVariant,
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                            color: isSelected
                                ? theme.colorScheme.primary
                                : Colors.transparent,
                            width: 2,
                          ),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              level.toUpperCase(),
                              style: theme.textTheme.labelLarge?.copyWith(
                                color: isSelected
                                    ? theme.colorScheme.onPrimary
                                    : isUnlocked
                                        ? theme.colorScheme.onPrimaryContainer
                                        : theme.colorScheme.onSurfaceVariant
                                            .withOpacity(0.5),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            if (!isUnlocked)
                              Icon(
                                Icons.lock,
                                size: 12,
                                color: theme.colorScheme.onSurfaceVariant
                                    .withOpacity(0.5),
                              ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 16),

            // Level unlock requirements
            Text(
              'Unlock Requirements:',
              style: theme.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 8),
            _buildUnlockRequirements(context, user),
          ],
        ),
      ),
    );
  }

  Widget _buildUnlockRequirements(BuildContext context, UserProfile user) {
    final theme = Theme.of(context);

    final requirements = [
      (
        'A2',
        'A1: 20,000 points',
        user.getScoreForLanguageAndLevel(_selectedLearningLanguage!, 'a1')
      ),
      (
        'B1',
        'A2: 50,000 points',
        user.getScoreForLanguageAndLevel(_selectedLearningLanguage!, 'a2')
      ),
      (
        'B2',
        'B1: 100,000 points',
        user.getScoreForLanguageAndLevel(_selectedLearningLanguage!, 'b1')
      ),
      (
        'C1',
        'B2: 200,000 points',
        user.getScoreForLanguageAndLevel(_selectedLearningLanguage!, 'b2')
      ),
      (
        'C2',
        'C1: 500,000 points',
        user.getScoreForLanguageAndLevel(_selectedLearningLanguage!, 'c1')
      ),
    ];

    return Column(
      children: requirements.map((req) {
        final level = req.$1;
        final requirement = req.$2;
        final currentPoints = req.$3;
        final requiredPoints = _getRequiredPoints(level);
        final progress = requiredPoints > 0
            ? (currentPoints / requiredPoints).clamp(0.0, 1.0)
            : 1.0;
        final isUnlocked = user.isLevelUnlocked(
            _selectedLearningLanguage!, level.toLowerCase());

        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 4),
          child: Row(
            children: [
              SizedBox(
                width: 30,
                child: Text(
                  level,
                  style: theme.textTheme.labelMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: isUnlocked ? theme.colorScheme.primary : null,
                  ),
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      requirement,
                      style: theme.textTheme.bodySmall,
                    ),
                    LinearProgressIndicator(
                      value: progress,
                      backgroundColor: theme.colorScheme.surfaceVariant,
                      valueColor: AlwaysStoppedAnimation<Color>(
                        isUnlocked
                            ? theme.colorScheme.primary
                            : theme.colorScheme.secondary,
                      ),
                    ),
                  ],
                ),
              ),
              Icon(
                isUnlocked ? Icons.check_circle : Icons.lock,
                size: 20,
                color: isUnlocked
                    ? theme.colorScheme.primary
                    : theme.colorScheme.onSurfaceVariant,
              ),
            ],
          ),
        );
      }).toList(),
    );
  }

  Widget _buildProgressChartSection(BuildContext context, UserProfile user) {
    final theme = Theme.of(context);

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Current Level Progress',
              style: theme.textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),

            // Gauge Chart
            SizedBox(
              height: 200,
              child: _buildGaugeChart(context, user),
            ),

            const SizedBox(height: 16),

            // Progress details
            _buildProgressDetails(context, user),
          ],
        ),
      ),
    );
  }

  Widget _buildGaugeChart(BuildContext context, UserProfile user) {
    final currentPoints = user.getScoreForLanguageAndLevel(
        _selectedLearningLanguage!, _selectedLevel!);
    final nextLevel = _getNextLevel(_selectedLevel!);
    final requiredPoints =
        nextLevel != null ? _getRequiredPoints(nextLevel) : 500000;
    final progress = requiredPoints > 0
        ? (currentPoints / requiredPoints).clamp(0.0, 1.0)
        : 1.0;

    return PieChart(
      PieChartData(
        sections: [
          PieChartSectionData(
            value: progress * 100,
            color: Theme.of(context).colorScheme.primary,
            title: '${(progress * 100).toInt()}%',
            radius: 50,
            titleStyle: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          PieChartSectionData(
            value: (1 - progress) * 100,
            color: Theme.of(context).colorScheme.surfaceVariant,
            title: '',
            radius: 50,
          ),
        ],
        sectionsSpace: 2,
        centerSpaceRadius: 80,
        startDegreeOffset: -90,
      ),
    );
  }

  Widget _buildProgressDetails(BuildContext context, UserProfile user) {
    final theme = Theme.of(context);
    final currentPoints = user.getScoreForLanguageAndLevel(
        _selectedLearningLanguage!, _selectedLevel!);
    final nextLevel = _getNextLevel(_selectedLevel!);
    final requiredPoints =
        nextLevel != null ? _getRequiredPoints(nextLevel) : 0;
    final remainingPoints =
        requiredPoints > currentPoints ? requiredPoints - currentPoints : 0;

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Current Points:', style: theme.textTheme.bodyMedium),
            Text('$currentPoints',
                style: theme.textTheme.bodyMedium
                    ?.copyWith(fontWeight: FontWeight.bold)),
          ],
        ),
        const SizedBox(height: 4),
        if (nextLevel != null) ...[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Required for ${nextLevel.toUpperCase()}:',
                  style: theme.textTheme.bodyMedium),
              Text('$requiredPoints',
                  style: theme.textTheme.bodyMedium
                      ?.copyWith(fontWeight: FontWeight.bold)),
            ],
          ),
          const SizedBox(height: 4),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Remaining:', style: theme.textTheme.bodyMedium),
              Text('$remainingPoints',
                  style: theme.textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: theme.colorScheme.primary,
                  )),
            ],
          ),
        ],
      ],
    );
  }

  Widget _buildRankingsSection(BuildContext context, UserProfile user) {
    final theme = Theme.of(context);

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Rankings',
              style: theme.textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),

            // Coming Soon message
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: theme.colorScheme.primaryContainer,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                children: [
                  Icon(
                    Icons.construction,
                    color: theme.colorScheme.onPrimaryContainer,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    'Coming Soon',
                    style: theme.textTheme.titleMedium?.copyWith(
                      color: theme.colorScheme.onPrimaryContainer,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),

            // User's own scores summary
            Text(
              'Your Scores Summary',
              style: theme.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 8),
            _buildScoresSummary(context, user),
          ],
        ),
      ),
    );
  }

  Widget _buildScoresSummary(BuildContext context, UserProfile user) {
    final theme = Theme.of(context);
    final languages = ['es', 'en', 'it', 'fr', 'de', 'pt'];

    return Column(
      children: [
        // Per language scores
        ...languages.map((lang) {
          final totalScore = user.getTotalScoreForLanguage(lang);
          if (totalScore == 0) return const SizedBox.shrink();

          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 4),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  _getLanguageName(lang),
                  style: theme.textTheme.bodyMedium,
                ),
                Text(
                  '$totalScore pts',
                  style: theme.textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          );
        }),
        const Divider(),

        // Global total
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Grand Total',
              style: theme.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              '${user.getTotalScore()} pts',
              style: theme.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
                color: theme.colorScheme.primary,
              ),
            ),
          ],
        ),
      ],
    );
  }

  List<DropdownMenuItem<String>> _getLanguageDropdownItems() {
    return [
      const DropdownMenuItem(value: 'es', child: Text('Spanish')),
      const DropdownMenuItem(value: 'en', child: Text('English')),
      const DropdownMenuItem(value: 'it', child: Text('Italian')),
      const DropdownMenuItem(value: 'fr', child: Text('French')),
      const DropdownMenuItem(value: 'de', child: Text('German')),
      const DropdownMenuItem(value: 'pt', child: Text('Portuguese')),
    ];
  }

  String _getLanguageName(String code) {
    return switch (code.toLowerCase()) {
      'es' => 'Spanish',
      'en' => 'English',
      'it' => 'Italian',
      'fr' => 'French',
      'de' => 'German',
      'pt' => 'Portuguese',
      _ => code.toUpperCase(),
    };
  }

  String? _getNextLevel(String currentLevel) {
    const levels = ['a1', 'a2', 'b1', 'b2', 'c1', 'c2'];
    final currentIndex = levels.indexOf(currentLevel.toLowerCase());
    if (currentIndex >= 0 && currentIndex < levels.length - 1) {
      return levels[currentIndex + 1];
    }
    return null;
  }

  int _getRequiredPoints(String level) {
    return switch (level.toLowerCase()) {
      'a2' => 20000,
      'b1' => 50000,
      'b2' => 100000,
      'c1' => 200000,
      'c2' => 500000,
      _ => 0,
    };
  }

  void _updateUserLanguages(
      UserProfile user, String nativeLanguage, String learningLanguage) {
    ref.read(userProfileRepositoryProvider).updateLanguages(
          user.userId,
          nativeLanguage,
          learningLanguage,
        );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../data/notifiers/auth_notifier.dart';
import '../../data/models/user_profile.dart';

class PersistentHeader extends ConsumerWidget {
  const PersistentHeader({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authNotifierProvider);
    final theme = Theme.of(context);

    return Container(
      height: 80,
      decoration: BoxDecoration(
        color: theme.colorScheme.primary,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            offset: const Offset(0, 2),
            blurRadius: 4,
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Row(
          children: [
            // App logo/title
            GestureDetector(
              onTap: () => context.go('/home'),
              child: Row(
                children: [
                  Icon(
                    Icons.school,
                    size: 32,
                    color: theme.colorScheme.onPrimary,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    'SPYGAM',
                    style: theme.textTheme.headlineMedium?.copyWith(
                      color: theme.colorScheme.onPrimary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),

            const Spacer(),

            // User info and actions
            switch (authState) {
              AuthStateAuthenticated(user: final user) ||
              AuthStateGuest(user: final user) =>
                Row(
                  children: [
                    // Points display
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 6,
                      ),
                      decoration: BoxDecoration(
                        color: theme.colorScheme.primaryContainer,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Row(
                        children: [
                          Icon(
                            Icons.star,
                            size: 16,
                            color: theme.colorScheme.onPrimaryContainer,
                          ),
                          const SizedBox(width: 4),
                          Text(
                            '${user.getTotalScore()}',
                            style: theme.textTheme.labelMedium?.copyWith(
                              color: theme.colorScheme.onPrimaryContainer,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(width: 16),

                    // Profile button
                    IconButton(
                      onPressed: () => context.go('/profile'),
                      icon: Icon(
                        Icons.person,
                        color: theme.colorScheme.onPrimary,
                      ),
                      tooltip: 'Profile',
                    ),

                    // Logout button
                    IconButton(
                      onPressed: () {
                        ref.read(authNotifierProvider.notifier).logout();
                        context.go('/identification');
                      },
                      icon: Icon(
                        Icons.logout,
                        color: theme.colorScheme.onPrimary,
                      ),
                      tooltip: 'Logout',
                    ),
                  ],
                ),
              _ => const SizedBox.shrink(),
            },
          ],
        ),
      ),
    );
  }
}

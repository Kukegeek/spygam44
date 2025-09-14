import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../data/notifiers/auth_notifier.dart';
import '../data/services/data_initialization_service.dart';
import '../ui/screens/identification_screen_simple.dart';
import '../ui/screens/main_layout_screen.dart';
import '../ui/screens/profile_screen.dart';
import '../ui/screens/home_screen.dart';
import '../ui/screens/hangman_screen.dart';

final routerProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: '/identification',
    redirect: (context, state) {
      final authState = ref.read(authNotifierProvider);

      // Initialize data if not already done
      DataInitializationService.initializeIfNeeded();

      // Handle authentication redirects
      switch (authState) {
        case AuthStateInitial():
          return '/identification';
        case AuthStateLoading():
          return '/identification';
        case AuthStateUnauthenticated():
          return '/identification';
        case AuthStateError():
          return '/identification';
        case AuthStateAuthenticated():
        case AuthStateGuest():
          if (state.matchedLocation == '/identification') {
            return '/home';
          }
          break;
      }

      return null;
    },
    routes: [
      GoRoute(
        path: '/identification',
        builder: (context, state) => const IdentificationScreen(),
      ),
      ShellRoute(
        builder: (context, state, child) => MainLayoutScreen(child: child),
        routes: [
          GoRoute(
            path: '/home',
            builder: (context, state) => const HomeScreen(),
          ),
          GoRoute(
            path: '/profile',
            builder: (context, state) => const ProfileScreen(),
          ),
          GoRoute(
            path: '/hangman',
            builder: (context, state) {
              final word = state.extra as String? ?? 'example';
              return HangmanScreen(word: word);
            },
          ),
        ],
      ),
    ],
  );
});

extension GoRouterExtension on GoRouter {
  void goToHome() => go('/home');
  void goToProfile() => go('/profile');
  void goToIdentification() => go('/identification');
  void goToHangman(String word) => go('/hangman', extra: word);
}

import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../models/user_profile.dart';
import '../repositories/auth_repository.dart';

part 'auth_notifier.g.dart';

@riverpod
class AuthNotifier extends _$AuthNotifier {
  @override
  AuthState build() {
    _checkAuthStatus();
    return const AuthState.initial();
  }

  Future<void> _checkAuthStatus() async {
    final authRepo = ref.read(authRepositoryProvider);
    final isLoggedIn = await authRepo.isLoggedIn();

    if (isLoggedIn) {
      final user = await authRepo.getCurrentUser();
      if (user != null) {
        state = AuthState.authenticated(user);
        return;
      }
    }

    state = const AuthState.unauthenticated();
  }

  Future<void> login(String email, String password) async {
    state = const AuthState.loading();

    final authRepo = ref.read(authRepositoryProvider);
    final result = await authRepo.login(email, password);

    if (result.isSuccess && result.user != null) {
      state = AuthState.authenticated(result.user!);
    } else {
      state = AuthState.error(result.error ?? 'Login failed');
    }
  }

  Future<void> register(String email, String password) async {
    state = const AuthState.loading();

    final authRepo = ref.read(authRepositoryProvider);
    final result = await authRepo.register(email, password);

    if (result.isSuccess && result.user != null) {
      state = AuthState.authenticated(result.user!);
    } else {
      state = AuthState.error(result.error ?? 'Registration failed');
    }
  }

  Future<void> logout() async {
    final authRepo = ref.read(authRepositoryProvider);
    await authRepo.logout();
    state = const AuthState.unauthenticated();
  }

  Future<void> playAsGuest() async {
    // Create a temporary guest profile
    final guestProfile = UserProfile.initial('guest', 'guest@spygam.com');
    state = AuthState.guest(guestProfile);
  }

  void clearError() {
    if (state is AuthStateError) {
      state = const AuthState.unauthenticated();
    }
  }
}

sealed class AuthState {
  const AuthState();

  const factory AuthState.initial() = AuthStateInitial;
  const factory AuthState.loading() = AuthStateLoading;
  const factory AuthState.authenticated(UserProfile user) =
      AuthStateAuthenticated;
  const factory AuthState.guest(UserProfile user) = AuthStateGuest;
  const factory AuthState.unauthenticated() = AuthStateUnauthenticated;
  const factory AuthState.error(String message) = AuthStateError;
}

class AuthStateInitial extends AuthState {
  const AuthStateInitial();
}

class AuthStateLoading extends AuthState {
  const AuthStateLoading();
}

class AuthStateAuthenticated extends AuthState {
  final UserProfile user;
  const AuthStateAuthenticated(this.user);
}

class AuthStateGuest extends AuthState {
  final UserProfile user;
  const AuthStateGuest(this.user);
}

class AuthStateUnauthenticated extends AuthState {
  const AuthStateUnauthenticated();
}

class AuthStateError extends AuthState {
  final String message;
  const AuthStateError(this.message);
}

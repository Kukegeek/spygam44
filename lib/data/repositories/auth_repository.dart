import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:crypto/crypto.dart';
import 'dart:convert';
import '../models/user_profile.dart';
import 'user_profile_repository.dart';

part 'auth_repository.g.dart';

@riverpod
AuthRepository authRepository(AuthRepositoryRef ref) {
  return AuthRepository(ref);
}

class AuthRepository {
  static const _storage = FlutterSecureStorage();
  static const String _emailKey = 'user_email';
  static const String _passwordKey = 'user_password';
  static const String _isLoggedInKey = 'is_logged_in';
  static const String _userIdKey = 'user_id';

  final AuthRepositoryRef _ref;

  AuthRepository(this._ref);

  UserProfileRepository get _userProfileRepository =>
      _ref.read(userProfileRepositoryProvider);

  String _hashPassword(String password) {
    final bytes = utf8.encode(password);
    final digest = sha256.convert(bytes);
    return digest.toString();
  }

  String _generateUserId() {
    return DateTime.now().millisecondsSinceEpoch.toString();
  }

  Future<AuthResult> register(String email, String password) async {
    try {
      // Check if email already exists
      final existingProfile =
          _userProfileRepository.getUserProfileByEmail(email);
      if (existingProfile != null) {
        return AuthResult.failure('Email already exists');
      }

      // Create new user profile
      final userId = _generateUserId();
      final profile = UserProfile.initial(userId, email);

      // Save user profile
      await _userProfileRepository.saveUserProfile(profile);

      // Save encrypted credentials
      final hashedPassword = _hashPassword(password);
      await _storage.write(key: _emailKey, value: email);
      await _storage.write(key: _passwordKey, value: hashedPassword);
      await _storage.write(key: _userIdKey, value: userId);
      await _storage.write(key: _isLoggedInKey, value: 'true');

      return AuthResult.success(profile);
    } catch (e) {
      return AuthResult.failure('Registration failed: ${e.toString()}');
    }
  }

  Future<AuthResult> login(String email, String password) async {
    try {
      // Check if user exists
      final profile = _userProfileRepository.getUserProfileByEmail(email);
      if (profile == null) {
        return AuthResult.failure('User not found');
      }

      // Check stored credentials
      final storedEmail = await _storage.read(key: _emailKey);
      final storedPasswordHash = await _storage.read(key: _passwordKey);

      if (storedEmail != email ||
          storedPasswordHash != _hashPassword(password)) {
        return AuthResult.failure('Invalid credentials');
      }

      // Update login state
      await _storage.write(key: _isLoggedInKey, value: 'true');
      await _storage.write(key: _userIdKey, value: profile.userId);

      return AuthResult.success(profile);
    } catch (e) {
      return AuthResult.failure('Login failed: ${e.toString()}');
    }
  }

  Future<void> logout() async {
    await _storage.write(key: _isLoggedInKey, value: 'false');
    await _storage.delete(key: _userIdKey);
  }

  Future<bool> isLoggedIn() async {
    final isLoggedIn = await _storage.read(key: _isLoggedInKey);
    return isLoggedIn == 'true';
  }

  Future<UserProfile?> getCurrentUser() async {
    final isLoggedIn = await this.isLoggedIn();
    if (!isLoggedIn) return null;

    final userId = await _storage.read(key: _userIdKey);
    if (userId == null) return null;

    return _userProfileRepository.getUserProfileById(userId);
  }

  Future<void> clearAllData() async {
    await _storage.deleteAll();
    await _userProfileRepository.clear();
  }
}

class AuthResult {
  final bool isSuccess;
  final String? error;
  final UserProfile? user;

  AuthResult._({required this.isSuccess, this.error, this.user});

  factory AuthResult.success(UserProfile user) {
    return AuthResult._(isSuccess: true, user: user);
  }

  factory AuthResult.failure(String error) {
    return AuthResult._(isSuccess: false, error: error);
  }
}

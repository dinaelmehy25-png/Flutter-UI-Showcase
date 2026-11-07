import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

import '../models/app_user.dart';
import '../services/auth_service.dart';

/// VIEWMODEL: holds the login/sign-up screen state and logic.
/// The View only reads these values and calls these methods.
class AuthViewModel extends ChangeNotifier {
  AuthViewModel(this._authService);

  final AuthService _authService;

  bool _isLoginMode = true;
  bool _isLoading = false;
  String? _errorMessage;

  bool get isLoginMode => _isLoginMode;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;
  Stream<AppUser?> get userStream => _authService.userStream;

  void toggleMode() {
    _isLoginMode = !_isLoginMode;
    _errorMessage = null;
    notifyListeners();
  }

  Future<void> submit(String email, String password) async {
    email = email.trim();
    if (email.isEmpty || password.isEmpty) {
      _errorMessage = 'Enter your email and password.';
      notifyListeners();
      return;
    }

    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      if (_isLoginMode) {
        await _authService.signIn(email, password);
      } else {
        await _authService.signUp(email, password);
      }
      // No navigation needed: AuthGate reacts to the auth state change.
    } on FirebaseAuthException catch (e) {
      _errorMessage = _messageFor(e.code);
    } catch (_) {
      _errorMessage = 'Something went wrong. Try again.';
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> signOut() => _authService.signOut();

  String _messageFor(String code) {
    switch (code) {
      case 'invalid-email':
        return 'That email address isn\'t valid.';
      case 'invalid-credential':
      case 'user-not-found':
      case 'wrong-password':
        return 'Email or password is incorrect.';
      case 'email-already-in-use':
        return 'An account with this email already exists. Log in instead.';
      case 'weak-password':
        return 'Use a password with at least 6 characters.';
      case 'network-request-failed':
        return 'No internet connection. Check it and try again.';
      case 'too-many-requests':
        return 'Too many attempts. Wait a moment and try again.';
      default:
        return 'Something went wrong ($code). Try again.';
    }
  }
}

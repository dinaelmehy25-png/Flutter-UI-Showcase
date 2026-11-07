import 'package:firebase_auth/firebase_auth.dart';

import '../models/app_user.dart';

/// MODEL LAYER (data source): the only file that talks to Firebase Authentication.
class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  /// Emits the signed-in user, or null when signed out.
  Stream<AppUser?> get userStream => _auth.authStateChanges().map(_toAppUser);

  Future<void> signIn(String email, String password) async {
    await _auth.signInWithEmailAndPassword(email: email, password: password);
  }

  Future<void> signUp(String email, String password) async {
    await _auth.createUserWithEmailAndPassword(email: email, password: password);
  }

  Future<void> signOut() async {
    await _auth.signOut();
  }

  AppUser? _toAppUser(User? user) {
    if (user == null) return null;
    return AppUser(uid: user.uid, email: user.email ?? '');
  }
}

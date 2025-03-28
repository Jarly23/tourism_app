import 'package:firebase_auth/firebase_auth.dart'
    as firebase_auth; // Prefijo para Firebase
import 'package:tourism_app/services/auth_service.dart';
import 'package:tourism_app/models/user.dart'
    as app_user; // Prefijo para tu modelo

class UserRepository {
  final AuthService _authService = AuthService();

  Stream<firebase_auth.User?> get authStateChanges =>
      _authService.authStateChanges;

  Future<firebase_auth.User?> loginWithEmail(
    String email,
    String password,
  ) async {
    return await _authService.loginWithEmail(email, password);
  }

  Future<firebase_auth.User?> registerWithEmail(
    String email,
    String password,
  ) async {
    return await _authService.registerWithEmail(email, password);
  }

  Future<firebase_auth.User?> signInWithGoogle() async {
    return await _authService.signInWithGoogle();
  }

  Future<void> signOut() async {
    await _authService.signOut();
  }

  firebase_auth.User? getCurrentUser() {
    return _authService.currentUser;
  }
}

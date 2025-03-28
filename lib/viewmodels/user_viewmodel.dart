import 'package:flutter/material.dart';
import 'package:tourism_app/models/user.dart' as app_user;
import 'package:tourism_app/repository/user_repository.dart';

class UserViewModel with ChangeNotifier {
  final UserRepository _userRepository = UserRepository();
  app_user.User? _currentUser;
  String? _errorMessage;
  bool _isLoading = false;

  app_user.User? get currentUser => _currentUser;
  String? get errorMessage => _errorMessage;
  bool get isLoading => _isLoading;

  UserViewModel() {
    _listenToAuthChanges();
  }

  void _listenToAuthChanges() {
    _userRepository.authStateChanges.listen((user) {
      if (user != null) {
        _currentUser = app_user.User(uid: user.uid, email: user.email ?? '');
      } else {
        _currentUser = null;
      }
      notifyListeners();
    });
  }

  Future<void> loginWithEmail(String email, String password) async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      await _userRepository.loginWithEmail(email, password);
    } catch (e) {
      _errorMessage = e.toString().replaceFirst('Exception: ', '');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> registerWithEmail(String email, String password) async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      await _userRepository.registerWithEmail(email, password);
    } catch (e) {
      _errorMessage = e.toString().replaceFirst('Exception: ', '');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> signInWithGoogle() async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      await _userRepository.signInWithGoogle();
    } catch (e) {
      _errorMessage = e.toString().replaceFirst('Exception: ', '');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> signOut() async {
    await _userRepository.signOut();
  }
}

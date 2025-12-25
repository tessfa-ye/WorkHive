import 'package:flutter/material.dart';
import '../../domain/usecases/login_usecase.dart';
import '../../domain/entities/user_entity.dart';

class AuthProvider extends ChangeNotifier {
  final LoginUseCase loginUseCase;

  AuthProvider({required this.loginUseCase});

  UserEntity? _user;
  bool _isLoading = false;
  String? _errorMessage;

  UserEntity? get user => _user;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  Future<void> login(String email, String password) async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      _user = await loginUseCase.execute(email, password);
    } catch (e) {
      _errorMessage = "Login failed. Please try again.";
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
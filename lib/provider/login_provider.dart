import 'package:api_management/services/login_service.dart';
import 'package:flutter/material.dart';

import '../model/LoginResponse.dart';

class LoginProvider extends ChangeNotifier {
  final LoginService _service = LoginService();
  bool isLoading = false;

  static LoginResponse? _response;
  LoginResponse? get response => _response;

  initResponse() {
    _response = null;
  }

  Future<void> loginUser(
      String emailId, String password, String firebaseToken) async {
    isLoading = true;
    notifyListeners();

    _response = await _service.login(emailId, password, firebaseToken);
    isLoading = false;
    notifyListeners();
  }
}

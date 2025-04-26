import 'package:flutter/material.dart';
import 'auth_controller.dart';

class LoginController extends ChangeNotifier {
  final AuthController authController;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool rememberMe = false;

  LoginController(this.authController);

  void toggleRememberMe(bool value) {
    rememberMe = value;
    notifyListeners();
  }

  bool validate() {
    return emailController.text.isNotEmpty &&
        passwordController.text.length >= 6;
  }

  void login() {
    if (validate()) {
      authController.login(
        identifier: emailController.text,
        password: passwordController.text,
      );
    }
  }
}

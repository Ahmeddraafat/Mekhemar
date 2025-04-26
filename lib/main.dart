import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'controllers/auth_controller.dart';
import 'controllers/home_controller.dart';
import 'firebase_options.dart';
import 'views/screens/home_screen.dart';
import 'views/screens/login_screen.dart';
import 'views/screens/signup_screen.dart';
import 'views/screens/forgot_password_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(name: 'mobile-project', options: DefaultFirebaseOptions.currentPlatform);
  final authController = AuthController();
  final homeController = HomeController();

  runApp(MyApp(
    authController: authController,
    homeController: homeController,
  ));
}

class MyApp extends StatelessWidget {
  final AuthController authController;
  final HomeController homeController;

  const MyApp({
    super.key,
    required this.authController,
    required this.homeController,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter MVC',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      initialRoute: '/login',
      routes: {
        '/login': (context) => LoginScreen(authController: authController),
        '/signup': (context) => SignupScreen(authController: authController),
        '/forgot-password': (context) => ForgotPasswordScreen(authController: authController),
        '/home': (context) => HomeScreen(
          authController: authController,
          homeController: homeController,
        ),
      },
    );
  }
}
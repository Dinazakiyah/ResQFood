import 'package:flutter/material.dart';
import '../features/splash_screen.dart';
import '../features/login_screen.dart';
import '../features/home_screen.dart'; // ← Tambahkan ini

class AppRoutes {
  static const String splash = '/';
  static const String login = '/login';
  static const String home = '/home'; // ← Tambahkan ini

  static Map<String, WidgetBuilder> routes = {
    splash: (context) => const SplashScreen(),
    login: (context) => const LoginScreen(),
    home: (context) => const HomeScreen(), // ← Tambahkan ini
  };
}
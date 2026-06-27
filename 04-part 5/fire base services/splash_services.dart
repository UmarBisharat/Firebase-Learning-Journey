import 'dart:async';
import 'package:flutter/material.dart';
import 'package:untitled/ui/auth/login_screen.dart';

class SplashServices {
  void isLogin(BuildContext context) { // Use context for navigation
    Timer(const Duration(seconds: 3), () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const LoginScreen(),
        ),
      );
    });
  }
}

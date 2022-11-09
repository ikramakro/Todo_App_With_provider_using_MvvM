import 'dart:async';
import 'package:flutter/material.dart';
import 'package:todo_using_firebase/Screen/Auth/LoginScreen/LoginScreen.dart';

class SplashServices {
  void isLogin(BuildContext context) {
    Timer(
      const Duration(seconds: 3),
      () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const LoginScreen()));
      },
    );
  }
}

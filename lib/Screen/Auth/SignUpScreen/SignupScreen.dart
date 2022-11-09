import 'package:flutter/material.dart';
import 'package:todo_using_firebase/view_model/SignUpForm.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SignUpForm(),
      ],
    ));
  }
}

import 'package:flutter/material.dart';
import 'package:todo_using_firebase/Widgets/TextFormfield.dart';
import 'package:todo_using_firebase/view_model/LoginForm.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            LoginForm(),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}

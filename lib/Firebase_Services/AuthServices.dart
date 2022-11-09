import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo_using_firebase/Screen/HomePage.dart';

import '../view_model/LoginForm.dart';

class Authentication {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  void signin(String email, password) {
    _auth
        .createUserWithEmailAndPassword(email: email, password: password)
        .then((value) {
      toastMasseges('User Created');
    }).onError((error, stackTrace) {
      toastMasseges(error.toString());
    });
  }

  void login(String email, password, BuildContext context) {
    _auth
        .signInWithEmailAndPassword(email: email, password: password)
        .then((value) {
      toastMasseges('Login Succesfully');
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => HomePage()));
    }).onError((error, stackTrace) {
      toastMasseges(error.toString());
    });
  }
}

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:todo_using_firebase/Firebase_Services/AuthServices.dart';
import 'package:todo_using_firebase/Widgets/MyButton.dart';
import 'package:todo_using_firebase/Widgets/TextFormfield.dart';
import 'package:todo_using_firebase/Widgets/TextWidget.dart';

import '../Screen/Auth/SignUpScreen/SignupScreen.dart';

class LoginForm extends StatelessWidget {
  LoginForm({super.key});

  // final formkey = GlobalKey<FormState>();
  GlobalKey<FormState> _formkey = GlobalKey();
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  FirebaseAuth auth = FirebaseAuth.instance;
  final Authentication _authentication = Authentication();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formkey,
      child: Column(
        children: [
          MyTextField(
              controler: emailcontroller,
              hint: 'Enter your Email Address',
              icon: Icons.email,
              validate: () {
                MultiValidator([RequiredValidator(errorText: 'Required')]);
              }),
          const SizedBox(
            height: 20,
          ),
          MyTextField(
              controler: passwordcontroller,
              hint: 'Enter your Password',
              icon: Icons.lock,
              validate: () {
                MultiValidator([
                  RequiredValidator(errorText: 'Required'),
                  MinLengthValidator(6, errorText: 'password must be 6 char')
                ]);
              }),
          MyButton(
              buttonTxt: 'Login',
              onpressed: () {
                if (_formkey.currentState!.validate()) {
                  _authentication.login(emailcontroller.text.toString(),
                      passwordcontroller.text.toString(), context);
                }
              }),
          Row(
            children: [
              MyText(
                txt: 'Idon\'t have Account ',
                fontsize: 18,
              ),
              TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SignUpScreen()));
                  },
                  child: MyText(
                    txt: 'Sign Up',
                  ))
            ],
          )
        ],
      ),
    );
  }
}

void toastMasseges(String masseg) {
  Fluttertoast.showToast(
      msg: masseg.toString(),
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.red,
      textColor: Colors.white,
      fontSize: 16.0);
}

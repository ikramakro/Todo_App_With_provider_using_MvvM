import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:todo_using_firebase/Widgets/MyButton.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../Firebase_Services/AuthServices.dart';
import '../Screen/HomePage.dart';
import '../Widgets/TextFormfield.dart';
import '../Widgets/TextWidget.dart';

class SignUpForm extends StatelessWidget {
  SignUpForm({super.key});
  TextEditingController namecontroler = TextEditingController();
  TextEditingController emailcontroler = TextEditingController();
  TextEditingController passwordcontroler = TextEditingController();
  final Authentication _authentication = Authentication();
  final GlobalKey<FormState> _formkey = GlobalKey();
  CollectionReference users = FirebaseFirestore.instance.collection('users');
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30),
      child: Form(
        key: _formkey,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              MyText(
                txt: 'SignUp Screen',
                fontsize: 28,
              ),
              MyTextField(
                  hint: 'Enter your Name',
                  icon: Icons.person,
                  validate: () {
                    MultiValidator([RequiredValidator(errorText: 'Required')]);
                  },
                  controler: namecontroler),
              const SizedBox(
                height: 20,
              ),
              MyTextField(
                  hint: 'Enter your Email Address',
                  icon: Icons.email,
                  validate: () {
                    MultiValidator([RequiredValidator(errorText: 'Required')]);
                  },
                  controler: emailcontroler),
              const SizedBox(
                height: 20,
              ),
              MyTextField(
                  hint: 'Enter Your Password',
                  icon: Icons.lock,
                  validate: () {
                    MultiValidator([RequiredValidator(errorText: 'Required')]);
                  },
                  controler: passwordcontroler),
              MyButton(
                  buttonTxt: 'SignUp',
                  onpressed: () {
                    if (_formkey.currentState!.validate()) {
                      _authentication.signin(emailcontroler.text.toString(),
                          passwordcontroler.text.toString());
                      users.doc().set({'Name': namecontroler.text.toString()});
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => HomePage()));
                    }
                  })
            ]),
      ),
    );
  }
}

class HomeScreen {}

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

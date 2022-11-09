// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  String hint;
  IconData icon;
  Function validate;
  TextEditingController controler;
  MyTextField(
      {Key? key,
      required this.hint,
      required this.icon,
      required this.validate,
      required this.controler})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      controller: controler,
      decoration: InputDecoration(
          hintText: hint,
          prefixIcon: Icon(
            icon,
          ),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
      validator: (value) {
        validate();
      },
    );
  }
}

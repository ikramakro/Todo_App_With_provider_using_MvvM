// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:todo_using_firebase/Widgets/TextWidget.dart';

class MyButton extends StatelessWidget {
  String buttonTxt;
  Function onpressed;
  MyButton({
    Key? key,
    required this.buttonTxt,
    required this.onpressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () => onpressed(),
        child: MyText(
          txt: buttonTxt,
        ));
  }
}

import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:todo_using_firebase/Firebase_Services/PostServices.dart';

import '../Widgets/MyButton.dart';
import '../Widgets/TextFormfield.dart';

class PostViewModel extends StatelessWidget {
  PostViewModel({super.key});
  TextEditingController postcontroler = TextEditingController();
  PostServices postServices = PostServices();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        MyTextField(
            hint: 'Add Task Here',
            icon: Icons.task,
            validate: () {
              MultiValidator([RequiredValidator(errorText: 'Required')]);
            },
            controler: postcontroler),
        MyButton(
            buttonTxt: 'Uplod',
            onpressed: () {
              postServices.addPost(postcontroler);
            })
      ],
    );
  }
}

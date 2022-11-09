import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:todo_using_firebase/view_model/LoginForm.dart';

class PostServices {
  CollectionReference toDo = FirebaseFirestore.instance.collection('ToDo');

  void addPost(TextEditingController postControler) {
    String id = DateTime.now().millisecond.toString();
    toDo
        .doc(id)
        .set({'Task ': postControler.text.toString(), 'id': id}).onError(
            (error, stackTrace) {
      toastMasseges(error.toString());
    });
  }
}

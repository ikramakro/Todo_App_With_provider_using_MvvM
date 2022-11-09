import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

class HomeScreenModel with ChangeNotifier {
  List salectedItem = [];

  void get item => salectedItem;

  void setItem(int value) {
    salectedItem.add(value);

    notifyListeners();
  }

  void removeitem(int value) {
    salectedItem.remove(value);
    notifyListeners();
  }
}

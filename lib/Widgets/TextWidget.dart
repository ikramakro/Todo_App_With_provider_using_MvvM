// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class MyText extends StatelessWidget {
  String txt;
  double fontsize;
  FontWeight fontweight;

  MyText({
    Key? key,
    required this.txt,
    this.fontsize = 12,
    this.fontweight = FontWeight.normal,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      txt,
      style: TextStyle(fontSize: fontsize, fontWeight: fontweight),
    );
  }
}

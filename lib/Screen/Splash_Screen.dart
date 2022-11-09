import 'package:flutter/material.dart';
import 'package:todo_using_firebase/Firebase_Services/SplashServices.dart';
import 'package:todo_using_firebase/Widgets/TextWidget.dart';

class Splash_Screen extends StatefulWidget {
  const Splash_Screen({super.key});

  @override
  State<Splash_Screen> createState() => _Splash_ScreenState();
}

class _Splash_ScreenState extends State<Splash_Screen> {
  SplashServices splashServices = SplashServices();
  @override
  void initState() {
    super.initState();

    splashServices.isLogin(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: MyText(
            txt: 'Splash Screen', fontsize: 20, fontweight: FontWeight.bold),
      ),
    );
  }
}

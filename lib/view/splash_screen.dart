import 'dart:async';

import 'package:e_comerce_app/view/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../styles/colors.dart';
import 'home_screen.dart';

String? finalEmail;

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    getValidationData().whenComplete(() async{
      const delay = Duration(seconds: 3);
      Future.delayed(delay, () => Get.to(finalEmail==null?const WelcomeScreen():
      const HomePage()
      ));
    });

  }
Future getValidationData()async{
    final SharedPreferences sharedPreferences=await SharedPreferences.getInstance();
    var obtainedEmail=sharedPreferences.getString('user');
    setState(() {
      finalEmail=obtainedEmail;
    });
    print(finalEmail);
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:primaryColor,
      body: Center(
        child: splashScreenIcon(),
      ),
    );
  }
}

Widget splashScreenIcon() {
  String iconPath = "assets/icons/order_accepted_icon.svg";
  return SvgPicture.asset(
    iconPath,
  );
}

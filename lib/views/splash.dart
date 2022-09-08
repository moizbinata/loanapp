import 'dart:async';

import 'package:flutter/material.dart';
import 'package:loanapp/views/home.dart';
import 'package:loanapp/views/login.dart';

import '../utils/constants.dart';
import '../utils/size_config.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation<double> animation;
  @override
  void initState() {
    super.initState();
    // controller = AnimationController(
    //     duration: const Duration(milliseconds: 4000), vsync: this);
    // animation = Tween(begin: 0.0, end: 1.0).animate(controller)
    //   ..addListener(() {
    //     setState(() {});
    //   });
    // controller.repeat();
    startTime();
  }

  startTime() async {
    var duration = Duration(seconds: 5);
    return Timer(duration, route);
  }

  route() {
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => Login(),
        ));
  }

  // @override
  // void dispose() {
  //   //controller.stop();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.white,
      body: Center(
        child: Image(
          image: AssetImage('assets/img/logo.png'),
          width: SizeConfig.heightMultiplier * 30,
        ),
      ),
    );
  }
}

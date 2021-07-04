import 'dart:async';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:pizzato_mvvm/app/routes.dart';
import 'package:pizzato_mvvm/core/viewmodels/SplashScreenViewModel.dart';
import 'package:provider/provider.dart';
import 'package:sailor/sailor.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 2), () async {
      bool isAuthenticated =
          await Provider.of<SplashScreenViewModel>(context, listen: false)
              .isAuthenticated();
      isAuthenticated == true
          ? Routes.sailor.navigate("/home_screen")
          : Routes.sailor.navigate("/login_screen");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 350,
              width: 500,
              child: Lottie.asset('animations/food.json'),
            ),
            RichText(
                text: TextSpan(
                    text: 'Piz',
                    style: TextStyle(
                        fontSize: 55,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                    children: [
                  TextSpan(
                    text: 'z',
                    style: TextStyle(
                        fontSize: 55,
                        fontWeight: FontWeight.bold,
                        color: Colors.red),
                  ),
                  TextSpan(
                    text: 'ato',
                    style: TextStyle(
                        fontSize: 55,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                ]))
          ],
        ),
      ),
    );
  }
}

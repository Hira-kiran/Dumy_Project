// ignore_for_file: file_names
import 'dart:async';
import 'package:dumy_project/constants/images.dart';
import 'package:flutter/material.dart';
import '../constants/routes/routes_name.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(
      const Duration(seconds: 3),
      () => Navigator.pushNamedAndRemoveUntil(
          context, RoutesName.home, ((route) => false)),
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Image.asset(
              AppImages.splashImg,
              width: 300,
            ),
          ),
          const Text(
            "Dumy Project",
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }
}

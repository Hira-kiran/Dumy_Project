import 'package:dumy_project/view/home_screen.dart';
import 'package:dumy_project/view/splash_screen.dart';
import 'package:flutter/material.dart';
import 'routes_name.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesName.splash:
        return MaterialPageRoute(builder: (context) => const SplashScreen());
      case RoutesName.home:
        return MaterialPageRoute(builder: (context) => const HomeScreen());
      default:
        return MaterialPageRoute(builder: (context) {
          return const Scaffold(
            body: Center(child: Text("No route Define")),
          );
        });
    }
  }
}

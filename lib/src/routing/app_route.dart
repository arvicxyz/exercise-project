import 'package:exercise_project/src/features/home/views/first_screen.dart';
import 'package:exercise_project/src/features/home/views/home_screen.dart';
import 'package:exercise_project/src/features/home/views/second_screen.dart';
import 'package:exercise_project/src/features/home/views/third_screen.dart';
import 'package:flutter/material.dart';

class AppRoute {
  static const String homeRoute = "Home";
  static const String firstRoute = "First";
  static const String secondRoute = "Second";
  static const String thirdRoute = "Third";

  static Map<String, Widget Function(BuildContext)> routes = {
    homeRoute: (context) => const HomeScreen(),
    firstRoute: (context) => const FirstScreen(),
    secondRoute: (context) => const SecondScreen(),
    thirdRoute: (context) => const ThirdScreen(),
  };

  static Widget getHomeScreen() {
    return const HomeScreen();
  }

  static void navigate(BuildContext context, String routeName) {
    Navigator.pushNamed(
      context,
      routeName,
    );
  }
}

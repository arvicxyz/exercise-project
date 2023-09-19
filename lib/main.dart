import 'package:exercise_project/src/core/configs/app_theme.dart';
import 'package:exercise_project/src/core/data_storage.dart';
import 'package:exercise_project/src/routing/app_route.dart';
import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  DataStorage.instance.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Exercise App',
      theme: AppTheme.getAppTheme(),
      home: AppRoute.getHomeScreen(),
      routes: AppRoute.routes,
    );
  }
}

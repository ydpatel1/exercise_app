import 'package:exercise_app/screens/active_breaks.dart';
import 'package:exercise_app/config/app_colors.dart';
import 'package:exercise_app/utils/my_scrollbehavior.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

GlobalKey<NavigatorState>? navigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MaterialApp(
      navigatorKey: navigatorKey,
      scrollBehavior: MyBehavior(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: AppColors.primaryColor,
        colorScheme: ColorScheme.fromSeed(
            seedColor: AppColors.primaryColor,
            onSecondaryContainer: AppColors.secondaryColor),
        useMaterial3: false,
      ),
      home: const ActiveBreaks(),
    );
  }
}

import 'package:exercise_app/screens/active_breaks.dart';
import 'package:exercise_app/config/app_colors.dart';
import 'package:exercise_app/utils/my_scrollbehavior.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: (context, child) =>
          ScrollConfiguration(behavior: MyBehavior(), child: child!),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: AppColors.primaryColor,
        colorScheme: ColorScheme.fromSeed(
            seedColor: AppColors.primaryColor,
            onSecondaryContainer: AppColors.secondaryColor),
        useMaterial3: true,
      ),
      home: const ActiveBreaks(),
    );
  }
}

import 'package:exercise_app/config/all_config.dart';
import 'package:exercise_app/screens/active_breaks.dart';
import 'package:exercise_app/widget/app_button.dart';
import 'package:flutter/material.dart';

class SuccessScreen extends StatelessWidget {
  const SuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Successfully updated user profile",
                textAlign: TextAlign.center,
                style: AppStyle.titlestyle
                    .copyWith(color: AppColors.secondaryColor),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        margin: const EdgeInsets.all(16),
        child: AppButton(
          onPressed: () {
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (context) => const ActiveBreaks(),
                ),
                (p) => true);
            // Navigator.pushNamed(context, "/customExercise");
          },
          title: "Start again",
        ),
      ),
    );
  }
}

import 'package:exercise_app/config/all_config.dart';
import 'package:exercise_app/widget/all_widget.dart';
import 'package:flutter/material.dart';

class CustomExercise extends StatelessWidget {
  const CustomExercise({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const AppTitle(
              titel1: "Hello",
              titel2: "Aden",
              subTitle:
                  "Break the sedentary lifestyle and become active during your work time.",
            ),
            23.sizeH,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                "Select what works for you the best!",
                style: AppStyle.titlestyle.copyWith(
                    color: AppColors.secondaryColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w700),
              ),
            ),
            15.sizeH,
            ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 13, vertical: 17),
                    decoration: BoxDecoration(
                        color: AppColors.boxColor,
                        borderRadius: BorderRadius.circular(10)),
                    child: Row(
                      children: [
                        Text(
                          "In the",
                          style: AppStyle.subtext12.copyWith(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        )
                      ],
                    ),
                  );
                })
          ],
        ),
      ),
      bottomNavigationBar: Container(
        margin: const EdgeInsets.all(16),
        child: AppButton(
          onPressed: () {},
          title: "Continue",
        ),
      ),
    );
  }
}

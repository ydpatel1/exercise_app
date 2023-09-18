import 'package:exercise_app/config/all_config.dart';
import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    super.key,
    required this.onPressed,
    required this.title,
    this.padding,
  });

  final Function()? onPressed;
  final String title;
  final EdgeInsetsGeometry? padding;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            padding: padding ?? const EdgeInsets.symmetric(vertical: 13),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            backgroundColor: AppColors.primaryColor),
        onPressed: onPressed,
        child: Text(
          title,
          style:
              AppStyle.titlestyle.copyWith(fontSize: 16, color: Colors.white),
        ));
  }
}

import 'package:exercise_app/config/all_config.dart';
import 'package:flutter/material.dart';

class AppTitle extends StatelessWidget {
  const AppTitle({
    super.key,
    required this.titel1,
    required this.titel2,
    required this.subTitle,
  });
  final String titel1;
  final String titel2;
  final String subTitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        (MediaQuery.of(context).padding.top + 20).sizeH,
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: TitleWidget(
            title: titel1,
            subTitle: titel2,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            subTitle,
            maxLines: 2,
            style: AppStyle.subtext12.copyWith(fontWeight: FontWeight.w400),
          ),
        ),
      ],
    );
  }
}

class TitleWidget extends StatelessWidget {
  const TitleWidget({
    super.key,
    required this.title,
    required this.subTitle,
  });
  final String title;
  final String subTitle;

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
          text: "$title ",
          children: [TextSpan(text: subTitle, style: AppStyle.titlestyle)]),
      style: AppStyle.titlestyle.copyWith(color: AppColors.secondaryColor),
    );
  }
}

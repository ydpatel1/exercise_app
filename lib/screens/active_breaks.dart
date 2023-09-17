import 'package:exercise_app/config/all_config.dart';
import 'package:exercise_app/screens/custom_exercise.dart';
import 'package:exercise_app/utils/any_radio.dart/radio_bloc/radio_fun_bloc.dart';
import 'package:exercise_app/widget/all_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

final List<String> imgList = [
  'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
  'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
  'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
  'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
  'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
  'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80'
];

class ActiveBreaks extends StatelessWidget {
  const ActiveBreaks({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RadioFunBloc()..add(const RadioFunEvent(0)),
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const AppTitle(
                titel1: "Set your",
                titel2: "Active Breaks",
                subTitle:
                    "Break the sedentary lifestyle and become active during your work time",
              ),
              23.sizeH,
              const ImageSlider(),
              23.sizeH,
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Center(
                  child: Text(
                    "Active breaks are the time you want to break the sedentary behaviour with small exercises of maximum 5 min.",
                    textAlign: TextAlign.center,
                    style: AppStyle.subtext12,
                  ),
                ),
              ),
              30.sizeH,
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  children: [
                    Expanded(
                      child: RedioContainerButton(
                        index: 0,
                        lebelText: "Recommendation",
                        child: Text.rich(
                          TextSpan(
                              text: "1 ",
                              style: AppStyle.subtext12.copyWith(
                                  color: AppColors.primaryColor,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600),
                              children: [
                                TextSpan(
                                    text: "per day for the first ",
                                    style: AppStyle.subtext12.copyWith(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w400)),
                                TextSpan(
                                  text: "14 ",
                                  style: AppStyle.subtext12.copyWith(
                                      color: AppColors.primaryColor,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600),
                                ),
                                TextSpan(
                                    text: "days then ",
                                    style: AppStyle.subtext12.copyWith(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w400)),
                                TextSpan(
                                  text: "2 ",
                                  style: AppStyle.subtext12.copyWith(
                                      color: AppColors.primaryColor,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600),
                                ),
                                TextSpan(
                                    text: "per day ",
                                    style: AppStyle.subtext12.copyWith(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w400)),
                              ]),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    15.sizeW,
                    Expanded(
                      child: RedioContainerButton(
                          index: 1,
                          lebelText: "Decide for yourself",
                          child: Text(
                              "Here your can set your own daily active breaks program",
                              maxLines: 3,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.center,
                              style: AppStyle.subtext12
                                  .copyWith(color: Colors.black))),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: Container(
          margin: const EdgeInsets.all(16),
          child: AppButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const CustomExercise()));
            },
            title: "Continue",
          ),
        ),
      ),
    );
  }
}

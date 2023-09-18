import 'package:exercise_app/bloc/bloc/custom_exercise_bloc.dart';
import 'package:exercise_app/config/all_config.dart';
import 'package:exercise_app/screens/custom_exercise.dart';
import 'package:exercise_app/utils/any_radio.dart/radio_bloc/radio_fun_bloc.dart';
import 'package:exercise_app/widget/all_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';



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
              print("Killo");
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => BlocProvider(
                            create: (context) => CustomExerciseBloc()
                              ..add(CustomExerciseLogin()),
                            child: const CustomExercise(),
                          )));
              // Navigator.pushNamed(context, "/customExercise");
            },
            title: "Continue",
          ),
        ),
      ),
    );
  }
}

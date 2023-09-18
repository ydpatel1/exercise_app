import 'package:exercise_app/bloc/bloc/custom_exercise_bloc.dart';
import 'package:exercise_app/bloc/bloc/custom_exercise_state.dart';
import 'package:exercise_app/config/all_config.dart';
import 'package:exercise_app/config/enum/statestatus.dart';
import 'package:exercise_app/screens/success_screen.dart';
import 'package:exercise_app/utils/dialog_utils.dart';
import 'package:exercise_app/widget/all_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class CustomExercise extends StatefulWidget {
  const CustomExercise({super.key});

  @override
  State<CustomExercise> createState() => _CustomExerciseState();
}

class _CustomExerciseState extends State<CustomExercise> {
  String value = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<CustomExerciseBloc, CustomExerciseState>(
        listener: (context, state) {
          if (state.stateStatus == StateStatus.sucsess) {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const SuccessScreen()));
          }
        },
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                children: [
                  const AppTitle(
                    titel1: "Hello",
                    titel2: "Aden",
                    subTitle:
                        "Break the sedentary lifestyle and become active during your work time.",
                  ),
                  23.sizeH,
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Text(
                        "Select what works for you the best!",
                        style: AppStyle.titlestyle.copyWith(
                            color: AppColors.secondaryColor,
                            fontSize: 16,
                            fontWeight: FontWeight.w700),
                      ),
                    ),
                  ),
                  15.sizeH,
                ],
              ),
            ),
            BlocBuilder<CustomExerciseBloc, CustomExerciseState>(
              // buildWhen: (previous, current) =>
              //     previous.breakList.length != current.breakList.length,
              builder: (context, state) {
                return AppLoding(
                  isLoding: state.stateStatus == StateStatus.loading,
                  child: SliverList.builder(
                      itemCount: state.breakList.length,
                      itemBuilder: (context, index) {
                        if (state.breakList.length == 1) {
                          return FittedBox(
                            child: SelectNewValues(
                              index: index,
                              timeData: state.breakList[index],
                            ),
                          );
                        }
                        return Dismissible(
                          onDismissed: (direction) {
                            print(direction);

                            context
                                .read<CustomExerciseBloc>()
                                .add(CustomExerciseAddTime(index: index));
                          },
                          background: Align(
                            alignment: Alignment.centerRight,
                            child: Padding(
                              padding: const EdgeInsets.only(right: 16),
                              child: Icon(
                                Icons.cancel_outlined,
                                color: AppColors.primaryColor,
                                size: 27,
                              ),
                            ),
                          ),
                          key: UniqueKey(),
                          child: FittedBox(
                            child: SelectNewValues(
                              index: index,
                              timeData: state.breakList[index],
                            ),
                          ),
                        );
                      }),
                );
              },
            ),
            SliverToBoxAdapter(
              child: Padding(
                  padding: const EdgeInsets.only(top: 36),
                  child: Center(
                      child: AppButton(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 22, vertical: 7),
                          onPressed: () {
                            context.read<CustomExerciseBloc>().add(
                                CustomExerciseAddTime(
                                    timeData: TimeData(
                                        hour: 08, minute: 00, am: "AM")));
                          },
                          title: "+ Add More"))),
            )
          ],
        ),
      ),
      bottomNavigationBar: Container(
        margin: const EdgeInsets.all(16),
        child: AppButton(
          onPressed: () {
            context.read<CustomExerciseBloc>().add(CustomExerciseUpdateUser());
          },
          title: "Continue",
        ),
      ),
    );
  }
}



import 'package:exercise_app/bloc/bloc/custom_exercise_bloc.dart';
import 'package:exercise_app/config/all_config.dart';
import 'package:exercise_app/utils/dialog_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppTimePiker extends StatelessWidget {
  const AppTimePiker({
    super.key,
    required this.timeZone,
    required this.timeData,
    required this.index,
  });
  final String timeZone;
  final TimeData timeData;
  final int index;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        timePikerDilog(context, (TimeData? v) {
          if (v != null) {
            print(index);
            print(v);
            context
                .read<CustomExerciseBloc>()
                .add(CustomExerciseAddTime(index: index, timeData: v));
          }
        }, timeZone);
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 9),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(10)),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              Icons.watch_later_outlined,
              color: AppColors.primaryColor,
            ),
            6.sizeW,
            Container(
              width: 1,
              height: 15,
              color: AppColors.secondaryColor,
            ),
            10.sizeW,
            Text(
              "${timeData.hour < 10 ? 0 : ""}${timeData.hour}:${timeData.minute < 10 ? 0 : ""}${timeData.minute}",
              style: AppStyle.subtext12.copyWith(
                  color: AppColors.secondaryColor,
                  fontWeight: FontWeight.w600,
                  fontSize: 16),
            )
          ],
        ),
      ),
    );
  }
}

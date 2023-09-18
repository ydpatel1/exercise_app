import 'package:exercise_app/bloc/bloc/custom_exercise_bloc.dart';
import 'package:exercise_app/config/all_config.dart';
import 'package:exercise_app/widget/app_dropdown.dart';
import 'package:exercise_app/widget/app_timepiker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../utils/dialog_utils.dart';

class SelectNewValues extends StatefulWidget {
  const SelectNewValues({
    super.key,
    required this.timeData,
    required this.index,
  });
  final TimeData timeData;
  final int index;
  @override
  State<SelectNewValues> createState() => _SelectNewValuesState();
}

class _SelectNewValuesState extends State<SelectNewValues> {
  String timezone = "Morning";
  TimeData? timeData;
  @override
  void initState() {
    timezone = getTimeZone(widget.timeData);
    super.initState();
  }

  String getTimeZone(TimeData timeData) {
    return timeData.am == "PM"
        ? ((timeData.hour > 1 && timeData.hour < 6) || timeData.hour == 12)
            ? "Afternoon"
            : "Evening"
        : "Morning";
  }

  @override
  void didUpdateWidget(covariant SelectNewValues oldWidget) {
    timeData = null;
    setState(() {});
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 0),
      decoration: BoxDecoration(
          color: AppColors.boxColor, borderRadius: BorderRadius.circular(10)),
      child: Row(
        children: [
          Text(
            "In the",
            style: AppStyle.subtext12.copyWith(
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
          15.sizeW,
          AppPopupMenuButton(
            initialValue: timezone,
            items: const ["Morning", "Afternoon", "Evening"],
            onChange: (value) {
              if (timezone != value && value == "Afternoon") {
                if (!(widget.timeData.hour > 0 && widget.timeData.hour < 6 ||
                    (widget.timeData.hour == 12))) {
                  timeData = TimeData(hour: 12, minute: 00, am: "PM");
                }
              } else if ((!(widget.timeData.hour > 5 &&
                      widget.timeData.hour < 12) &&
                  value == "Evening")) {
                timeData = TimeData(hour: 6, minute: 00, am: "PM");
              }
              timezone = value;
              if (timeData != null) {
                context.read<CustomExerciseBloc>().add(CustomExerciseAddTime(
                      timeData: timeData,
                      index: widget.index,
                    ));
              }

              setState(() {});
            },
          ),
          15.sizeW,
          Text(
            "at",
            style: AppStyle.subtext12.copyWith(
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
          15.sizeW,
          AppTimePiker(
            index: widget.index,
            timeZone: timezone,
            timeData: timeData ?? widget.timeData,
          )
        ],
      ),
    );
  }
}

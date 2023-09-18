// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:exercise_app/main.dart';
import 'package:exercise_app/screens/custom_exercise.dart';
import 'package:exercise_app/widget/all_widget.dart';

import '../config/all_config.dart';

void showCustomSanckBar(String text) {
  ScaffoldMessenger.of(navigatorKey!.currentContext!).clearSnackBars();
  ScaffoldMessenger.of(navigatorKey!.currentContext!).showSnackBar(SnackBar(
      backgroundColor: AppColors.primaryColor,
      duration: const Duration(seconds: 3),
      dismissDirection: DismissDirection.down,
      content: Center(
          child: Text(
        text,
        style: AppStyle.titlestyle.copyWith(color: Colors.white),
      ))));
}

timePikerDilog(
    BuildContext context, Function(TimeData) onChange, String selectedTime) {
  TimeData finalvalue = TimeData(hour: 12, minute: 00, am: "AM");
  List<int> hourListItems = [];
  List<int> minuteListItems = AppConst.minute;
  switch (selectedTime) {
    case "Morning":
      hourListItems = [12, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11];
      break;
    case "Afternoon":
      hourListItems = [12, 1, 2, 3, 4, 5];
      finalvalue = finalvalue.copyWith(am: "PM");
      break;
    case "Evening":
      hourListItems = [6, 7, 8, 9, 10, 11];
      finalvalue = finalvalue.copyWith(am: "PM");
      break;
    default:
  }

  showDialog(
    context: context,
    builder: (context) {
      return Center(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 16),
          padding: const EdgeInsets.symmetric(horizontal: 19, vertical: 20),
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(20)),
          child: Material(
            color: Colors.white,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: AppDropDown(
                        hintText: "Hour",
                        list: hourListItems,
                        onChange: (v) {
                          print(v);
                          finalvalue = finalvalue.copyWith(hour: v);
                        },
                      ),
                    ),
                    10.sizeW,
                    Expanded(
                      child: AppDropDown(
                        hintText: "Mimute",
                        // initialValue: 00,
                        list: minuteListItems,
                        onChange: (v) {
                          print(v);
                          finalvalue = finalvalue.copyWith(minute: v);
                        },
                      ),
                    ),
                    10.sizeW,
                    Text(finalvalue.am)
                  ],
                ),
                40.sizeH,
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: SizedBox(
                    width: double.maxFinite,
                    child: AppButton(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 40, vertical: 10),
                        onPressed: () {
                          onChange(finalvalue);
                          Navigator.pop(navigatorKey!.currentContext!);
                        },
                        title: "Continue"),
                  ),
                )
              ],
            ),
          ),
        ),
      );
    },
  );
}

class TimeData {
  final int hour;
  final int minute;
  final String am;
  TimeData({
    required this.hour,
    required this.minute,
    required this.am,
  });

  TimeData copyWith({
    int? hour,
    int? minute,
    String? am,
  }) {
    return TimeData(
      hour: hour ?? this.hour,
      minute: minute ?? this.minute,
      am: am ?? this.am,
    );
  }

  @override
  bool operator ==(covariant TimeData other) {
    if (identical(this, other)) return true;

    return other.hour == hour && other.minute == minute && other.am == am;
  }

  @override
  int get hashCode => hour.hashCode ^ minute.hashCode ^ am.hashCode;

  @override
  String toString() => 'TimeData(hour: $hour, minute: $minute, am: $am)';
}

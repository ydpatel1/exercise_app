import 'package:exercise_app/config/all_config.dart';
import 'package:exercise_app/utils/any_radio.dart/app_radio.dart';
import 'package:exercise_app/utils/any_radio.dart/radio_bloc/radio_fun_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RedioContainerButton extends StatelessWidget {
  const RedioContainerButton({
    super.key,
    required this.lebelText,
    required this.child,
    required this.index,
  });
  final String lebelText;
  final Widget child;
  final int index;
  @override
  Widget build(BuildContext context) {
    return AnyRadio(
      index: index,
      child: (isSelceted) => GestureDetector(
        onTap: () {
          context.read<RadioFunBloc>().add(RadioFunEvent(index));
        },
        child: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
              color: AppColors.boxColor,
              border: Border.all(
                  color:
                      isSelceted ? AppColors.primaryColor : Colors.transparent,
                  width: 0.5),
              borderRadius: BorderRadius.circular(10)),
          height: 118,
          child: Column(
            children: [
              Container(
                width: double.maxFinite,
                decoration: BoxDecoration(
                    color: AppColors.secondaryColor,
                    borderRadius: BorderRadius.circular(10)),
                padding: const EdgeInsets.symmetric(vertical: 7),
                child: Center(
                  child: Text(
                    lebelText,
                    overflow: TextOverflow.ellipsis,
                    style: AppStyle.subtext12.copyWith(color: Colors.white),
                  ),
                ),
              ),
              14.sizeH,
              child
            ],
          ),
        ),
      ),
    );
  }
}

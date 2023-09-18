import 'package:flutter/material.dart';

import '../config/all_config.dart';

class AppDropDown extends StatelessWidget {
  const AppDropDown({
    super.key,
    required this.hintText,
    required this.list,
    required this.onChange,
  });

  final String hintText;
  final List list;
  final Function(dynamic) onChange;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
        icon: Icon(
          Icons.keyboard_arrow_down,
          color: AppColors.secondaryColor,
        ),
        decoration: InputDecoration(
            hintText: hintText,
            hintStyle: AppStyle.subtext12.copyWith(fontSize: 13),
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 20, vertical: 13),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25),
                borderSide: BorderSide(color: AppColors.primaryColor)),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25),
                borderSide: BorderSide(color: AppColors.primaryColor))),
        items: list
            .map((e) => DropdownMenuItem(
                  value: e,
                  child: Text(
                    e.toString(),
                  ),
                ))
            .toList(),
        onChanged: (v) {
          onChange(v);
        });
  }
}

class AppPopupMenuButton extends StatefulWidget {
  const AppPopupMenuButton({
    super.key,
    this.initialValue,
    required this.items,
    this.onChange,
  });

  final dynamic initialValue;
  final List items;
  final Function(dynamic value)? onChange;

  @override
  State<AppPopupMenuButton> createState() => _AppPopupMenuButtonState();
}

class _AppPopupMenuButtonState<T> extends State<AppPopupMenuButton> {
  T? value;
  @override
  void initState() {
    value = widget.initialValue;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
        surfaceTintColor: Colors.white,
        onSelected: (v) {
          if (v != null) {
            value = v;
            widget.onChange?.call(v);
            setState(() {});
          }
        },
        itemBuilder: (context) => widget.items
            .map((e) => PopupMenuItem<T>(
                  value: e,
                  child: Text(
                    e,
                    overflow: TextOverflow.ellipsis,
                  ),
                ))
            .toList(),
        child: Container(
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(8)),
            padding: const EdgeInsets.symmetric(horizontal: 19, vertical: 9),
            child: Row(
              children: [
                Text(
                  value.toString(),
                  style: AppStyle.subtext12.copyWith(
                      overflow: TextOverflow.ellipsis,
                      color: AppColors.secondaryColor,
                      fontSize: 14),
                ),
                2.sizeW,
                const Icon(Icons.arrow_drop_down_sharp),
              ],
            )));
  }
}

import 'package:flutter/material.dart';

extension Space on num {
  SizedBox get sizeH => SizedBox(
        height: toDouble(),
      );
  SizedBox get sizeW => SizedBox(
        width: toDouble(),
      );
}

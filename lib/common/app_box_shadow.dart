import 'package:courses_eshop_app/common/utils/app_colors.dart';
import 'package:flutter/material.dart';

BoxDecoration appBoxShadow({Color color = AppColors.primaryElement, double radius = 15, double sR = 1, double bR = 2, Border? border}) {
  return BoxDecoration(
    color: color,
    borderRadius: BorderRadius.circular(radius),
    border: border,
    boxShadow: [
      BoxShadow(
        color: Colors.grey.withOpacity(0.6),
        blurRadius: bR,
        spreadRadius: sR,
        offset: const Offset(0, 1),
      ),
    ],
  );
}

BoxDecoration appBoxDecorationTextField({
  Color borderColor = AppColors.primaryFourElementText,
  Color color = AppColors.primaryBackground,
  double radius = 15,
}) {
  return BoxDecoration(
      color: color,
      borderRadius: BorderRadius.circular(radius),
      border: Border.all(
        color: borderColor,
      ));
}

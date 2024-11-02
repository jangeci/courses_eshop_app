import 'package:courses_eshop_app/common/utils/app_colors.dart';
import 'package:flutter/material.dart';

BoxDecoration appBoxShadow({
  Color color = AppColors.primaryElement,
  double radius = 15,
  double sR = 1,
  double bR = 2,
}) {
  return BoxDecoration(color: AppColors.primaryElement, borderRadius: BorderRadius.circular(radius), boxShadow: [
    BoxShadow(
      color: Colors.grey.withOpacity(0.6),
      blurRadius: bR,
      spreadRadius: sR,
      offset: const Offset(0, 1),
    ),
  ]);
}

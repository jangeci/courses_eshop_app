import 'package:courses_eshop_app/common/utils/app_colors.dart';
import 'package:flutter/material.dart';

Widget text24Normal(
  String text, {
  Color color = AppColors.primaryText,
}) {
  return Text(
    text,
    style: TextStyle(
      fontSize: 24,
      color: color,
    ),
    textAlign: TextAlign.center,
  );
}

Widget text16Normal(
  String text, {
  Color color = AppColors.primarySecondaryElementText,
}) {
  return Text(
    text,
    style: TextStyle(
      fontSize: 16,
      color: color,
    ),
    textAlign: TextAlign.center,
  );
}

import 'package:courses_eshop_app/common/utils/app_colors.dart';
import 'package:flutter/material.dart';

import '../gen/assets.gen.dart';

Widget appImage({
  String? img,
  double width = 16,
}) {
  return Image.asset(
    img ?? Assets.icons.user.path,
    width: width,
  );
}

Widget appImageWithColor({
  String? img,
  double width = 16,
  Color? color = AppColors.primaryElement,
}) {
  return Image.asset(
    img ?? Assets.icons.user.path,
    width: width,
    color: color,
  );
}

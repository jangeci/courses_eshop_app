import 'package:courses_eshop_app/common/utils/app_colors.dart';
import 'package:courses_eshop_app/widgets/common/text_widgets.dart';
import 'package:flutter/material.dart';

AppBar buildAppbar({required String title}) {
  return AppBar(
    title: text16Normal(
      title,
      color: AppColors.primaryText,
    ),
    bottom: PreferredSize(
      preferredSize: const Size.fromHeight(10),
      child: Container(
        height: 1,
        color: Colors.grey.withOpacity(0.3),
      ),
    ),
  );
}

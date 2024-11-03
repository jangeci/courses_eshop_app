import 'package:courses_eshop_app/common/app_box_shadow.dart';
import 'package:courses_eshop_app/common/utils/app_colors.dart';
import 'package:courses_eshop_app/widgets/common/text_widgets.dart';
import 'package:flutter/material.dart';

enum AppButtonVariant { primary, secondary }

Widget appButton(
  String text, {
  GestureTapCallback? onTap,
  AppButtonVariant variant = AppButtonVariant.primary,
}) {
  Color? _color = variant == AppButtonVariant.primary ? AppColors.primaryElement : Colors.white;
  Color _textColor = variant == AppButtonVariant.primary ? AppColors.primaryBackground : AppColors.primaryText;
  Border? _border = variant == AppButtonVariant.primary
      ? null
      : Border.all(
          color: Colors.grey.withOpacity(0.1),
        );
  return GestureDetector(
    onTap: onTap,
    child: Container(
      width: double.infinity,
      height: 50,
      decoration: appBoxShadow(color: _color, border: _border),
      child: Center(
        child: text16Normal(text, color: _textColor),
      ),
    ),
  );
}

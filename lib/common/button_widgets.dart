import 'package:courses_eshop_app/common/app_box_shadow.dart';
import 'package:courses_eshop_app/common/utils/app_colors.dart';
import 'package:courses_eshop_app/common/widgets/text_widgets.dart';
import 'package:flutter/material.dart';

enum AppButtonVariant { primary, secondary }

class AppButtonWidget extends StatelessWidget {
  final String text;
  final GestureTapCallback? onTap;
  final AppButtonVariant variant;

  const AppButtonWidget({
    super.key,
    required this.text,
    this.onTap,
    this.variant = AppButtonVariant.primary,
  });

  @override
  Widget build(BuildContext context) {
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
        decoration: appBoxDecoration(color: _color, boxBorder: _border),
        child: Center(
          child: Text16Normal(text, color: _textColor),
        ),
      ),
    );
  }
}

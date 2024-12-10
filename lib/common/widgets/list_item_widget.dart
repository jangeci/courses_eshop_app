import 'package:courses_eshop_app/common/image_widgets.dart';
import 'package:courses_eshop_app/common/utils/app_colors.dart';
import 'package:courses_eshop_app/common/widgets/text_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BasicListItemWidget extends StatelessWidget {
  final String text;
  final String iconPath;
  final Function()? onTap;
  final double iconSize;

  const BasicListItemWidget({
    super.key,
    required this.text,
    required this.iconPath,
    this.onTap,
    this.iconSize = 30,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 6.0.h, horizontal: 25.w),
        child: Row(
          children: [
            AppImageWidget(
              img: iconPath,
              width: iconSize,
            ),
            SizedBox(width: 16.w),
            Expanded(
              child: Text11Normal(
                text,
                color: AppColors.primarySecondaryElementText,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:courses_eshop_app/common/app_box_shadow.dart';
import 'package:courses_eshop_app/common/image_widgets.dart';
import 'package:courses_eshop_app/common/utils/app_colors.dart';
import 'package:courses_eshop_app/common/widgets/app_textfield.dart';
import 'package:courses_eshop_app/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget searchWidget() {
  return Row(
    children: [
      Expanded(
        child: Container(
          height: 40.h,
          decoration: appBoxDecoration(
            color: AppColors.primaryBackground,
            boxBorder: Border.all(
              color: AppColors.primaryFourElementText,
            ),
          ),
          child: Row(
            children: [
              SizedBox(width: 15.w),
              appImage(
                img: Assets.icons.search.path,
                width: 20.w,
              ),
              Expanded(
                child: AppTextfieldOnlyWidget(height: 40, hint: 'Search courses...'),
              ),
            ],
          ),
        ),
      ),
      SizedBox(width: 15.w),
      GestureDetector(
        onTap: () {},
        child: Container(
          width: 40.h,
          height: 40.h,
          decoration: appBoxDecoration(),
          child: Center(
            child: appImage(width: 24, img: Assets.icons.search.path),
          ),
        ),
      )
    ],
  );
}

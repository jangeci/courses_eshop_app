import 'package:courses_eshop_app/common/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

BoxDecoration appBoxDecoration({
  Color color = AppColors.primaryElement,
  double radius = 15,
  double sR = 1,
  double bR = 2,
  BoxBorder? boxBorder,
}) {
  return BoxDecoration(
    color: color,
    borderRadius: BorderRadius.circular(radius.w),
    border: boxBorder,
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

BoxDecoration appBoxShadowWithRadius({
  Color color = AppColors.primaryElement,
  double radius = 20,
  double sR = 1,
  double bR = 2,
  Border? border,
}) {
  return BoxDecoration(
    color: color,
    borderRadius: BorderRadius.only(
      topLeft: Radius.circular(radius.h),
      topRight: Radius.circular(radius.h),
    ),
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
    ),
  );
}

class AppBoxDecorationImage extends StatelessWidget {
  final double width;
  final double height;
  final String imagePath;
  final BoxFit fit;

  const AppBoxDecorationImage({
    super.key,
    this.width = 40,
    this.height = 40,
    required this.imagePath,
    this.fit = BoxFit.fitHeight,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width.w,
      height: height.w,
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: fit,
          image: NetworkImage(
            imagePath,
          ),
        ),
        borderRadius: BorderRadius.circular(
          20.w,
        ),
      ),
    );
  }
}

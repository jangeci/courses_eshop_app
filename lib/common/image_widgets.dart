import 'package:courses_eshop_app/common/utils/app_colors.dart';
import 'package:courses_eshop_app/common/utils/constants.dart';
import 'package:flutter/material.dart';

import '../gen/assets.gen.dart';

class AppImageWidget extends StatelessWidget {
  final String? img;
  final double width;

  const AppImageWidget({
    super.key,
    this.img,
    this.width = 16,
  });

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      img ?? Assets.icons.icons8Placeholder.path,
      width: width,
    );
  }
}

Widget appImageWithColor({
  String? img,
  double width = 16,
  Color? color = AppColors.primaryElement,
}) {
  return Image.asset(
    img ?? Assets.icons.icons8Placeholder.path,
    width: width,
    color: color,
  );
}

BoxDecoration networkImageDecoration({String? imagePath}) {
  return BoxDecoration(
    image: DecorationImage(
        image: NetworkImage(
          getUploadedFileUrl(imagePath ?? ''),
        ),
        fit: BoxFit.cover),
  );
}

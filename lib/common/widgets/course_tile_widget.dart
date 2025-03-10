import 'package:courses_eshop_app/common/utils/app_colors.dart';
import 'package:courses_eshop_app/common/utils/constants.dart';
import 'package:courses_eshop_app/common/widgets/text_widgets.dart';
import 'package:courses_eshop_app/features/course_detail/view/course_detail_screen.dart';
import 'package:courses_eshop_app/models/course.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CourseTileWidget extends StatelessWidget {
  final CourseItem item;
  const CourseTileWidget({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 325.w,
      height: 80.h,
      padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: const Color.fromRGBO(255, 255, 255, 1),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withValues(alpha: 0.5),
            spreadRadius: 2,
            blurRadius: 3,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: InkWell(
        onTap: () {
          Navigator.of(context).pushNamed(CourseDetailScreen.kRoute, arguments: {'id': item.id});
        },
        child: Row(
          children: [
            Row(
              children: [
                Container(
                  height: 60.h,
                  width: 60.h,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(15),
                    ),
                    image: DecorationImage(
                      fit: BoxFit.fill,
                      image: NetworkImage(
                        getUploadedFileUrl(item.thumbnail!),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 18),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 180.w,
                      child: Text13Normal(
                        item.name!,
                        color: AppColors.primaryText,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Text11Normal(
                      '${item.lesson_num ?? 0} lessons',
                      color: AppColors.primaryThirdElementText,
                    )
                  ],
                ),
                const SizedBox(width: 8),
                Text13Normal(
                  '${item.price} \$',
                  fontWeight: FontWeight.w700,
                ),
              ],
            )
          ],
        ),
      ),
    );;
  }
}

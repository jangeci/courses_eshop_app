import 'package:courses_eshop_app/common/app_box_shadow.dart';
import 'package:courses_eshop_app/common/button_widgets.dart';
import 'package:courses_eshop_app/common/image_widgets.dart';
import 'package:courses_eshop_app/common/utils/app_colors.dart';
import 'package:courses_eshop_app/common/utils/constants.dart';
import 'package:courses_eshop_app/common/widgets/list_item_widget.dart';
import 'package:courses_eshop_app/common/widgets/text_widgets.dart';
import 'package:courses_eshop_app/features/lesson_detail/view/lesson_detail_screen.dart';
import 'package:courses_eshop_app/gen/assets.gen.dart';
import 'package:courses_eshop_app/models/course.dart';
import 'package:courses_eshop_app/models/lesson_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CourseDetailThumbnailWidget extends StatelessWidget {
  final CourseItem data;

  const CourseDetailThumbnailWidget({
    super.key,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 25.w),
      child: AppBoxDecorationImage(
        imagePath: getImageUrl(data.thumbnail!),
        width: 325.w,
        height: 160.h,
        fit: BoxFit.cover,
      ),
    );
  }
}

class CourseDetailInfoRowWidget extends StatelessWidget {
  final CourseItem courseItem;

  const CourseDetailInfoRowWidget({
    super.key,
    required this.courseItem,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 325.w,
      child: Row(
        children: [
          GestureDetector(
            onTap: () {},
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 5.h),
              decoration: appBoxDecoration(radius: 7),
              child: const Text10Normal(
                'Author Page',
                color: AppColors.primaryElementText,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 30.w),
            child: Row(
              children: [
                AppImageWidget(
                  img: Assets.icons.people.path,
                ),
                const SizedBox(width: 2),
                Text11Normal(
                  courseItem.follow == null ? "0" : courseItem.follow.toString(),
                  color: AppColors.primaryThirdElementText,
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 30.w),
            child: Row(
              children: [
                AppImageWidget(
                  img: Assets.icons.star.path,
                ),
                const SizedBox(width: 2),
                Text11Normal(
                  courseItem.score == null ? "0" : courseItem.score.toString(),
                  color: AppColors.primaryThirdElementText,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class CourseDetailDescriptionWidget extends StatelessWidget {
  final CourseItem courseItem;

  const CourseDetailDescriptionWidget({
    super.key,
    required this.courseItem,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 25.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 15.h),
          Text16Normal(
            courseItem.name ?? 'No name found',
            color: AppColors.primaryText,
            textAlign: TextAlign.start,
            fontWeight: FontWeight.w700,
          ),
          SizedBox(height: 8.h),
          Text11Normal(
            courseItem.description ?? 'No description found',
            color: AppColors.primaryThirdElementText,
            textAlign: TextAlign.start,
          ),
        ],
      ),
    );
  }
}

class GoBuyButtonWidget extends StatelessWidget {
  final CourseItem courseItem;

  const GoBuyButtonWidget({
    super.key,
    required this.courseItem,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 25.w),
      child: AppButtonWidget(
        text: 'Go buy',
      ),
    );
  }
}

class CourseDetailIncludesWidget extends StatelessWidget {
  final CourseItem courseItem;

  const CourseDetailIncludesWidget({
    super.key,
    required this.courseItem,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 25.w),
            child: Text14Normal(
              'Course includes',
              color: AppColors.primaryText,
              fontWeight: FontWeight.w700,
            ),
          ),
          BasicListItemWidget(
            iconPath: Assets.icons.videoDetail.path,
            text: '${courseItem.video_len == null ? '0' : courseItem.video_len.toString()} Hours of video',
          ),
          BasicListItemWidget(
            iconPath: Assets.icons.fileDetail.path,
            text: '${courseItem.lesson_num == null ? '0' : courseItem.lesson_num.toString()} Number of files',
          ),
          BasicListItemWidget(
            iconPath: Assets.icons.downloadDetail.path,
            text: '${courseItem.lesson_num == null ? '0' : courseItem.lesson_num.toString()} Number of items to download',
          ),
        ],
      ),
    );
  }
}

class LessonInfoWidget extends StatelessWidget {
  final List<LessonModel> lessons;

  const LessonInfoWidget({
    super.key,
    required this.lessons,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20, left: 25.w, right: 25.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          lessons.isNotEmpty
              ? Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: SizedBox(
                    width: 325.w,
                    child: const Text14Normal(
                      'Lessons list',
                      fontWeight: FontWeight.w700,
                      color: AppColors.primaryText,
                    ),
                  ),
                )
              : const Text14Normal(
                  'Lessons list is empty',
                  fontWeight: FontWeight.w700,
                  color: AppColors.primaryText,
                ),
          ListView.builder(
            shrinkWrap: true,
            itemCount: lessons.length,
            itemBuilder: (context, index) {
              LessonModel lesson = lessons[index];
              return Container(
                margin: EdgeInsets.only(bottom: 20.h),
                width: 325.w,
                constraints: BoxConstraints(
                  minHeight: 80.h,
                ),
                padding: EdgeInsets.symmetric(
                  horizontal: 10.w,
                  vertical: 8.h,
                ),
                decoration: appBoxDecoration(
                  sR: 2,
                  bR: 3,
                  radius: 10,
                  color: Colors.white,
                ),
                child: InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, LessonDetailScreen.kRoute, arguments: {'id': lesson.id});
                  },
                  child: Row(
                    children: [
                      Expanded(
                        child: Row(
                          children: [
                            AppBoxDecorationImage(
                              imagePath: getImageUrl(lesson.thumbnail ?? '/default.png'),
                              width: 60.w,
                              height: 60.w,
                              fit: BoxFit.fill,
                            ),
                            SizedBox(width: 8.w),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text14Normal(
                                    lesson.name ?? '',
                                    color: AppColors.primaryText,
                                    fontWeight: FontWeight.w700,
                                  ),
                                  Text11Normal(
                                    lesson.description ?? '',
                                    color: AppColors.primaryText,
                                  ),
                                ],
                              ),
                            ),
                            AppImageWidget(
                              img: Assets.icons.arrowRight.path,
                              width: 24,
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

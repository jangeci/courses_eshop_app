import 'package:courses_eshop_app/common/app_box_shadow.dart';
import 'package:courses_eshop_app/common/image_widgets.dart';
import 'package:courses_eshop_app/common/utils/app_colors.dart';
import 'package:courses_eshop_app/common/utils/constants.dart';
import 'package:courses_eshop_app/common/widgets/text_widgets.dart';
import 'package:courses_eshop_app/features/course_detail/view/course_detail_screen.dart';
import 'package:courses_eshop_app/gen/assets.gen.dart';
import 'package:courses_eshop_app/models/course.dart';
import 'package:courses_eshop_app/models/lesson_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AuthorTextAndIcon extends StatelessWidget {
  final String iconPath;
  final String text;

  const AuthorTextAndIcon({
    super.key,
    required this.iconPath,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(width: 6.w),
        AppImageWidget(img: iconPath),
        Text11Normal(
          text,
          color: AppColors.primaryThirdElementText,
        ),
      ],
    );
  }
}

class AuthorTopSection extends StatelessWidget {
  final AuthorItem authorInfo;

  const AuthorTopSection(this.authorInfo, {super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 325.w,
      height: 185.h,
      child: Stack(
        children: [
          Container(
            width: 325.w,
            height: 160.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.h),
              image: DecorationImage(
                fit: BoxFit.fitWidth,
                image: AssetImage(
                  Assets.icons.background.path,
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            child: Container(
              margin: EdgeInsets.only(left: 30.w),
              child: Row(
                children: [
                  AppBoxDecorationImage(
                    width: 50.w,
                    height: 50.w,
                    imagePath: authorInfo.avatar == null ? '' : getUploadedFileUrl(authorInfo.avatar!),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 16.w),
                      Container(
                        margin: EdgeInsets.only(left: 6.w),
                        child: Text13Normal(authorInfo.name ?? ''),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 6.w),
                        child: Text11Normal(
                          authorInfo.job ?? 'Freelancer',
                          color: Colors.grey,
                        ),
                      ),
                      Row(
                        children: [
                          AuthorTextAndIcon(
                            text: '10',
                            iconPath: Assets.icons.people.path,
                          ),
                          AuthorTextAndIcon(
                            text: '40',
                            iconPath: Assets.icons.star.path,
                          ),
                          AuthorTextAndIcon(
                            text: '12',
                            iconPath: Assets.icons.downloadDetail.path,
                          ),
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class AuthorDescription extends StatelessWidget {
  final AuthorItem authorInfo;

  const AuthorDescription(this.authorInfo, {super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 16.h),
          Text16Normal(
            'About me',
            color: AppColors.primaryText,
            fontWeight: FontWeight.w700,
          ),
          SizedBox(height: 8.h),
          Text11Normal(
            authorInfo.description ?? '',
            color: AppColors.primaryThirdElementText,
          ),
          SizedBox(height: 16.h),
        ],
      ),
    );
  }
}

class AuthorCoursesWidget extends StatelessWidget {
  final List<CourseItem> courses;

  const AuthorCoursesWidget({
    super.key,
    required this.courses,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          courses.isNotEmpty
              ? Padding(
                  padding: EdgeInsets.only(bottom: 20, left: 25.w, right: 25.w),
                  child: SizedBox(
                    width: 325.w,
                    child: const Text14Normal(
                      'Courses list',
                      fontWeight: FontWeight.w700,
                      color: AppColors.primaryText,
                    ),
                  ),
                )
              : const Text14Normal(
                  'Courses list is empty',
                  fontWeight: FontWeight.w700,
                  color: AppColors.primaryText,
                ),
          ListView.builder(
            shrinkWrap: true,
            itemCount: courses.length,
            itemBuilder: (context, index) {
              CourseItem course = courses[index];
              return Container(
                margin: EdgeInsets.only(bottom: 20.h, left: 25.w, right: 25.w),
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
                    Navigator.pushNamed(context, CourseDetailScreen.kRoute, arguments: {'id': course.id});
                  },
                  child: Row(
                    children: [
                      Expanded(
                        child: Row(
                          children: [
                            AppBoxDecorationImage(
                              imagePath: getUploadedFileUrl(course.thumbnail ?? '/default.png'),
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
                                    course.name ?? '',
                                    color: AppColors.primaryText,
                                    fontWeight: FontWeight.w700,
                                  ),
                                  Text11Normal(
                                    '${course.lesson_num} lessons',
                                    color: AppColors.primaryText,
                                  ),
                                ],
                              ),
                            ),
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

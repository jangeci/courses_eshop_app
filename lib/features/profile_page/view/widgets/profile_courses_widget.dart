import 'package:courses_eshop_app/common/image_widgets.dart';
import 'package:courses_eshop_app/common/utils/app_colors.dart';
import 'package:courses_eshop_app/common/widgets/text_widgets.dart';
import 'package:courses_eshop_app/features/profile_page/courses_bought/courses_bought_screen.dart';
import 'package:courses_eshop_app/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileCoursesWidget extends StatelessWidget {
  const ProfileCoursesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ProfileButton(
            img: Assets.icons.profileVideo.path,
            text: 'My Courses',
            onTap: () {},
          ),
          ProfileButton(
            img: Assets.icons.profileBook.path,
            text: 'Courses Bought',
            onTap: () {
              Navigator.of(context).pushNamed(CoursesBoughtScreen.kRoute);
            },
          ),
          ProfileButton(
            img: Assets.icons.profileStar.path,
            text: '4.9',
          ),
        ],
      ),
    );
  }
}

class ProfileButton extends StatelessWidget {
  final String text;
  final String img;
  final Function()? onTap;

  const ProfileButton({
    super.key,
    required this.img,
    this.onTap,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 7.h),
        width: 100.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: AppColors.primaryElement,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withValues(alpha: 0.2),
              spreadRadius: 2,
              blurRadius: 3,
            )
          ],
        ),
        child: Column(
          children: [
            AppImageWidget(width: 20.w, height: 20.h, img: img),
            Text11Normal(
              text,
              weight: FontWeight.w700,
            ),
          ],
        ),
      ),
    );
  }
}

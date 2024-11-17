import 'package:courses_eshop_app/common/app_box_shadow.dart';
import 'package:courses_eshop_app/common/image_widgets.dart';
import 'package:courses_eshop_app/common/utils/app_colors.dart';
import 'package:courses_eshop_app/common/widgets/text_widgets.dart';
import 'package:courses_eshop_app/features/home_page/controller/home_controller.dart';
import 'package:courses_eshop_app/gen/assets.gen.dart';
import 'package:courses_eshop_app/global.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeBannerWidget extends StatelessWidget {
  final WidgetRef ref;
  final PageController controller;

  const HomeBannerWidget({
    super.key,
    required this.ref,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: 325.w,
          height: 160.h,
          child: PageView(
            controller: controller,
            onPageChanged: (index) {
              ref.read(homeScreenBannerDotsProvider.notifier).setIndex(index);
            },
            children: [
              bannerContainer(img: Assets.icons.art.path),
              bannerContainer(img: Assets.icons.image1.path),
              bannerContainer(img: Assets.icons.image2.path),
            ],
          ),
        ),
        SizedBox(height: 5.h),
        DotsIndicator(
          position: ref.watch(homeScreenBannerDotsProvider),
          onTap: (index) {
            controller.animateToPage(index, duration: kThemeAnimationDuration, curve: Curves.easeInOut);
          },
          dotsCount: 3,
          mainAxisAlignment: MainAxisAlignment.center,
          decorator: DotsDecorator(
            size: const Size.square(9),
            activeSize: const Size(24, 8),
            activeShape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
            ),
          ),
        ),
      ],
    );
  }
}

Widget bannerContainer({String? img}) {
  return Container(
    width: 325.w,
    height: 140.h,
    decoration: BoxDecoration(
      image: DecorationImage(
        fit: BoxFit.fill,
        image: AssetImage(
          img ?? '',
        ),
      ),
    ),
  );
}

class UserName extends StatelessWidget {
  const UserName({super.key});

  @override
  Widget build(BuildContext context) {
    return Text14Normal(Global.storageService.getUserProfile().name ?? '');
  }
}

class HomeAppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 7.w, right: 7.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          appImage(img: Assets.icons.menu.path, width: 18.w),
          GestureDetector(
            child: AppBoxDecorationImage(),
          )
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60);
}

class HomeMenuBarWidget extends StatelessWidget {
  const HomeMenuBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(top: 15.h),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const Expanded(
                child: Text16Normal(
                  'Choose your course',
                  color: AppColors.primaryText,
                  weight: FontWeight.w700,
                ),
              ),
              GestureDetector(
                onTap: () {},
                child: const Text10Normal(
                  'See all',
                  color: AppColors.primaryThirdElementText,
                  weight: FontWeight.w700,
                ),
              )
            ],
          ),
        ),
        SizedBox(
          height: 20.h,
        ),
        Row(
          children: [
            GestureDetector(
              child: Container(
                decoration: appBoxDecoration(
                  color: AppColors.primaryElement,
                  radius: 7.5.w,
                ),
                padding: EdgeInsets.symmetric(
                  horizontal: 15.w,
                  vertical: 5.h,
                ),
                child: Text11Normal('All'),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: 15.w,
                vertical: 5.h,
              ),
              child: Text11Normal(
                'Popular',
                color: AppColors.primaryThirdElementText,
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: 15.w,
                vertical: 5.h,
              ),
              child: Text11Normal(
                'Newest',
                color: AppColors.primaryThirdElementText,
              ),
            ),
          ],
        )
      ],
    );
  }
}

class CoursesGridWidget extends StatelessWidget {
  const CoursesGridWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GridView.builder(
        physics: ScrollPhysics(),
        shrinkWrap: true,
        itemCount: 6,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 40,
          mainAxisSpacing: 40,
        ),
        itemBuilder: (context, index) => appImage(),
      ),
    );
  }
}

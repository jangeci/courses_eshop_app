import 'package:courses_eshop_app/common/widgets/text_widgets.dart';
import 'package:courses_eshop_app/features/home/controller/home_controller.dart';
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

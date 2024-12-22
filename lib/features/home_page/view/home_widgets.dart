import 'package:courses_eshop_app/common/app_box_shadow.dart';
import 'package:courses_eshop_app/common/image_widgets.dart';
import 'package:courses_eshop_app/common/utils/app_colors.dart';
import 'package:courses_eshop_app/common/utils/constants.dart';
import 'package:courses_eshop_app/common/widgets/text_widgets.dart';
import 'package:courses_eshop_app/features/course_detail/view/course_detail_screen.dart';
import 'package:courses_eshop_app/features/home_page/controller/home_controller.dart';
import 'package:courses_eshop_app/gen/assets.gen.dart';
import 'package:courses_eshop_app/global.dart';
import 'package:courses_eshop_app/models/course.dart';
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

class HomeAppBarWidget extends ConsumerWidget implements PreferredSizeWidget {
  const HomeAppBarWidget({super.key, required WidgetRef ref});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var profileState = ref.watch(homeUserProfileProvider);

    return Container(
      margin: EdgeInsets.only(left: 7.w, right: 7.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          AppImageWidget(img: Assets.icons.menu.path, width: 18.w),
          profileState.when(
            data: (data) {
              return GestureDetector(
                child: AppBoxDecorationImage(
                  imagePath: getUploadedFileUrl(data.avatar ?? ''),
                ),
              );
            },
            error: (err, stack) {
              return AppImageWidget(img: Assets.icons.person2.path, width: 20.w);
            },
            loading: () => const SizedBox(),
          ),
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
                  fontWeight: FontWeight.w700,
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
                child: const Text11Normal('All', textAlign: TextAlign.center,),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: 15.w,
                vertical: 5.h,
              ),
              child: const Text11Normal(
                'Popular',
                color: AppColors.primaryThirdElementText,
                textAlign: TextAlign.center,
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: 15.w,
                vertical: 5.h,
              ),
              child: const Text11Normal(
                'Newest',
                color: AppColors.primaryThirdElementText,
                textAlign: TextAlign.center,
              ),
            ),
          ],
        )
      ],
    );
  }
}

class CoursesGridWidget extends StatelessWidget {
  final WidgetRef ref;

  const CoursesGridWidget({
    super.key,
    required this.ref,
  });

  @override
  Widget build(BuildContext context) {
    final courseState = ref.watch(homeCourseListProvider);

    return Padding(
      padding: EdgeInsets.symmetric(vertical: 18.h),
      child: courseState.when(
          data: (data) => GridView.builder(
                physics: const ScrollPhysics(),
                shrinkWrap: true,
                itemCount: data?.length ?? 0,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 40,
                  childAspectRatio: 1.6,
                ),
                itemBuilder: (context, index) => SingleCourseTile(
                  fit: BoxFit.cover,
                  imagePath: getUploadedFileUrl(data?[index].thumbnail ?? ''),
                  courseItem: data![index],
                ),
              ),
          error: (e, stack) {
            return const Center(
              child: Text('Error loading data'),
            );
          },
          loading: () {
            return const Center(
              child: Text('Loading'),
            );
          }),
    );
  }
}

class SingleCourseTile extends StatelessWidget {
  final double width;
  final double height;
  final String imagePath;
  final BoxFit fit;
  final CourseItem? courseItem;

  const SingleCourseTile({
    super.key,
    this.courseItem,
    this.width = 40,
    this.height = 40,
    required this.imagePath,
    this.fit = BoxFit.fitHeight,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, CourseDetailScreen.kRoute, arguments: {
          'id': courseItem!.id,
        });
      },
      child: Container(
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
        child: courseItem != null
            ? Container(
                decoration: BoxDecoration(
                  gradient: RadialGradient(
                    colors: [
                      Colors.black.withOpacity(0.9),
                      Colors.black.withOpacity(0),
                    ],
                    center: Alignment.bottomLeft,
                    radius: 1.5,
                  ),
                  borderRadius: BorderRadius.circular(
                    20.w,
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 20.w),
                      child: FadeText(courseItem!.name!),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 20.w, bottom: 16.h),
                      child: FadeText(
                        '${courseItem!.lesson_num!.toString()} Lessons',
                        color: AppColors.primaryFourElementText,
                      ),
                    ),
                  ],
                ),
              )
            : const SizedBox(),
      ),
    );
  }
}

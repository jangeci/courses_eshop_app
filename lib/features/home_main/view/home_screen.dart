import 'package:courses_eshop_app/common/app_box_shadow.dart';
import 'package:courses_eshop_app/common/services/storage.dart';
import 'package:courses_eshop_app/common/utils/app_colors.dart';
import 'package:courses_eshop_app/features/home_main/provider/bottom_nav_notifier.dart';
import 'package:courses_eshop_app/features/home_main/view/widgets/widgets.dart';
import 'package:courses_eshop_app/global.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends ConsumerWidget {
  static const kRoute = '/home';

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    int index = ref.watch(applicationNavIndexProvider);

    //TODO remove
    print('Access token: ' + Global.storageService.getUserToken());

    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          body: homePages(index: index),
          bottomNavigationBar: Container(
            width: 375.w,
            height: 58.h,
            decoration: appBoxShadowWithRadius(),
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20.h),
                topRight: Radius.circular(20.h),
              ),
              child: BottomNavigationBar(
                backgroundColor: Colors.white,
                elevation: 0,
                items: bottomNavItems,
                type: BottomNavigationBarType.fixed,
                showSelectedLabels: false,
                showUnselectedLabels: false,
                selectedItemColor: AppColors.primaryElement,
                unselectedItemColor: AppColors.primaryFourElementText,
                currentIndex: index,
                onTap: (value) {
                  ref.read(applicationNavIndexProvider.notifier).changeIndex(value);
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}

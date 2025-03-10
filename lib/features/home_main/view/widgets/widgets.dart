import 'package:courses_eshop_app/common/image_widgets.dart';
import 'package:courses_eshop_app/common/utils/app_colors.dart';
import 'package:courses_eshop_app/features/home_page/view/home_page.dart';
import 'package:courses_eshop_app/features/profile_page/view/profile_page.dart';
import 'package:courses_eshop_app/features/search_page/view/search_page.dart';
import 'package:courses_eshop_app/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

List<BottomNavigationBarItem> bottomNavItems = [
  const BottomNavigationBarItem(
    label: 'Home',
    backgroundColor: AppColors.primaryBackground,
    icon: _navIcon(),
    activeIcon: _navIcon(
      color: AppColors.primaryElement,
    ),
  ),
  BottomNavigationBarItem(
    label: 'Search',
    backgroundColor: AppColors.primaryBackground,
    icon: _navIcon(img: Assets.icons.search2.path),
    activeIcon: _navIcon(
      img: Assets.icons.search2.path,
      color: AppColors.primaryElement,
    ),
  ),
  BottomNavigationBarItem(
    label: 'Play',
    backgroundColor: AppColors.primaryBackground,
    icon: _navIcon(img: Assets.icons.playCircle1.path),
    activeIcon: _navIcon(
      img: Assets.icons.playCircle1.path,
      color: AppColors.primaryElement,
    ),
  ),
  BottomNavigationBarItem(
    label: 'Message',
    backgroundColor: AppColors.primaryBackground,
    icon: _navIcon(img: Assets.icons.messageCircle.path),
    activeIcon: _navIcon(
      img: Assets.icons.messageCircle.path,
      color: AppColors.primaryElement,
    ),
  ),
  BottomNavigationBarItem(
    label: 'Profile',
    backgroundColor: AppColors.primaryBackground,
    icon: _navIcon(img: Assets.icons.person2.path),
    activeIcon: _navIcon(
      img: Assets.icons.person2.path,
      color: AppColors.primaryElement,
    ),
  )
];

class _navIcon extends StatelessWidget {
  final double width;
  final double height;
  final String? img;
  final Color color;

  const _navIcon({
    super.key,
    this.width = 15,
    this.height = 15,
    this.img,
    this.color = AppColors.primaryFourElementText,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height.w,
      width: width.w,
      child: appImageWithColor(
        img: img ?? Assets.icons.home.path,
        color: color,
      ),
    );
  }
}

Widget homePages({int index = 0}) {
  List<Widget> screens = [
    const HomePage(),
    const SearchPage(),
    Center(
      child: AppImageWidget(img: Assets.icons.playCircle.path, width: 250),
    ),
    Center(
      child: AppImageWidget(img: Assets.icons.message.path, width: 250),
    ),
    const ProfilePage(),
  ];

  return screens[index];
}

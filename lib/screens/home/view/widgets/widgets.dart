import 'package:courses_eshop_app/common/image_widgets.dart';
import 'package:courses_eshop_app/common/utils/app_colors.dart';
import 'package:courses_eshop_app/gen/assets.gen.dart';
import 'package:courses_eshop_app/screens/home/provider/bottom_nav_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

List<BottomNavigationBarItem> bottomNavItems = [
  BottomNavigationBarItem(
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

Widget _navIcon({
  final double width = 15,
  final double height = 15,
  final String? img,
  final Color color = AppColors.primaryFourElementText,
}) {
  return SizedBox(
    height: height.w,
    width: width.w,
    child: appImageWithColor(
      img: img ?? Assets.icons.home.path,
      color: color,
    ),
  );
}

Widget homePages({int index = 0}) {
  List<Widget> screens = [
    Center(
      child: appImage(img: Assets.icons.home.path, width: 250),
    ),
    Center(
      child: appImage(img: Assets.icons.search.path, width: 250),
    ),
    Center(
      child: appImage(img: Assets.icons.playCircle.path, width: 250),
    ),
    Center(
      child: appImage(img: Assets.icons.message.path, width: 250),
    ),
    Center(
      child: appImage(img: Assets.icons.person2.path, width: 250),
    ),
  ];

  return screens[index];
}

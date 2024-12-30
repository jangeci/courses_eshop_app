import 'package:courses_eshop_app/common/image_widgets.dart';
import 'package:courses_eshop_app/common/utils/app_colors.dart';
import 'package:courses_eshop_app/common/widgets/text_widgets.dart';
import 'package:courses_eshop_app/features/profile_page/achievement/achievement_screen.dart';
import 'package:courses_eshop_app/features/profile_page/favorites/favorites_screen.dart';
import 'package:courses_eshop_app/features/payment_detail/payment_detail_screen.dart';
import 'package:courses_eshop_app/features/profile_page/reminder/reminder_screen.dart';
import 'package:courses_eshop_app/features/profile_page/settings/settings_screen.dart';
import 'package:courses_eshop_app/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileListItemsWidget extends StatelessWidget {
  const ProfileListItemsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 30.h),
      child: Column(
        children: [
          ProfileListItemWidget(
            text: 'Settings',
            icon: Assets.icons.settings.path,
            onTap: () => Navigator.of(context).pushNamed(SettingsScreen.kRoute),
          ),
          ProfileListItemWidget(
            text: 'Payment detail',
            icon: Assets.icons.creditCard.path,
            onTap: () => Navigator.of(context).pushNamed(PaymentDetailScreen.kRoute),
          ),
          ProfileListItemWidget(
            text: 'Achievement',
            icon: Assets.icons.award.path,
            onTap: () => Navigator.of(context).pushNamed(AchievementScreen.kRoute),
          ),
          ProfileListItemWidget(
            text: 'Favorites',
            icon: Assets.icons.heart1.path,
            onTap: () => Navigator.of(context).pushNamed(FavoritesScreen.kRoute),
          ),
          ProfileListItemWidget(
            text: 'Reminder',
            icon: Assets.icons.cube.path,
            onTap: () => Navigator.of(context).pushNamed(ReminderScreen.kRoute),
          ),
        ],
      ),
    );
  }
}

class ProfileListItemWidget extends StatelessWidget {
  final String icon;
  final String text;
  final Function()? onTap;

  const ProfileListItemWidget({
    super.key,
    required this.text,
    required this.icon,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: GestureDetector(
        onTap: onTap,
        child: Row(
          children: [
            Container(
              width: 40.w,
              height: 40.w,
              padding: EdgeInsets.all(7.w),
              decoration: BoxDecoration(
                color: AppColors.primaryElement,
                borderRadius: BorderRadius.circular(15),
                border: Border.all(color: AppColors.primaryElement),
              ),
              child: AppImageWidget(
                img: icon,
              ),
            ),
            const SizedBox(width: 20),
            Expanded(
              child: Text13Normal(
                text,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

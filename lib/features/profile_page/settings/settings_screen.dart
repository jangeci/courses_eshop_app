import 'package:courses_eshop_app/common/utils/constants.dart';
import 'package:courses_eshop_app/common/widgets/app_bar.dart';
import 'package:courses_eshop_app/common/widgets/text_widgets.dart';
import 'package:courses_eshop_app/features/sign_in/view/sign_in_screen.dart';
import 'package:courses_eshop_app/features/welcome/view/welcome_screen.dart';
import 'package:courses_eshop_app/gen/assets.gen.dart';
import 'package:courses_eshop_app/global.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SettingsScreen extends StatefulWidget {
  static const kRoute = '/settings';

  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget(title: 'Settings'),
      body: GestureDetector(
        onTap: () {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: const Text('Confirm logout'),
                content: const Text('Confirm logout.'),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.of(context).pop(),
                    child: const Text('Cancel'),
                  ),
                  TextButton(
                    onPressed: () {
                      Global.storageService.remove(AppConstants.STORAGE_USER_PROFILE_KEY);
                      Global.storageService.remove(AppConstants.STORAGE_USER_TOKEN_KEY);
                      Navigator.of(context).pushNamedAndRemoveUntil(SignInScreen.kRoute, (Route<dynamic> route) => false);
                    },
                    child: const Text('Confirm'),
                  )
                ],
              );
            },
          );
        },
        child: Container(
          height: 80.h,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(Assets.icons.logout.path),
              fit: BoxFit.fitHeight,
            ),
          ),
        ),
      ),
    );
  }
}

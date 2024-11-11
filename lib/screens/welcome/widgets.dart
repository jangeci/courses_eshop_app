import 'package:courses_eshop_app/common/app_box_shadow.dart';
import 'package:courses_eshop_app/common/utils/constants.dart';
import 'package:courses_eshop_app/global.dart';
import 'package:courses_eshop_app/screens/sign_in/sign_in_screen.dart';
import 'package:courses_eshop_app/widgets/common/text_widgets.dart';
import 'package:flutter/material.dart';

Widget appOnboardingPage(
  PageController controller, {
  required String title,
  required String subtitle,
  required String img,
  required int index,
  required BuildContext context,
}) {
  return Column(
    children: [
      Image.asset(
        img,
        fit: BoxFit.fitWidth,
      ),
      Container(
        margin: const EdgeInsets.only(top: 15),
        child: text24Normal(title),
      ),
      Container(
        margin: const EdgeInsets.only(top: 15),
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: text16Normal(subtitle),
      ),
      const Spacer(),
      nextButton(index, controller, context),
      const SizedBox(height: 100),
    ],
  );
}

Widget nextButton(
  int index,
  PageController controller,
  BuildContext context,
) {
  return GestureDetector(
    onTap: () {
      if (index < 3) {
        controller.animateToPage(index++, duration: kThemeAnimationDuration, curve: Curves.linear);
      } else {
        Global.storageService.setBool(AppConstants.STORAGE_DEVICE_OPEN_FIRST_KEY, true);
        Navigator.pushNamed(context, SignInScreen.kRoute);
      }
    },
    child: Container(
      width: 325,
      height: 50,
      margin: const EdgeInsets.only(top: 100, left: 25, right: 25),
      decoration: appBoxShadow(),
      child: Center(child: text16Normal(index < 3 ? 'Next' : 'Get started', color: Colors.white)),
    ),
  );
}

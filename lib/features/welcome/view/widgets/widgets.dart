import 'package:courses_eshop_app/common/app_box_shadow.dart';
import 'package:courses_eshop_app/common/utils/constants.dart';
import 'package:courses_eshop_app/features/sign_in/view/sign_in_screen.dart';
import 'package:courses_eshop_app/global.dart';
import 'package:courses_eshop_app/common/widgets/text_widgets.dart';
import 'package:flutter/material.dart';

class AppOnboardingPageWidget extends StatelessWidget {
  final PageController controller;
  final String title;
  final String subtitle;
  final String img;
  final int index;
  final BuildContext context;

  const AppOnboardingPageWidget({
    super.key,
    required this.controller,
    required this.title,
    required this.subtitle,
    required this.img,
    required this.index,
    required this.context,
  });

  @override
  Widget build(BuildContext context) {
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
        NextButton(
          index: index,
          controller: controller,
          context: context,
        ),
        const SizedBox(height: 100),
      ],
    );
  }
}

class NextButton extends StatelessWidget {
  final int index;
  final PageController controller;
  final BuildContext context;

  const NextButton({
    super.key,
    required this.controller,
    required this.context,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (index < 3) {
          controller.animateToPage(index + 1, duration: kThemeAnimationDuration, curve: Curves.linear);
        } else {
          Global.storageService.setBool(AppConstants.STORAGE_DEVICE_OPEN_FIRST_KEY, true);
          Navigator.pushNamed(context, SignInScreen.kRoute);
        }
      },
      child: Container(
        width: 325,
        height: 50,
        margin: const EdgeInsets.only(top: 100, left: 25, right: 25),
        decoration: appBoxDecoration(),
        child: Center(child: text16Normal(index < 3 ? 'Next' : 'Get started', color: Colors.white)),
      ),
    );
  }
}

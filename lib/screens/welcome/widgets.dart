import 'package:courses_eshop_app/common/app_box_shadow.dart';
import 'package:courses_eshop_app/widgets/common/text_widgets.dart';
import 'package:flutter/material.dart';

Widget appOnboardingPage(
  PageController controller, {
  required String title,
  required String subtitle,
  required String img,
  required int index,
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
      nextButton(index, controller),
    ],
  );
}

Widget nextButton(int index, PageController controller) {
  return GestureDetector(
    onTap: () {
      if (index < 3) {
        controller.animateToPage(index++, duration: const Duration(milliseconds: 300), curve: Curves.linear);
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

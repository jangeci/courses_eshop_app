import 'package:courses_eshop_app/gen/assets.gen.dart';
import 'package:flutter/material.dart';

Widget thirdPartyLogin() {
  return Container(
    margin: const EdgeInsets.only(
      left: 80,
      right: 80,
      top: 40,
      bottom: 20,
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _loginButton(icon: Assets.icons.google.path, onTap: () {}),
        _loginButton(icon: Assets.icons.apple.path, onTap: () {}),
        _loginButton(icon: Assets.icons.facebook.path, onTap: () {}),
      ],
    ),
  );
}

Widget _loginButton({required String icon, required Function onTap}) {
  return GestureDetector(
    child: SizedBox(
      width: 40,
      height: 40,
      child: Image.asset(icon),
    ),
  );
}

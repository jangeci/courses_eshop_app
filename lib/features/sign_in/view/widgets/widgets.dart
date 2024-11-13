import 'package:courses_eshop_app/gen/assets.gen.dart';
import 'package:flutter/material.dart';

class ThirdPartyLogin extends StatelessWidget {
  const ThirdPartyLogin({super.key});

  @override
  Widget build(BuildContext context) {
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
}

class _loginButton extends StatelessWidget {
  final String icon;
  final Function onTap;

  const _loginButton({
    super.key,
    required this.onTap,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: SizedBox(
        width: 40,
        height: 40,
        child: Image.asset(icon),
      ),
    );
  }
}

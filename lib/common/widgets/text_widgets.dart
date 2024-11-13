import 'package:courses_eshop_app/common/utils/app_colors.dart';
import 'package:flutter/material.dart';

class Text24Normal extends StatelessWidget {
  final String text;
  final Color color;
  final FontWeight weight;

  const Text24Normal(
    this.text, {
    super.key,
    this.color = AppColors.primaryText,
    this.weight = FontWeight.w400,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 24,
        color: color,
        fontWeight: weight,
      ),
      textAlign: TextAlign.center,
    );
  }
}

class Text16Normal extends StatelessWidget {
  final String text;
  final Color color;

  const Text16Normal(
    this.text, {
    super.key,
    this.color = AppColors.primarySecondaryElementText,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 16,
        color: color,
      ),
      textAlign: TextAlign.center,
    );
  }
}

class Text14Normal extends StatelessWidget {
  final String text;
  final Color color;

  const Text14Normal(
    this.text, {
    super.key,
    this.color = AppColors.primaryThirdElementText,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 14,
        color: color,
      ),
      textAlign: TextAlign.center,
    );
  }
}

class TextUnderline extends StatelessWidget {
  final String text;
  final GestureTapCallback? onTap;

  const TextUnderline(this.text, {super.key, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Text(
        text,
        style: const TextStyle(
          color: AppColors.primaryText,
          decoration: TextDecoration.underline,
          fontWeight: FontWeight.w500,
          fontSize: 12,
        ),
      ),
    );
  }
}

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
  final FontWeight? fontWeight;
  final TextAlign? textAlign;

  const Text16Normal(
    this.text, {
    super.key,
    this.fontWeight,
    this.color = AppColors.primarySecondaryElementText,
    this.textAlign,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 16,
        color: color,
        fontWeight: fontWeight,
      ),
      textAlign: textAlign,
    );
  }
}

class Text14Normal extends StatelessWidget {
  final String text;
  final Color color;
  final FontWeight fontWeight;
  final TextAlign? textAlign;

  const Text14Normal(
    this.text, {
    super.key,
    this.color = AppColors.primaryThirdElementText,
    this.fontWeight = FontWeight.normal,
    this.textAlign,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 14,
        color: color,
        fontWeight: fontWeight,
      ),
      textAlign: textAlign,
    );
  }
}


class Text13Normal extends StatelessWidget {
  final String text;
  final Color color;
  final FontWeight fontWeight;
  final TextAlign? textAlign;

  const Text13Normal(
      this.text, {
        super.key,
        this.color = AppColors.primaryText,
        this.fontWeight = FontWeight.normal,
        this.textAlign,
      });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 13,
        color: color,
        fontWeight: fontWeight,
      ),
      textAlign: textAlign,
    );
  }
}

class Text11Normal extends StatelessWidget {
  final String text;
  final Color color;
  final FontWeight weight;
  final TextAlign? textAlign;

  const Text11Normal(
    this.text, {
    super.key,
    this.weight = FontWeight.normal,
    this.color = AppColors.primaryElementText,
    this.textAlign,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 11,
        color: color,
        fontWeight: weight,
      ),
      textAlign: textAlign,
    );
  }
}

class Text10Normal extends StatelessWidget {
  final String text;
  final Color color;
  final FontWeight weight;

  const Text10Normal(
    this.text, {
    super.key,
    this.weight = FontWeight.normal,
    this.color = AppColors.primarySecondaryElementText,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 10,
        color: color,
        fontWeight: weight,
      ),
      textAlign: TextAlign.center,
    );
  }
}

class FadeText extends StatelessWidget {
  final String text;
  final Color color;
  final FontWeight fontWeight;
  final double fontSize;

  const FadeText(
    this.text, {
    super.key,
    this.fontWeight = FontWeight.w700,
    this.color = AppColors.primaryElementText,
    this.fontSize = 10,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      softWrap: false,
      maxLines: 1,
      overflow: TextOverflow.fade,
      style: TextStyle(
        fontSize: fontSize,
        color: color,
        fontWeight: fontWeight,
      ),
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

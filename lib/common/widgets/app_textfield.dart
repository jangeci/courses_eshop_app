import 'package:courses_eshop_app/common/app_box_shadow.dart';
import 'package:courses_eshop_app/common/image_widgets.dart';
import 'package:courses_eshop_app/common/widgets/text_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTextfieldWidget extends StatelessWidget {
  final String? text;
  final String? icon;
  final String? hint;
  final bool autoFocus;
  final bool obscureText;
  final TextEditingController? controller;
  final Function(String val)? onChanged;

  const AppTextfieldWidget({
    super.key,
    this.controller,
    this.icon,
    this.onChanged,
    this.obscureText = false,
    this.text,
    this.autoFocus = false,
    this.hint,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 25.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          text != null
              ? Padding(
                  padding: const EdgeInsets.only(bottom: 4.0),
                  child: Text14Normal(text!),
                )
              : SizedBox(),
          Container(
            decoration: appBoxDecorationTextField(),
            child: Row(
              children: [
                Container(
                  margin: EdgeInsets.only(left: 16.w),
                  child: appImage(img: icon),
                ),
                Expanded(
                  child: Container(
                    child: AppTextfieldOnlyWidget(
                      hint: hint,
                      autoFocus: autoFocus,
                      obscureText: obscureText,
                      controller: controller,
                      onChanged: onChanged,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class AppTextfieldOnlyWidget extends StatelessWidget {
  final String? hint;
  final bool autoFocus;
  final bool obscureText;
  final TextEditingController? controller;
  final Function(String val)? onChanged;
  final double? width;
  final double? height;

  const AppTextfieldOnlyWidget({
    super.key,
    this.controller,
    this.onChanged,
    this.obscureText = false,
    this.autoFocus = false,
    this.hint = 'Type in your info',
    this.width = 280,
    this.height = 40,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height!.h,
      width: width!.w,
      child: TextField(
        controller: controller,
        keyboardType: TextInputType.multiline,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.only(
            top: 20.h,
            left: 10.w,
          ),
          hintText: hint,
          border: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.transparent,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.transparent,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.transparent,
            ),
          ),
          disabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.transparent,
            ),
          ),
        ),
        onChanged: onChanged,
        autofocus: autoFocus,
        maxLines: 1,
        obscureText: obscureText,
      ),
    );
  }
}

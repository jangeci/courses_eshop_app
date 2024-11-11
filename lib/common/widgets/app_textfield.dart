import 'package:courses_eshop_app/common/app_box_shadow.dart';
import 'package:courses_eshop_app/common/image_widgets.dart';
import 'package:courses_eshop_app/widgets/common/text_widgets.dart';
import 'package:flutter/material.dart';

Widget appTextFiled({
  String? text,
  String? icon,
  String? hint,
  bool autoFocus = false,
  bool obscureText = false,
  TextEditingController? controller,
  Function(String val)? onChanged,
}) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 25),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        text != null
            ? Padding(
          padding: const EdgeInsets.only(bottom: 4.0),
          child: text14Normal(text),
        )
            : SizedBox(),
        Container(
          height: 50,
          decoration: appBoxDecorationTextField(),
          child: Row(
            children: [
              Container(
                margin: const EdgeInsets.only(left: 16),
                child: appImage(img: icon),
              ),
              Expanded(
                child: Container(
                  height: 50,
                  child: TextField(
                    controller: controller,
                    keyboardType: TextInputType.multiline,
                    decoration: InputDecoration(
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
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}

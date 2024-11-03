import 'package:courses_eshop_app/common/button_widgets.dart';
import 'package:courses_eshop_app/common/widgets/app_bar.dart';
import 'package:courses_eshop_app/common/widgets/app_textfield.dart';
import 'package:courses_eshop_app/gen/assets.gen.dart';
import 'package:courses_eshop_app/widgets/common/text_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignUpScreen extends StatelessWidget {
  static const kRoute = '/sign-up';

  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          appBar: buildAppbar(title: 'Sign Up'),
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 20),
                Center(
                  child: text14Normal('Lorem ipsum dolor sit amet'),
                ),
                SizedBox(height: 50),
                appTextFiled(
                  hint: 'User name',
                  text: 'Enter user name',
                  obscureText: true,
                ),
                appTextFiled(
                  text: 'Email',
                  hint: 'Enter email',
                  autoFocus: true,
                ),
                SizedBox(height: 20),
                appTextFiled(
                  hint: 'Password',
                  text: 'Password',
                  icon: Assets.icons.lock.path,
                  obscureText: true,
                ),
                SizedBox(height: 20),
                appTextFiled(
                  hint: 'Confirm Password',
                  text: 'Confirm Password',
                  icon: Assets.icons.lock.path,
                  obscureText: true,
                ),
                SizedBox(height: 100.h),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: appButton('Sign Up'),
                ),
                SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

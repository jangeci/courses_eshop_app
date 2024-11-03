import 'package:courses_eshop_app/common/button_widgets.dart';
import 'package:courses_eshop_app/common/widgets/app_bar.dart';
import 'package:courses_eshop_app/common/widgets/app_textfield.dart';
import 'package:courses_eshop_app/gen/assets.gen.dart';
import 'package:courses_eshop_app/screens/sign_in/widgets.dart';
import 'package:courses_eshop_app/screens/sign_up/sign_up_screen.dart';
import 'package:courses_eshop_app/widgets/common/text_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignInScreen extends StatelessWidget {
  static const kRoute = '/sign-in';

  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          appBar: buildAppbar(title: 'Login'),
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                thirdPartyLogin(),
                Center(
                  child: text14Normal('Or user your email account to login'),
                ),
                SizedBox(height: 50),
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
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: textUnderline('Forgot password'),
                ),
                SizedBox(height: 100.h),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: appButton('Login'),
                ),
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: appButton(
                    onTap: () => Navigator.pushNamed(context, SignUpScreen.kRoute),
                    'Register',
                    variant: AppButtonVariant.secondary,
                  ),
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

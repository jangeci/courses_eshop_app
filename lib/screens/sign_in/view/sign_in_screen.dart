import 'package:courses_eshop_app/common/button_widgets.dart';
import 'package:courses_eshop_app/common/global_loader/global_loader.dart';
import 'package:courses_eshop_app/common/utils/app_colors.dart';
import 'package:courses_eshop_app/common/widgets/app_bar.dart';
import 'package:courses_eshop_app/common/widgets/app_textfield.dart';
import 'package:courses_eshop_app/gen/assets.gen.dart';
import 'package:courses_eshop_app/screens/sign_in/provider/sign_in_notifier.dart';
import 'package:courses_eshop_app/screens/sign_in/controller/sign_in_controller.dart';
import 'package:courses_eshop_app/screens/sign_in/view/widgets/widgets.dart';
import 'package:courses_eshop_app/screens/sign_up/view/sign_up_screen.dart';
import 'package:courses_eshop_app/widgets/common/text_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignInScreen extends ConsumerStatefulWidget {
  static const kRoute = '/sign-in';

  const SignInScreen({super.key});

  @override
  ConsumerState<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends ConsumerState<SignInScreen> {
  late SignInController _controller;

  @override
  void initState() {
    _controller = SignInController(ref);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final signInProvider = ref.watch(signInNotifierProvider);
    final loader = ref.watch(appLoaderProvider);

    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          appBar: buildAppbar(title: 'Login'),
          body: loader
              ? const Center(
                  child: CircularProgressIndicator(
                    backgroundColor: Colors.blue,
                    color: AppColors.primaryElement,
                  ),
                )
              : SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      thirdPartyLogin(),
                      Center(
                        child: text14Normal('Or user your email account to login'),
                      ),
                      SizedBox(height: 50),
                      appTextFiled(
                        controller: _controller.emailController,
                        text: 'Email',
                        hint: 'Enter email',
                        autoFocus: true,
                        onChanged: (val) => ref.read(signInNotifierProvider.notifier).onEmailChange(val),
                      ),
                      SizedBox(height: 20),
                      appTextFiled(
                        controller: _controller.passwordController,
                        hint: 'Password',
                        text: 'Password',
                        icon: Assets.icons.lock.path,
                        obscureText: true,
                        onChanged: (val) => ref.read(signInNotifierProvider.notifier).onPasswordChange(val),
                      ),
                      SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25),
                        child: textUnderline('Forgot password'),
                      ),
                      SizedBox(height: 100.h),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25),
                        child: appButton(
                          'Login',
                          onTap: () => _controller.handleSignIn(),
                        ),
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

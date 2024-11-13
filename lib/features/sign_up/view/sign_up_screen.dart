import 'package:courses_eshop_app/common/button_widgets.dart';
import 'package:courses_eshop_app/common/global_loader/global_loader.dart';
import 'package:courses_eshop_app/common/utils/app_colors.dart';
import 'package:courses_eshop_app/common/widgets/app_bar.dart';
import 'package:courses_eshop_app/common/widgets/app_textfield.dart';
import 'package:courses_eshop_app/common/widgets/text_widgets.dart';
import 'package:courses_eshop_app/features/sign_up/controller/sign_up_controller.dart';
import 'package:courses_eshop_app/features/sign_up/provider/register_notifier.dart';
import 'package:courses_eshop_app/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignUpScreen extends ConsumerStatefulWidget {
  static const kRoute = '/sign-up';

  const SignUpScreen({super.key});

  @override
  ConsumerState<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends ConsumerState<SignUpScreen> {
  final SignUpController _controller = SignUpController();

  @override
  Widget build(BuildContext context) {
    final regProvider = ref.watch(registerNotifierProvider);
    final loader = ref.watch(appLoaderProvider);

    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          appBar: AppBarWidget(title: 'Sign Up'),
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
                      SizedBox(height: 20),
                      Center(
                        child: text14Normal('Lorem ipsum dolor sit amet'),
                      ),
                      SizedBox(height: 50),
                      AppTextfieldWidget(
                        hint: 'User name',
                        text: 'Enter user name',
                        onChanged: (val) => ref.read(registerNotifierProvider.notifier).onUserNameChange(val),
                      ),
                      AppTextfieldWidget(
                        text: 'Email',
                        hint: 'Enter email',
                        autoFocus: true,
                        onChanged: (val) => ref.read(registerNotifierProvider.notifier).onEmailChange(val),
                      ),
                      SizedBox(height: 20),
                      AppTextfieldWidget(
                        hint: 'Password',
                        text: 'Password',
                        icon: Assets.icons.lock.path,
                        obscureText: true,
                        onChanged: (val) => ref.read(registerNotifierProvider.notifier).onPasswordChange(val),
                      ),
                      SizedBox(height: 20),
                      AppTextfieldWidget(
                        hint: 'Confirm Password',
                        text: 'Confirm Password',
                        icon: Assets.icons.lock.path,
                        obscureText: true,
                        onChanged: (val) => ref.read(registerNotifierProvider.notifier).onPasswordConfirmChange(val),
                      ),
                      SizedBox(height: 100.h),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25),
                        child: AppButtonWidget(
                            text: 'Sign Up',
                            onTap: () {
                              _controller.handleSignUp(ref);
                            }),
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

import 'package:courses_eshop_app/common/global_loader/global_loader.dart';
import 'package:courses_eshop_app/common/services/app_http_client.dart';
import 'package:courses_eshop_app/common/utils/constants.dart';
import 'package:courses_eshop_app/common/widgets/popup_messages.dart';
import 'package:courses_eshop_app/features/home_main/view/home_screen.dart';
import 'package:courses_eshop_app/features/sign_in/provider/sign_in_notifier.dart';
import 'package:courses_eshop_app/features/sign_in/repo/sign_in_repo.dart';
import 'package:courses_eshop_app/global.dart';
import 'package:courses_eshop_app/main.dart';
import 'package:courses_eshop_app/models/user.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SignInController {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  void handleSignIn(WidgetRef ref) async {
    var state = ref.read(signInNotifierProvider);

    String email = state.email;
    String password = state.password;

    emailController.text = email;
    passwordController.text = password;

    if (email.isEmpty || state.email.isEmpty) {
      toastInfo('Your email is empty');
      return;
    }

    if (state.password.isEmpty || password.isEmpty) {
      toastInfo('Enter password');
      return;
    }

    ref.read(appLoaderProvider.notifier).setLoaderValue(true);

    try {
      final credential = await SignInRepo.firebaseSignIn(email, password);
      if (credential.user == null) {
        toastInfo('User not found');
      } else if (!credential.user!.emailVerified) {
        toastInfo('You must verify your email');
      }
      var user = credential.user;
      if (user != null) {
        String? displayName = user.displayName;
        String? email = user.email;
        String? id = user.uid;
        String? photoUrl = user.photoURL;

        LoginRequestEntity loginRequestEntity = LoginRequestEntity(
          avatar: photoUrl,
          email: email,
          name: displayName,
          open_id: id,
          type: 1,
        );
        asyncPostAllData(loginRequestEntity);
        print('user loged in');
      } else {
        toastInfo('login error');
      }
    } on FirebaseException catch (e) {
      if (e.code == 'user-not-found') {
        toastInfo('User doesnt exist');
      } else if (e.code == 'wrong-password') {
        toastInfo('Your password is wrong');
      } else {
        toastInfo(e.toString());
      }
    } catch (e) {
      if (kDebugMode) {
        toastInfo(e.toString());
      }
    }

    ref.read(appLoaderProvider.notifier).setLoaderValue(false);
  }

  void asyncPostAllData(LoginRequestEntity loginRequestEntity) async {
    AppHttpClient().post(Endpoints.LOGIN);
    
    try {
      Global.storageService.setString(AppConstants.STORAGE_USER_PROFILE_KEY, '');
      Global.storageService.setString(AppConstants.STORAGE_USER_TOKEN_KEY, '');

      navKey.currentState?.pushNamedAndRemoveUntil(HomeScreen.kRoute, (route) => false);
    } catch (e) {
      if (kDebugMode) {
        toastInfo(e.toString());
      }
    }
  }
}

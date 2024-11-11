import 'package:courses_eshop_app/common/global_loader/global_loader.dart';
import 'package:courses_eshop_app/common/widgets/popup_messages.dart';
import 'package:courses_eshop_app/screens/sign_up/provider/register_notifier.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SignUpController {
  final WidgetRef ref;

  SignUpController({required this.ref});

  void handleSignUp() async {
    var state = ref.read(registerNotifierProvider);
    var loadingNotifier = ref.read(appLoaderProvider.notifier);

    String name = state.userName;
    String email = state.email;
    String password = state.password;
    String confirmPassword = state.confirmPassword;

    if (name.isEmpty || state.userName.isEmpty) {
      toastInfo('Your name is empty');
      return;
    }

    if (email.isEmpty || state.email.isEmpty) {
      toastInfo('Your email is empty');
      return;
    }

    if (state.password.isEmpty || state.confirmPassword.isEmpty || password.isEmpty || confirmPassword.isEmpty) {
      toastInfo('Enter password');
      return;
    }

    if (state.password != state.confirmPassword || password != confirmPassword) {
      toastInfo('Your password did not match');
      return;
    }

    loadingNotifier.setLoaderValue(true);

    var context = Navigator.of(ref.context);
    try {
      final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);

      if (kDebugMode) {
        print(credential);
      }

      if (credential.user != null) {
        await credential.user?.sendEmailVerification();
        await credential.user?.updateDisplayName(name);
        //get server photo url
        //set server photo url
        toastInfo('An email has been sent to verify your account. Please open that email and confirm your identity.');
        context.pop();
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        toastInfo('This password is too weak');
      } else if (e.code == 'email-already-in-use') {
        toastInfo('This email address has already been registered');
      }
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
    }

    loadingNotifier.setLoaderValue(false);
  }
}

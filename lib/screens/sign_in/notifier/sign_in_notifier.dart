import 'package:courses_eshop_app/screens/sign_in/notifier/sign_in_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SignInNotifier extends StateNotifier<SignInState> {
  SignInNotifier() : super(const SignInState());

  void onEmailChange(String email) {
    state = state.copyWith(email: email);
  }

  void onPasswordChange(String pass) {
    state = state.copyWith(password: pass);
  }
}

final signInNotifierProvider = StateNotifierProvider<SignInNotifier, SignInState>((ref) => SignInNotifier());

import 'package:courses_eshop_app/features/sign_up/provider/register_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'register_notifier.g.dart';

@riverpod
class RegisterNotifier extends _$RegisterNotifier {
  @override
  RegisterState build() {
    return RegisterState();
  }

  void onUserNameChange(String name) {
    state = state.copyWith(userName: name);
  }

  void onEmailChange(String email) {
    state = state.copyWith(email: email);
  }

  void onPasswordChange(String pass) {
    state = state.copyWith(password: pass);
  }

  void onPasswordConfirmChange(String pass) {
    state = state.copyWith(confirmPassword: pass);
  }
}

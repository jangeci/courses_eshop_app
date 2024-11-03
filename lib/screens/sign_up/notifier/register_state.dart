class RegisterState {
  final String userName;
  final String email;
  final String password;
  final String confirmPassword;

  RegisterState({
    this.userName = '',
    this.email = '',
    this.password = '',
    this.confirmPassword = '',
  });

  RegisterState copyWith({
    String? userName,
    String? email,
    String? password,
    String? confirmPassword,
  }) {
    return RegisterState(
        confirmPassword: confirmPassword ?? this.confirmPassword,
        email: email ?? this.email,
        password: password ?? this.password,
        userName: userName ?? this.userName);
  }
}

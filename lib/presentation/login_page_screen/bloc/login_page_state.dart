// ignore_for_file: must_be_immutable

part of 'login_page_bloc.dart';

/// Represents the state of LoginPage in the application.
class LoginPageState extends Equatable {
  LoginPageState({
    this.emailController,
    this.passwordFloatingTextFieldController,
    this.isShowPassword = true,
    this.rememberme = false,
    this.loginPageModelObj,
  });

  TextEditingController? emailController;

  TextEditingController? passwordFloatingTextFieldController;

  LoginPageModel? loginPageModelObj;

  bool isShowPassword;

  bool rememberme;

  @override
  List<Object?> get props => [
        emailController,
        passwordFloatingTextFieldController,
        isShowPassword,
        rememberme,
        loginPageModelObj,
      ];
  LoginPageState copyWith({
    TextEditingController? emailController,
    TextEditingController? passwordFloatingTextFieldController,
    bool? isShowPassword,
    bool? rememberme,
    LoginPageModel? loginPageModelObj,
  }) {
    return LoginPageState(
      emailController: emailController ?? this.emailController,
      passwordFloatingTextFieldController:
          passwordFloatingTextFieldController ??
              this.passwordFloatingTextFieldController,
      isShowPassword: isShowPassword ?? this.isShowPassword,
      rememberme: rememberme ?? this.rememberme,
      loginPageModelObj: loginPageModelObj ?? this.loginPageModelObj,
    );
  }
}

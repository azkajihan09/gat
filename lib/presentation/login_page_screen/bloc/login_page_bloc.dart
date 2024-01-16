import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import 'package:windy_sabtami_s_application1/presentation/login_page_screen/models/login_page_model.dart';
part 'login_page_event.dart';
part 'login_page_state.dart';

/// A bloc that manages the state of a LoginPage according to the event that is dispatched to it.
class LoginPageBloc extends Bloc<LoginPageEvent, LoginPageState> {
  LoginPageBloc(LoginPageState initialState) : super(initialState) {
    on<LoginPageInitialEvent>(_onInitialize);
    on<ChangePasswordVisibilityEvent>(_changePasswordVisibility);
    on<ChangeCheckBoxEvent>(_changeCheckBox);
  }

  _changePasswordVisibility(
    ChangePasswordVisibilityEvent event,
    Emitter<LoginPageState> emit,
  ) {
    emit(state.copyWith(isShowPassword: event.value));
  }

  _changeCheckBox(
    ChangeCheckBoxEvent event,
    Emitter<LoginPageState> emit,
  ) {
    emit(state.copyWith(rememberme: event.value));
  }

  _onInitialize(
    LoginPageInitialEvent event,
    Emitter<LoginPageState> emit,
  ) async {
    emit(state.copyWith(
        emailController: TextEditingController(),
        passwordFloatingTextFieldController: TextEditingController(),
        isShowPassword: true,
        rememberme: false));
    NavigatorService.pushNamed(
      AppRoutes.forgotPasswordScreen,
    );
  }
}

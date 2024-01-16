import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import 'package:windy_sabtami_s_application1/presentation/verify_email_screen/models/verify_email_model.dart';
import 'package:sms_autofill/sms_autofill.dart';
part 'verify_email_event.dart';
part 'verify_email_state.dart';

/// A bloc that manages the state of a VerifyEmail according to the event that is dispatched to it.
class VerifyEmailBloc extends Bloc<VerifyEmailEvent, VerifyEmailState>
    with CodeAutoFill {
  VerifyEmailBloc(VerifyEmailState initialState) : super(initialState) {
    on<VerifyEmailInitialEvent>(_onInitialize);
    on<ChangeOTPEvent>(_changeOTP);
  }

  @override
  codeUpdated() {
    add(ChangeOTPEvent(code: code!));
  }

  _changeOTP(
    ChangeOTPEvent event,
    Emitter<VerifyEmailState> emit,
  ) {
    emit(
        state.copyWith(otpController: TextEditingController(text: event.code)));
  }

  _onInitialize(
    VerifyEmailInitialEvent event,
    Emitter<VerifyEmailState> emit,
  ) async {
    emit(state.copyWith(otpController: TextEditingController()));
    listenForCode();
  }
}

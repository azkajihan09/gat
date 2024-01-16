import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import 'package:windy_sabtami_s_application1/presentation/sign_up_page_screen/models/sign_up_page_model.dart';
part 'sign_up_page_event.dart';
part 'sign_up_page_state.dart';

/// A bloc that manages the state of a SignUpPage according to the event that is dispatched to it.
class SignUpPageBloc extends Bloc<SignUpPageEvent, SignUpPageState> {
  SignUpPageBloc(SignUpPageState initialState) : super(initialState) {
    on<SignUpPageInitialEvent>(_onInitialize);
    on<ChangePasswordVisibilityEvent>(_changePasswordVisibility);
    on<ChangeDropDownEvent>(_changeDropDown);
    on<ChangeDropDown1Event>(_changeDropDown1);
  }

  _changePasswordVisibility(
    ChangePasswordVisibilityEvent event,
    Emitter<SignUpPageState> emit,
  ) {
    emit(state.copyWith(isShowPassword: event.value));
  }

  _changeDropDown(
    ChangeDropDownEvent event,
    Emitter<SignUpPageState> emit,
  ) {
    emit(state.copyWith(selectedDropDownValue: event.value));
  }

  _changeDropDown1(
    ChangeDropDown1Event event,
    Emitter<SignUpPageState> emit,
  ) {
    emit(state.copyWith(selectedDropDownValue1: event.value));
  }

  List<SelectionPopupModel> fillDropdownItemList() {
    return [
      SelectionPopupModel(id: 1, title: "Item One", isSelected: true),
      SelectionPopupModel(id: 2, title: "Item Two"),
      SelectionPopupModel(id: 3, title: "Item Three")
    ];
  }

  List<SelectionPopupModel> fillDropdownItemList1() {
    return [
      SelectionPopupModel(id: 1, title: "Item One", isSelected: true),
      SelectionPopupModel(id: 2, title: "Item Two"),
      SelectionPopupModel(id: 3, title: "Item Three")
    ];
  }

  _onInitialize(
    SignUpPageInitialEvent event,
    Emitter<SignUpPageState> emit,
  ) async {
    emit(state.copyWith(
        nameController: TextEditingController(),
        emailController: TextEditingController(),
        checkmarkController: TextEditingController(),
        passwordFloatingTextFieldController: TextEditingController(),
        confirmpasswordController: TextEditingController(),
        isShowPassword: true));
    emit(state.copyWith(
        signUpPageModelObj: state.signUpPageModelObj?.copyWith(
            dropdownItemList: fillDropdownItemList(),
            dropdownItemList1: fillDropdownItemList1())));
  }
}

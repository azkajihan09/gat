// ignore_for_file: must_be_immutable

part of 'sign_up_page_bloc.dart';

/// Represents the state of SignUpPage in the application.
class SignUpPageState extends Equatable {
  SignUpPageState({
    this.nameController,
    this.emailController,
    this.checkmarkController,
    this.passwordFloatingTextFieldController,
    this.confirmpasswordController,
    this.selectedDropDownValue,
    this.selectedDropDownValue1,
    this.isShowPassword = true,
    this.signUpPageModelObj,
  });

  TextEditingController? nameController;

  TextEditingController? emailController;

  TextEditingController? checkmarkController;

  TextEditingController? passwordFloatingTextFieldController;

  TextEditingController? confirmpasswordController;

  SelectionPopupModel? selectedDropDownValue;

  SelectionPopupModel? selectedDropDownValue1;

  SignUpPageModel? signUpPageModelObj;

  bool isShowPassword;

  @override
  List<Object?> get props => [
        nameController,
        emailController,
        checkmarkController,
        passwordFloatingTextFieldController,
        confirmpasswordController,
        selectedDropDownValue,
        selectedDropDownValue1,
        isShowPassword,
        signUpPageModelObj,
      ];
  SignUpPageState copyWith({
    TextEditingController? nameController,
    TextEditingController? emailController,
    TextEditingController? checkmarkController,
    TextEditingController? passwordFloatingTextFieldController,
    TextEditingController? confirmpasswordController,
    SelectionPopupModel? selectedDropDownValue,
    SelectionPopupModel? selectedDropDownValue1,
    bool? isShowPassword,
    SignUpPageModel? signUpPageModelObj,
  }) {
    return SignUpPageState(
      nameController: nameController ?? this.nameController,
      emailController: emailController ?? this.emailController,
      checkmarkController: checkmarkController ?? this.checkmarkController,
      passwordFloatingTextFieldController:
          passwordFloatingTextFieldController ??
              this.passwordFloatingTextFieldController,
      confirmpasswordController:
          confirmpasswordController ?? this.confirmpasswordController,
      selectedDropDownValue:
          selectedDropDownValue ?? this.selectedDropDownValue,
      selectedDropDownValue1:
          selectedDropDownValue1 ?? this.selectedDropDownValue1,
      isShowPassword: isShowPassword ?? this.isShowPassword,
      signUpPageModelObj: signUpPageModelObj ?? this.signUpPageModelObj,
    );
  }
}

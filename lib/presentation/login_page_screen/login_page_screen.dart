import 'bloc/login_page_bloc.dart';
import 'models/login_page_model.dart';
import 'package:flutter/material.dart';
import 'package:windy_sabtami_s_application1/core/app_export.dart';
import 'package:windy_sabtami_s_application1/core/utils/validation_functions.dart';
import 'package:windy_sabtami_s_application1/widgets/app_bar/appbar_subtitle_one.dart';
import 'package:windy_sabtami_s_application1/widgets/app_bar/appbar_title_button.dart';
import 'package:windy_sabtami_s_application1/widgets/app_bar/custom_app_bar.dart';
import 'package:windy_sabtami_s_application1/widgets/custom_checkbox_button.dart';
import 'package:windy_sabtami_s_application1/widgets/custom_elevated_button.dart';
import 'package:windy_sabtami_s_application1/widgets/custom_floating_text_field.dart';
import 'package:windy_sabtami_s_application1/widgets/custom_text_form_field.dart';

// ignore_for_file: must_be_immutable
class LoginPageScreen extends StatelessWidget {
  LoginPageScreen({Key? key}) : super(key: key);

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  static Widget builder(BuildContext context) {
    return BlocProvider<LoginPageBloc>(
        create: (context) =>
            LoginPageBloc(LoginPageState(loginPageModelObj: LoginPageModel()))
              ..add(LoginPageInitialEvent()),
        child: LoginPageScreen());
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            appBar: _buildAppBar(context),
            body: SizedBox(
                width: SizeUtils.width,
                child: SingleChildScrollView(
                    padding: EdgeInsets.only(
                        bottom: MediaQuery.of(context).viewInsets.bottom),
                    child: Form(
                        key: _formKey,
                        child: Container(
                            width: double.maxFinite,
                            padding: EdgeInsets.symmetric(
                                horizontal: 24.h, vertical: 30.v),
                            child: Column(children: [
                              CustomImageView(
                                  imagePath: ImageConstant.imgIllustration,
                                  height: 212.adaptSize,
                                  width: 212.adaptSize),
                              SizedBox(height: 78.v),
                              _buildInputFieldColumn(context),
                              SizedBox(height: 23.v),
                              _buildPasswordFloatingTextField(context),
                              SizedBox(height: 23.v),
                              _buildRememberMeRow(context),
                              SizedBox(height: 23.v),
                              _buildLoginButton(context),
                              SizedBox(height: 5.v)
                            ]))))),
            bottomNavigationBar: _buildFrameTwoRow(context)));
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
        height: 56.v,
        title: Padding(
            padding: EdgeInsets.only(left: 24.h),
            child: Row(children: [
              AppbarTitleButton(),
              AppbarSubtitleOne(
                  text: "lbl_sign_up".tr,
                  margin: EdgeInsets.only(left: 19.h, top: 9.v, bottom: 6.v),
                  onTap: () {
                    onTapSignUp(context);
                  })
            ])));
  }

  /// Section Widget
  Widget _buildEmail(BuildContext context) {
    return BlocSelector<LoginPageBloc, LoginPageState, TextEditingController?>(
        selector: (state) => state.emailController,
        builder: (context, emailController) {
          return CustomTextFormField(
              controller: emailController,
              hintText: "lbl_xyz_gmail_com".tr,
              textInputType: TextInputType.emailAddress,
              suffix: Container(
                  margin: EdgeInsets.only(left: 30.h, top: 3.v, bottom: 10.v),
                  child: CustomImageView(
                      imagePath: ImageConstant.imgCheckmark,
                      height: 13.adaptSize,
                      width: 13.adaptSize)),
              suffixConstraints: BoxConstraints(maxHeight: 26.v),
              validator: (value) {
                if (value == null || (!isValidEmail(value, isRequired: true))) {
                  return "err_msg_please_enter_valid_email".tr;
                }
                return null;
              },
              borderDecoration: TextFormFieldStyleHelper.underLineGray);
        });
  }

  /// Section Widget
  Widget _buildInputFieldColumn(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text("lbl_email".tr,
          style: CustomTextStyles.titleMediumSecondaryContainer_1),
      SizedBox(height: 1.v),
      _buildEmail(context)
    ]);
  }

  /// Section Widget
  Widget _buildPasswordFloatingTextField(BuildContext context) {
    return BlocBuilder<LoginPageBloc, LoginPageState>(
        builder: (context, state) {
      return CustomFloatingTextField(
          controller: state.passwordFloatingTextFieldController,
          labelText: "lbl_password".tr,
          labelStyle: theme.textTheme.bodyMedium!,
          hintText: "lbl_password".tr,
          textInputAction: TextInputAction.done,
          textInputType: TextInputType.visiblePassword,
          obscureText: state.isShowPassword,
          suffix: InkWell(
              onTap: () {
                context.read<LoginPageBloc>().add(ChangePasswordVisibilityEvent(
                    value: !state.isShowPassword));
              },
              child: SizedBox(
                  child: CustomImageView(
                      imagePath: ImageConstant.imgCheckmark,
                      height: 13.adaptSize,
                      width: 13.adaptSize))),
          suffixConstraints: BoxConstraints(maxHeight: 51.v),
          validator: (value) {
            if (value == null || (!isValidPassword(value, isRequired: true))) {
              return "err_msg_please_enter_valid_password".tr;
            }
            return null;
          });
    });
  }

  /// Section Widget
  Widget _buildRememberMeRow(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Padding(
          padding: EdgeInsets.only(bottom: 1.v),
          child: BlocSelector<LoginPageBloc, LoginPageState, bool?>(
              selector: (state) => state.rememberme,
              builder: (context, rememberme) {
                return CustomCheckboxButton(
                    text: "lbl_remember_me".tr,
                    value: rememberme,
                    onChange: (value) {
                      context
                          .read<LoginPageBloc>()
                          .add(ChangeCheckBoxEvent(value: value));
                    });
              })),
      GestureDetector(
          onTap: () {
            onTapTxtRemeberMeForget(context);
          },
          child: Text("msg_forget_password".tr,
              style: CustomTextStyles.labelLargePrimary))
    ]);
  }

  /// Section Widget
  Widget _buildLoginButton(BuildContext context) {
    return CustomElevatedButton(
        text: "lbl_login".tr,
        onPressed: () {
          onTapLoginButton(context);
        });
  }

  /// Section Widget
  Widget _buildFrameTwoRow(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: 58.h, right: 58.h, bottom: 30.v),
        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Padding(
              padding: EdgeInsets.only(bottom: 1.v),
              child: Text("msg_don_t_have_an_account".tr,
                  style: CustomTextStyles.titleMediumGray500)),
          GestureDetector(
              onTap: () {
                onTapTxtAlreadyHaveAn(context);
              },
              child: Padding(
                  padding: EdgeInsets.only(left: 5.h),
                  child: Text("lbl_sign_up".tr,
                      style: CustomTextStyles.titleMediumPrimary)))
        ]));
  }

  /// Navigates to the signUpPageScreen when the action is triggered.
  onTapSignUp(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.signUpPageScreen,
    );
  }

  /// Navigates to the forgotPasswordScreen when the action is triggered.
  onTapTxtRemeberMeForget(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.forgotPasswordScreen,
    );
  }

  /// Navigates to the minePageContainerScreen when the action is triggered.
  onTapLoginButton(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.minePageContainerScreen,
    );
  }

  /// Navigates to the signUpPageScreen when the action is triggered.
  onTapTxtAlreadyHaveAn(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.signUpPageScreen,
    );
  }
}

import 'bloc/sign_up_page_bloc.dart';
import 'models/sign_up_page_model.dart';
import 'package:flutter/material.dart';
import 'package:windy_sabtami_s_application1/core/app_export.dart';
import 'package:windy_sabtami_s_application1/core/utils/validation_functions.dart';
import 'package:windy_sabtami_s_application1/widgets/app_bar/appbar_subtitle_one.dart';
import 'package:windy_sabtami_s_application1/widgets/app_bar/appbar_title_button_one.dart';
import 'package:windy_sabtami_s_application1/widgets/app_bar/custom_app_bar.dart';
import 'package:windy_sabtami_s_application1/widgets/custom_drop_down.dart';
import 'package:windy_sabtami_s_application1/widgets/custom_elevated_button.dart';
import 'package:windy_sabtami_s_application1/widgets/custom_floating_text_field.dart';
import 'package:windy_sabtami_s_application1/widgets/custom_text_form_field.dart';

// ignore_for_file: must_be_immutable
class SignUpPageScreen extends StatelessWidget {
  SignUpPageScreen({Key? key}) : super(key: key);

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  static Widget builder(BuildContext context) {
    return BlocProvider<SignUpPageBloc>(
        create: (context) => SignUpPageBloc(
            SignUpPageState(signUpPageModelObj: SignUpPageModel()))
          ..add(SignUpPageInitialEvent()),
        child: SignUpPageScreen());
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            appBar: _buildAppBar(context),
            body: Center(
                child: SingleChildScrollView(
                    padding: EdgeInsets.only(
                        bottom: MediaQuery.of(context).viewInsets.bottom),
                    child: Form(
                        key: _formKey,
                        child: Container(
                            width: double.maxFinite,
                            padding: EdgeInsets.symmetric(horizontal: 24.h),
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  _buildNameInputField(context),
                                  SizedBox(height: 22.v),
                                  _buildEmailInputField(context),
                                  SizedBox(height: 23.v),
                                  _buildPhoneInputField(context),
                                  SizedBox(height: 23.v),
                                  _buildPasswordFloatingTextField(context),
                                  SizedBox(height: 22.v),
                                  _buildConfirmPasswordInputField(context),
                                  SizedBox(height: 22.v),
                                  _buildDateRow(context),
                                  SizedBox(height: 23.v),
                                  _buildSignUpButton(context),
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
              AppbarSubtitleOne(
                  text: "lbl_login".tr,
                  margin: EdgeInsets.only(top: 9.v, bottom: 6.v),
                  onTap: () {
                    onTapLogin(context);
                  }),
              AppbarTitleButtonOne(margin: EdgeInsets.only(left: 18.h))
            ])));
  }

  /// Section Widget
  Widget _buildName(BuildContext context) {
    return BlocSelector<SignUpPageBloc, SignUpPageState,
            TextEditingController?>(
        selector: (state) => state.nameController,
        builder: (context, nameController) {
          return CustomTextFormField(
              controller: nameController,
              hintText: "msg_dmitry_ponomarev".tr,
              suffix: Container(
                  margin: EdgeInsets.only(left: 30.h, top: 4.v, bottom: 10.v),
                  child: CustomImageView(
                      imagePath: ImageConstant.imgCheckmark,
                      height: 13.adaptSize,
                      width: 13.adaptSize)),
              suffixConstraints: BoxConstraints(maxHeight: 27.v),
              borderDecoration: TextFormFieldStyleHelper.underLineGray);
        });
  }

  /// Section Widget
  Widget _buildNameInputField(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text("lbl_name".tr,
          style: CustomTextStyles.titleMediumSecondaryContainer_1),
      _buildName(context)
    ]);
  }

  /// Section Widget
  Widget _buildEmail(BuildContext context) {
    return BlocSelector<SignUpPageBloc, SignUpPageState,
            TextEditingController?>(
        selector: (state) => state.emailController,
        builder: (context, emailController) {
          return CustomTextFormField(
              controller: emailController,
              hintText: "lbl_xyz_gmail_com".tr,
              textInputType: TextInputType.emailAddress,
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
  Widget _buildEmailInputField(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text("lbl_email".tr,
          style: CustomTextStyles.titleMediumSecondaryContainer_1),
      SizedBox(height: 1.v),
      _buildEmail(context)
    ]);
  }

  /// Section Widget
  Widget _buildCheckmark(BuildContext context) {
    return BlocSelector<SignUpPageBloc, SignUpPageState,
            TextEditingController?>(
        selector: (state) => state.checkmarkController,
        builder: (context, checkmarkController) {
          return CustomTextFormField(
              width: 326.h,
              controller: checkmarkController,
              hintText: "lbl_1_123_456_7890".tr,
              alignment: Alignment.bottomCenter,
              suffix: Container(
                  margin: EdgeInsets.only(left: 30.h, top: 5.v, bottom: 10.v),
                  child: CustomImageView(
                      imagePath: ImageConstant.imgCheckmark,
                      height: 13.adaptSize,
                      width: 13.adaptSize)),
              suffixConstraints: BoxConstraints(maxHeight: 28.v),
              borderDecoration: TextFormFieldStyleHelper.underLineGray);
        });
  }

  /// Section Widget
  Widget _buildPhoneInputField(BuildContext context) {
    return SizedBox(
        height: 51.v,
        width: 327.h,
        child: Stack(alignment: Alignment.topLeft, children: [
          _buildCheckmark(context),
          Align(
              alignment: Alignment.topLeft,
              child: Text("lbl_phone".tr,
                  style: CustomTextStyles.titleMediumSecondaryContainer_1))
        ]));
  }

  /// Section Widget
  Widget _buildPasswordFloatingTextField(BuildContext context) {
    return BlocBuilder<SignUpPageBloc, SignUpPageState>(
        builder: (context, state) {
      return CustomFloatingTextField(
          controller: state.passwordFloatingTextFieldController,
          labelText: "lbl_password".tr,
          labelStyle: theme.textTheme.bodyMedium!,
          hintText: "lbl_password".tr,
          textInputType: TextInputType.visiblePassword,
          obscureText: state.isShowPassword,
          suffix: InkWell(
              onTap: () {
                context.read<SignUpPageBloc>().add(
                    ChangePasswordVisibilityEvent(
                        value: !state.isShowPassword));
              },
              child: SizedBox(
                  child: CustomImageView(
                      imagePath: ImageConstant.imgContrast,
                      height: 10.v,
                      width: 16.h))),
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
  Widget _buildConfirmpassword(BuildContext context) {
    return BlocSelector<SignUpPageBloc, SignUpPageState,
            TextEditingController?>(
        selector: (state) => state.confirmpasswordController,
        builder: (context, confirmpasswordController) {
          return CustomTextFormField(
              controller: confirmpasswordController,
              hintText: "lbl_xyz123".tr,
              textInputAction: TextInputAction.done,
              suffix: Container(
                  margin: EdgeInsets.only(left: 30.h, top: 3.v, bottom: 12.v),
                  child: CustomImageView(
                      imagePath: ImageConstant.imgContrast,
                      height: 10.v,
                      width: 16.h)),
              suffixConstraints: BoxConstraints(maxHeight: 26.v),
              borderDecoration: TextFormFieldStyleHelper.underLineGray);
        });
  }

  /// Section Widget
  Widget _buildConfirmPasswordInputField(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text("msg_confirm_password".tr,
          style: CustomTextStyles.titleMediumSecondaryContainer_1),
      SizedBox(height: 1.v),
      _buildConfirmpassword(context)
    ]);
  }

  /// Section Widget
  Widget _buildDateRow(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      SizedBox(
          height: 52.v,
          width: 155.h,
          child: Stack(alignment: Alignment.topLeft, children: [
            BlocSelector<SignUpPageBloc, SignUpPageState, SignUpPageModel?>(
                selector: (state) => state.signUpPageModelObj,
                builder: (context, signUpPageModelObj) {
                  return CustomDropDown(
                      width: 153.h,
                      hintText: "lbl_20_jan_1998".tr,
                      alignment: Alignment.bottomCenter,
                      items: signUpPageModelObj?.dropdownItemList ?? [],
                      onChanged: (value) {
                        context
                            .read<SignUpPageBloc>()
                            .add(ChangeDropDownEvent(value: value));
                      });
                }),
            Align(
                alignment: Alignment.topLeft,
                child: Text("lbl_date_of_birth".tr,
                    style: CustomTextStyles.titleMediumSecondaryContainer_1))
          ])),
      Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text("lbl_country_region".tr,
            style: CustomTextStyles.titleMediumSecondaryContainer_1),
        BlocSelector<SignUpPageBloc, SignUpPageState, SignUpPageModel?>(
            selector: (state) => state.signUpPageModelObj,
            builder: (context, signUpPageModelObj) {
              return CustomDropDown(
                  width: 156.h,
                  hintText: "lbl_united_states".tr,
                  items: signUpPageModelObj?.dropdownItemList1 ?? [],
                  onChanged: (value) {
                    context
                        .read<SignUpPageBloc>()
                        .add(ChangeDropDown1Event(value: value));
                  });
            })
      ])
    ]);
  }

  /// Section Widget
  Widget _buildSignUpButton(BuildContext context) {
    return CustomElevatedButton(
        text: "lbl_sign_up".tr,
        onPressed: () {
          onTapSignUpButton(context);
        });
  }

  /// Section Widget
  Widget _buildFrameTwoRow(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: 51.h, right: 51.h, bottom: 29.v),
        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text("msg_already_have_an".tr,
              style: CustomTextStyles.titleMediumGray500),
          Padding(
              padding: EdgeInsets.only(left: 5.h),
              child: Text("lbl_sign_in".tr,
                  style: CustomTextStyles.titleMediumPrimary))
        ]));
  }

  /// Navigates to the loginPageScreen when the action is triggered.
  onTapLogin(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.loginPageScreen,
    );
  }

  /// Navigates to the countryOrRegionScreen when the action is triggered.
  onTapSignUpButton(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.countryOrRegionScreen,
    );
  }
}

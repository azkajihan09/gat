import 'bloc/verify_email_bloc.dart';
import 'models/verify_email_model.dart';
import 'package:flutter/material.dart';
import 'package:windy_sabtami_s_application1/core/app_export.dart';
import 'package:windy_sabtami_s_application1/widgets/app_bar/appbar_leading_iconbutton.dart';
import 'package:windy_sabtami_s_application1/widgets/app_bar/appbar_trailing_iconbutton.dart';
import 'package:windy_sabtami_s_application1/widgets/app_bar/custom_app_bar.dart';
import 'package:windy_sabtami_s_application1/widgets/custom_elevated_button.dart';
import 'package:windy_sabtami_s_application1/widgets/custom_pin_code_text_field.dart';

class VerifyEmailScreen extends StatelessWidget {
  const VerifyEmailScreen({Key? key}) : super(key: key);

  static Widget builder(BuildContext context) {
    return BlocProvider<VerifyEmailBloc>(
        create: (context) => VerifyEmailBloc(
            VerifyEmailState(verifyEmailModelObj: VerifyEmailModel()))
          ..add(VerifyEmailInitialEvent()),
        child: VerifyEmailScreen());
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            appBar: _buildAppBar(context),
            body: Container(
                width: double.maxFinite,
                padding: EdgeInsets.only(left: 24.h, top: 86.v, right: 24.h),
                child: Column(children: [
                  CustomImageView(
                      imagePath: ImageConstant.imgGroup204,
                      height: 154.v,
                      width: 280.h),
                  SizedBox(height: 69.v),
                  Text("msg_verify_your_email".tr,
                      style: CustomTextStyles.titleLargeSemiBold_1),
                  SizedBox(height: 18.v),
                  SizedBox(
                      width: 226.h,
                      child: RichText(
                          text: TextSpan(children: [
                            TextSpan(
                                text: "msg_please_enter_4_digit2".tr,
                                style: CustomTextStyles.titleSmallff9494a2),
                            TextSpan(
                                text: "lbl_xyz_gmail_com".tr,
                                style: CustomTextStyles.titleSmallff8982ff)
                          ]),
                          textAlign: TextAlign.center)),
                  SizedBox(height: 25.v),
                  Padding(
                      padding: EdgeInsets.only(left: 48.h, right: 49.h),
                      child: BlocSelector<VerifyEmailBloc, VerifyEmailState,
                              TextEditingController?>(
                          selector: (state) => state.otpController,
                          builder: (context, otpController) {
                            return CustomPinCodeTextField(
                                context: context,
                                controller: otpController,
                                onChanged: (value) {
                                  otpController?.text = value;
                                });
                          })),
                  SizedBox(height: 14.v),
                  Text("lbl_resend_code".tr,
                      style: CustomTextStyles.bodyMediumPrimary),
                  SizedBox(width: 92.h, child: Divider()),
                  SizedBox(height: 19.v),
                  CustomElevatedButton(
                      text: "lbl_verify_code".tr,
                      onPressed: () {
                        onTapVerifyCode(context);
                      }),
                  SizedBox(height: 5.v)
                ]))));
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
        leadingWidth: 59.h,
        leading: AppbarLeadingIconbutton(
            imagePath: ImageConstant.imgArrowLeftBlack900,
            margin: EdgeInsets.only(left: 24.h, top: 8.v, bottom: 7.v),
            onTap: () {
              onTapArrowLeft(context);
            }),
        actions: [
          AppbarTrailingIconbutton(
              imagePath: ImageConstant.imgUser,
              margin: EdgeInsets.fromLTRB(24.h, 7.v, 24.h, 8.v))
        ]);
  }

  /// Navigates to the previous screen.
  onTapArrowLeft(BuildContext context) {
    NavigatorService.goBack();
  }

  /// Navigates to the minePageContainerScreen when the action is triggered.
  onTapVerifyCode(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.minePageContainerScreen,
    );
  }
}

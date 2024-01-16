import 'bloc/profile_bloc.dart';
import 'models/profile_model.dart';
import 'package:flutter/material.dart';
import 'package:windy_sabtami_s_application1/core/app_export.dart';
import 'package:windy_sabtami_s_application1/widgets/app_bar/appbar_subtitle.dart';
import 'package:windy_sabtami_s_application1/widgets/app_bar/appbar_trailing_iconbutton.dart';
import 'package:windy_sabtami_s_application1/widgets/app_bar/custom_app_bar.dart';
import 'package:windy_sabtami_s_application1/widgets/custom_elevated_button.dart';
import 'package:windy_sabtami_s_application1/widgets/custom_icon_button.dart';
import 'package:windy_sabtami_s_application1/widgets/custom_switch.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  static Widget builder(BuildContext context) {
    return BlocProvider<ProfileBloc>(
        create: (context) =>
            ProfileBloc(ProfileState(profileModelObj: ProfileModel()))
              ..add(ProfileInitialEvent()),
        child: ProfilePage());
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: _buildAppBar(context),
            body: Container(
                width: double.maxFinite,
                padding: EdgeInsets.symmetric(horizontal: 24.h, vertical: 12.v),
                child: Column(children: [
                  SizedBox(height: 13.v),
                  Padding(
                      padding: EdgeInsets.symmetric(horizontal: 33.h),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                                height: 80.adaptSize,
                                width: 80.adaptSize,
                                child: Stack(
                                    alignment: Alignment.center,
                                    children: [
                                      CustomImageView(
                                          imagePath:
                                              ImageConstant.imgEllipse314,
                                          height: 70.adaptSize,
                                          width: 70.adaptSize,
                                          radius: BorderRadius.circular(35.h),
                                          alignment: Alignment.center),
                                      Align(
                                          alignment: Alignment.center,
                                          child: SizedBox(
                                              height: 80.adaptSize,
                                              width: 80.adaptSize,
                                              child: CircularProgressIndicator(
                                                  value: 0.5)))
                                    ])),
                            Padding(
                                padding: EdgeInsets.only(
                                    left: 15.h, top: 18.v, bottom: 18.v),
                                child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text("lbl_alex_dordan".tr,
                                          style:
                                              CustomTextStyles.titleMedium18),
                                      SizedBox(height: 1.v),
                                      Text("lbl_web_developer".tr,
                                          style: theme.textTheme.labelMedium)
                                    ])),
                            Padding(
                                padding: EdgeInsets.only(
                                    left: 26.h, top: 25.v, bottom: 25.v),
                                child: CustomIconButton(
                                    height: 30.adaptSize,
                                    width: 30.adaptSize,
                                    child: CustomImageView(
                                        imagePath:
                                            ImageConstant.imgCloseIndigo50)))
                          ])),
                  SizedBox(height: 24.v),
                  Padding(
                      padding: EdgeInsets.only(right: 1.h),
                      child: _buildPersonalInfo(context,
                          floatingIconImage: ImageConstant.imgFacebookIndigo50,
                          personalInfoText: "lbl_settings".tr,
                          onTapPersonalInfo: () {
                        onTapPersonalInfo(context);
                      })),
                  SizedBox(height: 20.v),
                  Padding(
                      padding: EdgeInsets.only(right: 1.h),
                      child: _buildPersonalInfo(context,
                          floatingIconImage:
                              ImageConstant.imgFloatingIconIndigo50,
                          personalInfoText: "lbl_personal_info".tr)),
                  SizedBox(height: 20.v),
                  _buildProfile(context),
                  SizedBox(height: 20.v),
                  Padding(
                      padding: EdgeInsets.only(right: 1.h),
                      child: _buildPersonalInfo(context,
                          floatingIconImage:
                              ImageConstant.imgFloatingIconIndigo5040x40,
                          personalInfoText: "lbl_billing_details".tr)),
                  SizedBox(height: 20.v),
                  Padding(
                      padding: EdgeInsets.only(right: 1.h),
                      child: _buildPersonalInfo(context,
                          floatingIconImage: ImageConstant.imgFloatingIcon40x40,
                          personalInfoText: "lbl_transfer_funds".tr)),
                  SizedBox(height: 20.v),
                  Divider(color: appTheme.gray200),
                  SizedBox(height: 19.v),
                  Padding(
                      padding: EdgeInsets.only(right: 1.h),
                      child: _buildPersonalInfo(context,
                          floatingIconImage: ImageConstant.imgSettingsIndigo50,
                          personalInfoText: "msg_privacy_settings".tr)),
                  SizedBox(height: 20.v),
                  Padding(
                      padding: EdgeInsets.only(right: 1.h),
                      child: _buildPersonalInfo(context,
                          floatingIconImage:
                              ImageConstant.imgSettingsIndigo5040x40,
                          personalInfoText: "lbl_community".tr)),
                  SizedBox(height: 24.v),
                  CustomElevatedButton(
                      text: "lbl_log_out".tr,
                      leftIcon: Container(
                          margin: EdgeInsets.only(right: 15.h),
                          child: CustomImageView(
                              imagePath: ImageConstant.imgTelevision,
                              height: 15.adaptSize,
                              width: 15.adaptSize)))
                ]))));
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
        height: 49.v,
        centerTitle: true,
        title: AppbarSubtitle(text: "lbl_profile".tr),
        actions: [
          AppbarTrailingIconbutton(
              imagePath: ImageConstant.imgUSetting,
              margin: EdgeInsets.symmetric(horizontal: 24.h, vertical: 7.v))
        ]);
  }

  /// Section Widget
  Widget _buildProfile(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      CustomImageView(
          imagePath: ImageConstant.imgProfile,
          height: 40.adaptSize,
          width: 40.adaptSize),
      Padding(
          padding: EdgeInsets.only(left: 16.h, top: 7.v, bottom: 8.v),
          child:
              Text("lbl_notification".tr, style: theme.textTheme.titleMedium)),
      Spacer(),
      BlocSelector<ProfileBloc, ProfileState, bool?>(
          selector: (state) => state.isSelectedSwitch,
          builder: (context, isSelectedSwitch) {
            return CustomSwitch(
                margin: EdgeInsets.symmetric(vertical: 13.v),
                value: isSelectedSwitch,
                onChange: (value) {
                  context
                      .read<ProfileBloc>()
                      .add(ChangeSwitchEvent(value: value));
                });
          })
    ]);
  }

  /// Common widget
  Widget _buildPersonalInfo(
    BuildContext context, {
    required String floatingIconImage,
    required String personalInfoText,
    Function? onTapPersonalInfo,
  }) {
    return GestureDetector(
        onTap: () {
          onTapPersonalInfo!.call();
        },
        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          CustomImageView(
              imagePath: floatingIconImage,
              height: 40.adaptSize,
              width: 40.adaptSize),
          Padding(
              padding: EdgeInsets.only(left: 16.h, top: 7.v, bottom: 8.v),
              child: Text(personalInfoText,
                  style: theme.textTheme.titleMedium!
                      .copyWith(color: appTheme.black900))),
          Spacer(),
          CustomImageView(
              imagePath: ImageConstant.imgArrowRight,
              height: 8.v,
              width: 4.h,
              margin: EdgeInsets.symmetric(vertical: 16.v))
        ]));
  }

  /// Navigates to the settingsScreen when the action is triggered.
  onTapPersonalInfo(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.settingsScreen,
    );
  }
}

import 'bloc/settings_bloc.dart';
import 'models/settings_model.dart';
import 'package:flutter/material.dart';
import 'package:windy_sabtami_s_application1/core/app_export.dart';
import 'package:windy_sabtami_s_application1/widgets/app_bar/appbar_leading_iconbutton.dart';
import 'package:windy_sabtami_s_application1/widgets/app_bar/appbar_subtitle.dart';
import 'package:windy_sabtami_s_application1/widgets/app_bar/appbar_trailing_iconbutton_one.dart';
import 'package:windy_sabtami_s_application1/widgets/app_bar/custom_app_bar.dart';
import 'package:windy_sabtami_s_application1/widgets/custom_switch.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  static Widget builder(BuildContext context) {
    return BlocProvider<SettingsBloc>(
        create: (context) =>
            SettingsBloc(SettingsState(settingsModelObj: SettingsModel()))
              ..add(SettingsInitialEvent()),
        child: SettingsScreen());
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: _buildAppBar(context),
            body: Container(
                width: double.maxFinite,
                padding: EdgeInsets.all(24.h),
                child: Column(children: [
                  SizedBox(
                      height: 92.v,
                      width: 80.h,
                      child:
                          Stack(alignment: Alignment.bottomCenter, children: [
                        Align(
                            alignment: Alignment.topCenter,
                            child: SizedBox(
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
                                    ]))),
                        CustomImageView(
                            imagePath: ImageConstant.imgClosePrimary,
                            height: 25.adaptSize,
                            width: 25.adaptSize,
                            alignment: Alignment.bottomCenter)
                      ])),
                  SizedBox(height: 7.v),
                  Text("lbl_alex_dordan".tr,
                      style: CustomTextStyles.titleMedium18),
                  SizedBox(height: 1.v),
                  Text("lbl_web_developer".tr,
                      style: theme.textTheme.labelMedium),
                  SizedBox(height: 9.v),
                  _buildFrameRow2(context,
                      checkmark: ImageConstant.imgSettings40x40,
                      inviteText: "lbl_change_password".tr),
                  SizedBox(height: 20.v),
                  _buildFrameRow1(context),
                  SizedBox(height: 20.v),
                  _buildFrameRow2(context,
                      checkmark: ImageConstant.imgCheckmarkIndigo5040x40,
                      inviteText: "msg_invite_friends".tr),
                  SizedBox(height: 20.v),
                  _buildFrameRow2(context,
                      checkmark: ImageConstant.imgUserIndigo5040x40,
                      inviteText: "msg_privacy_policy".tr),
                  SizedBox(height: 20.v),
                  Divider(color: appTheme.gray200),
                  SizedBox(height: 19.v),
                  _buildFrameRow2(context,
                      checkmark: ImageConstant.imgIcon,
                      inviteText: "lbl_faqs".tr),
                  SizedBox(height: 20.v),
                  _buildFrameRow2(context,
                      checkmark: ImageConstant.imgFloatingIcon1,
                      inviteText: "msg_terms_conditions".tr,
                      onTapCheckmark: () {
                    onTapCheckmark(context);
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
        centerTitle: true,
        title: AppbarSubtitle(text: "lbl_settings".tr),
        actions: [
          AppbarTrailingIconbuttonOne(
              imagePath: ImageConstant.imgContrastGray300,
              margin: EdgeInsets.fromLTRB(24.h, 7.v, 24.h, 8.v))
        ]);
  }

  /// Section Widget
  Widget _buildFrameRow1(BuildContext context) {
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
      BlocSelector<SettingsBloc, SettingsState, bool?>(
          selector: (state) => state.isSelectedSwitch,
          builder: (context, isSelectedSwitch) {
            return CustomSwitch(
                margin: EdgeInsets.symmetric(vertical: 13.v),
                value: isSelectedSwitch,
                onChange: (value) {
                  context
                      .read<SettingsBloc>()
                      .add(ChangeSwitchEvent(value: value));
                });
          })
    ]);
  }

  /// Common widget
  Widget _buildFrameRow2(
    BuildContext context, {
    required String checkmark,
    required String inviteText,
    Function? onTapCheckmark,
  }) {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      CustomImageView(
          imagePath: checkmark,
          height: 40.adaptSize,
          width: 40.adaptSize,
          onTap: () {
            onTapCheckmark!.call();
          }),
      Padding(
          padding: EdgeInsets.only(left: 16.h, top: 7.v, bottom: 8.v),
          child: Text(inviteText,
              style: theme.textTheme.titleMedium!
                  .copyWith(color: appTheme.black900))),
      Spacer(),
      CustomImageView(
          imagePath: ImageConstant.imgArrowRight,
          height: 8.v,
          width: 4.h,
          margin: EdgeInsets.symmetric(vertical: 16.v))
    ]);
  }

  /// Navigates to the previous screen.
  onTapArrowLeft(BuildContext context) {
    NavigatorService.goBack();
  }

  /// Requests permission to access the camera and storage, and displays a model
  /// sheet for selecting images.
  ///
  /// Throws an error if permission is denied or an error occurs while selecting images.
  onTapCheckmark(BuildContext context) async {
    await PermissionManager.askForPermission(Permission.camera);
    await PermissionManager.askForPermission(Permission.storage);
    List<String?>? imageList = [];
    await FileManager().showModelSheetForImage(getImages: (value) async {
      imageList = value;
    });
  }
}

import 'bloc/national_bank_bloc.dart';
import 'models/national_bank_model.dart';
import 'package:flutter/material.dart';
import 'package:windy_sabtami_s_application1/core/app_export.dart';
import 'package:windy_sabtami_s_application1/widgets/app_bar/appbar_leading_iconbutton.dart';
import 'package:windy_sabtami_s_application1/widgets/app_bar/appbar_subtitle.dart';
import 'package:windy_sabtami_s_application1/widgets/app_bar/appbar_trailing_iconbutton_two.dart';
import 'package:windy_sabtami_s_application1/widgets/app_bar/custom_app_bar.dart';
import 'package:windy_sabtami_s_application1/widgets/custom_icon_button.dart';

class NationalBankPage extends StatelessWidget {
  const NationalBankPage({Key? key}) : super(key: key);

  static Widget builder(BuildContext context) {
    return BlocProvider<NationalBankBloc>(
        create: (context) => NationalBankBloc(
            NationalBankState(nationalBankModelObj: NationalBankModel()))
          ..add(NationalBankInitialEvent()),
        child: NationalBankPage());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NationalBankBloc, NationalBankState>(
        builder: (context, state) {
      return SafeArea(
          child: Scaffold(
              appBar: _buildAppBar(context),
              body: Container(
                  width: double.maxFinite,
                  padding:
                      EdgeInsets.symmetric(horizontal: 24.h, vertical: 12.v),
                  child: Column(children: [
                    SizedBox(height: 12.v),
                    CustomImageView(
                        imagePath: ImageConstant.imgSettingsTeal800,
                        height: 98.adaptSize,
                        width: 98.adaptSize),
                    SizedBox(height: 15.v),
                    Text("lbl_444_00".tr, style: theme.textTheme.headlineLarge),
                    SizedBox(height: 3.v),
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                      CustomImageView(
                          imagePath: ImageConstant.imgContrastPrimarycontainer,
                          height: 15.v,
                          width: 23.h),
                      CustomImageView(
                          imagePath: ImageConstant.img1Gray500,
                          height: 4.v,
                          width: 32.h,
                          margin: EdgeInsets.only(
                              left: 19.h, top: 6.v, bottom: 5.v)),
                      CustomImageView(
                          imagePath: ImageConstant.img1Gray500,
                          height: 4.v,
                          width: 32.h,
                          margin: EdgeInsets.only(
                              left: 10.h, top: 6.v, bottom: 5.v)),
                      Padding(
                          padding: EdgeInsets.only(left: 10.h),
                          child: Text("lbl_4023".tr,
                              style: CustomTextStyles.labelMediumGray500)),
                      Padding(
                          padding: EdgeInsets.only(left: 8.h),
                          child: Text("lbl_5534".tr,
                              style: CustomTextStyles.labelMediumGray500))
                    ]),
                    SizedBox(height: 11.v),
                    Text("msg_12_30_pm_25_june".tr,
                        style: theme.textTheme.labelMedium),
                    SizedBox(height: 38.v),
                    _buildCardNumber(context),
                    SizedBox(height: 28.v),
                    Align(
                        alignment: Alignment.centerLeft,
                        child: Text("msg_10_790_00_total".tr,
                            style:
                                CustomTextStyles.titleSmallSecondaryContainer)),
                    SizedBox(height: 16.v),
                    _buildOne(context),
                    SizedBox(height: 15.v),
                    _buildTwo(context)
                  ]))));
    });
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
        title: AppbarSubtitle(text: "lbl_national_bank".tr),
        actions: [
          AppbarTrailingIconbuttonTwo(
              imagePath: ImageConstant.imgUser,
              margin: EdgeInsets.fromLTRB(24.h, 7.v, 24.h, 8.v))
        ]);
  }

  /// Section Widget
  Widget _buildCardNumber(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text("lbl_150".tr, style: theme.textTheme.labelMedium),
        SizedBox(height: 37.v),
        Text("lbl_100".tr, style: theme.textTheme.labelMedium),
        SizedBox(height: 38.v),
        Text("lbl_50".tr, style: theme.textTheme.labelMedium),
        SizedBox(height: 36.v),
        Padding(
            padding: EdgeInsets.only(left: 4.h),
            child: Text("lbl_0".tr, style: theme.textTheme.labelMedium))
      ]),
      Expanded(
          child: Padding(
              padding: EdgeInsets.only(left: 9.h, top: 7.v, bottom: 7.v),
              child: Column(children: [
                Container(
                    height: 1.v,
                    width: 296.h,
                    decoration: BoxDecoration(color: appTheme.gray200)),
                SizedBox(height: 5.v),
                SizedBox(
                    height: 151.v,
                    width: 296.h,
                    child: Stack(alignment: Alignment.topCenter, children: [
                      Align(
                          alignment: Alignment.bottomCenter,
                          child: Container(
                              decoration: AppDecoration.fillGray200,
                              child: Divider(color: appTheme.indigo100))),
                      Align(
                          alignment: Alignment.topCenter,
                          child: Padding(
                              padding: EdgeInsets.only(top: 46.v),
                              child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Container(
                                        height: 1.v,
                                        width: 296.h,
                                        decoration: BoxDecoration(
                                            color: appTheme.gray200)),
                                    SizedBox(height: 51.v),
                                    Container(
                                        height: 1.v,
                                        width: 296.h,
                                        decoration: BoxDecoration(
                                            color: appTheme.gray200))
                                  ]))),
                      CustomImageView(
                          imagePath: ImageConstant.imgGroupGray200,
                          height: 151.v,
                          width: 272.h,
                          alignment: Alignment.center)
                    ]))
              ])))
    ]);
  }

  /// Section Widget
  Widget _buildOne(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      CustomIconButton(
          height: 50.adaptSize,
          width: 50.adaptSize,
          padding: EdgeInsets.all(15.h),
          decoration: IconButtonStyleHelper.fillTeal,
          child: CustomImageView(imagePath: ImageConstant.imgThumbsUpTeal800)),
      Padding(
          padding: EdgeInsets.only(left: 15.h, top: 6.v, bottom: 6.v),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text("lbl_220_00".tr, style: theme.textTheme.titleSmall),
            SizedBox(height: 1.v),
            Text("msg_10_30_pm_18_june".tr, style: theme.textTheme.labelMedium)
          ])),
      Spacer(),
      CustomImageView(
          imagePath: ImageConstant.imgArrowDownOnprimarycontainer,
          height: 5.v,
          width: 10.h,
          margin: EdgeInsets.only(top: 23.v, bottom: 22.v))
    ]);
  }

  /// Section Widget
  Widget _buildTwo(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      CustomIconButton(
          height: 50.adaptSize,
          width: 50.adaptSize,
          padding: EdgeInsets.all(15.h),
          decoration: IconButtonStyleHelper.fillTeal,
          child: CustomImageView(imagePath: ImageConstant.imgThumbsUpTeal800)),
      Padding(
          padding: EdgeInsets.only(left: 15.h, top: 6.v, bottom: 6.v),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text("lbl_170_00".tr, style: theme.textTheme.titleSmall),
            SizedBox(height: 1.v),
            Text("msg_12_45_pm_17_june".tr, style: theme.textTheme.labelMedium)
          ])),
      Spacer(),
      CustomImageView(
          imagePath: ImageConstant.imgArrowDownOnprimarycontainer,
          height: 5.v,
          width: 10.h,
          margin: EdgeInsets.only(top: 23.v, bottom: 22.v))
    ]);
  }

  /// Navigates to the previous screen.
  onTapArrowLeft(BuildContext context) {
    NavigatorService.goBack();
  }
}

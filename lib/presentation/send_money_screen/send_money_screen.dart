import 'bloc/send_money_bloc.dart';
import 'models/send_money_model.dart';
import 'package:flutter/material.dart';
import 'package:windy_sabtami_s_application1/core/app_export.dart';
import 'package:windy_sabtami_s_application1/widgets/app_bar/appbar_leading_iconbutton.dart';
import 'package:windy_sabtami_s_application1/widgets/app_bar/appbar_subtitle.dart';
import 'package:windy_sabtami_s_application1/widgets/app_bar/appbar_trailing_iconbutton_one.dart';
import 'package:windy_sabtami_s_application1/widgets/app_bar/custom_app_bar.dart';
import 'package:windy_sabtami_s_application1/widgets/custom_drop_down.dart';
import 'package:windy_sabtami_s_application1/widgets/custom_elevated_button.dart';
import 'package:windy_sabtami_s_application1/widgets/custom_icon_button.dart';

class SendMoneyScreen extends StatelessWidget {
  const SendMoneyScreen({Key? key}) : super(key: key);

  static Widget builder(BuildContext context) {
    return BlocProvider<SendMoneyBloc>(
        create: (context) =>
            SendMoneyBloc(SendMoneyState(sendMoneyModelObj: SendMoneyModel()))
              ..add(SendMoneyInitialEvent()),
        child: SendMoneyScreen());
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: _buildAppBar(context),
            body: Container(
                width: double.maxFinite,
                padding: EdgeInsets.all(24.h),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _buildFortyFour(context),
                      SizedBox(height: 16.v),
                      _buildMastercard(context),
                      SizedBox(height: 42.v),
                      Text("msg_enter_your_account".tr,
                          style: CustomTextStyles.titleMediumGray500),
                      SizedBox(height: 18.v),
                      Padding(
                          padding: EdgeInsets.symmetric(horizontal: 41.h),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("lbl_1_500_00".tr,
                                    style: theme.textTheme.headlineLarge),
                                Padding(
                                    padding: EdgeInsets.only(
                                        left: 24.h, top: 7.v, bottom: 10.v),
                                    child: BlocSelector<SendMoneyBloc,
                                            SendMoneyState, SendMoneyModel?>(
                                        selector: (state) =>
                                            state.sendMoneyModelObj,
                                        builder: (context, sendMoneyModelObj) {
                                          return CustomDropDown(
                                              width: 70.h,
                                              hintText: "lbl_usd".tr,
                                              hintStyle:
                                                  theme.textTheme.labelLarge!,
                                              items: sendMoneyModelObj
                                                      ?.dropdownItemList ??
                                                  [],
                                              borderDecoration:
                                                  DropDownStyleHelper
                                                      .outlineGray,
                                              onChanged: (value) {
                                                context
                                                    .read<SendMoneyBloc>()
                                                    .add(ChangeDropDownEvent(
                                                        value: value));
                                              });
                                        }))
                              ])),
                      SizedBox(height: 43.v),
                      _buildKeyboard(context),
                      SizedBox(height: 3.v)
                    ])),
            bottomNavigationBar: _buildSendMoney(context)));
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
        title: AppbarSubtitle(text: "lbl_send_money".tr),
        actions: [
          AppbarTrailingIconbuttonOne(
              imagePath: ImageConstant.imgContrastGray300,
              margin: EdgeInsets.fromLTRB(24.h, 7.v, 24.h, 8.v))
        ]);
  }

  /// Section Widget
  Widget _buildFortyFour(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 16.h, vertical: 15.v),
        decoration: AppDecoration.outlineBlack
            .copyWith(borderRadius: BorderRadiusStyle.roundedBorder13),
        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          CustomImageView(
              imagePath: ImageConstant.imgEllipse311,
              height: 50.adaptSize,
              width: 50.adaptSize,
              radius: BorderRadius.circular(25.h)),
          Padding(
              padding: EdgeInsets.only(left: 14.h, top: 6.v, bottom: 3.v),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("lbl_alex_dordan".tr,
                        style: theme.textTheme.titleMedium),
                    Text("lbl_web_developer".tr,
                        style: theme.textTheme.labelMedium)
                  ])),
          Spacer(),
          CustomImageView(
              imagePath: ImageConstant.imgFloatingIcon,
              height: 30.adaptSize,
              width: 30.adaptSize,
              margin: EdgeInsets.symmetric(vertical: 10.v))
        ]));
  }

  /// Section Widget
  Widget _buildMastercard(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(15.h),
        decoration: AppDecoration.outlineBlack
            .copyWith(borderRadius: BorderRadiusStyle.roundedBorder13),
        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          CustomIconButton(
              height: 50.adaptSize,
              width: 50.adaptSize,
              padding: EdgeInsets.all(13.h),
              decoration: IconButtonStyleHelper.fillPrimary,
              child: CustomImageView(
                  imagePath: ImageConstant.imgContrastWhiteA700)),
          Padding(
              padding: EdgeInsets.only(left: 14.h, top: 6.v, bottom: 6.v),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                        padding: EdgeInsets.only(left: 1.h),
                        child: Text("lbl_mastercard".tr,
                            style: theme.textTheme.titleMedium)),
                    Text("msg_5093_4690_4039_5534".tr,
                        style: theme.textTheme.labelMedium)
                  ])),
          Spacer(),
          CustomImageView(
              imagePath: ImageConstant.imgCheckmarkGray100,
              height: 30.adaptSize,
              width: 30.adaptSize,
              margin: EdgeInsets.only(top: 10.v, right: 1.h, bottom: 10.v))
        ]));
  }

  /// Section Widget
  Widget _buildKeyboard(BuildContext context) {
    return SizedBox(
        height: 229.v,
        width: 327.h,
        child: Stack(alignment: Alignment.center, children: [
          Align(
              alignment: Alignment.center,
              child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 46.h),
                  child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Padding(
                            padding: EdgeInsets.symmetric(horizontal: 3.h),
                            child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("lbl_1".tr,
                                      style: theme.textTheme.titleLarge),
                                  Text("lbl_2".tr,
                                      style: theme.textTheme.titleLarge),
                                  Text("lbl_3".tr,
                                      style: theme.textTheme.titleLarge)
                                ])),
                        SizedBox(height: 20.v),
                        Padding(
                            padding: EdgeInsets.only(right: 3.h),
                            child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("lbl_4".tr,
                                      style: theme.textTheme.titleLarge),
                                  Text("lbl_5".tr,
                                      style: theme.textTheme.titleLarge),
                                  Text("lbl_6".tr,
                                      style: theme.textTheme.titleLarge)
                                ])),
                        SizedBox(height: 23.v),
                        Padding(
                            padding: EdgeInsets.only(left: 1.h, right: 3.h),
                            child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("lbl_7".tr,
                                      style: theme.textTheme.titleLarge),
                                  Text("lbl_8".tr,
                                      style: theme.textTheme.titleLarge),
                                  Text("lbl_9".tr,
                                      style: theme.textTheme.titleLarge)
                                ])),
                        SizedBox(height: 23.v),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("lbl_0".tr,
                                  style: theme.textTheme.titleLarge),
                              CustomImageView(
                                  imagePath: ImageConstant.imgArrowDown,
                                  height: 10.v,
                                  width: 17.h,
                                  margin: EdgeInsets.only(
                                      left: 94.h, top: 10.v, bottom: 12.v))
                            ])
                      ]))),
          CustomImageView(
              imagePath: ImageConstant.imgGroup,
              height: 229.v,
              width: 327.h,
              alignment: Alignment.center)
        ]));
  }

  /// Section Widget
  Widget _buildSendMoney(BuildContext context) {
    return CustomElevatedButton(
        text: "lbl_send_money".tr,
        margin: EdgeInsets.only(left: 24.h, right: 24.h, bottom: 36.v),
        onPressed: () {
          onTapSendMoney(context);
        });
  }

  /// Navigates to the previous screen.
  onTapArrowLeft(BuildContext context) {
    NavigatorService.goBack();
  }

  /// Navigates to the confirmationScreen when the action is triggered.
  onTapSendMoney(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.confirmationScreen,
    );
  }
}

import 'bloc/transfer_amount_bloc.dart';
import 'models/transfer_amount_model.dart';
import 'package:flutter/material.dart';
import 'package:windy_sabtami_s_application1/core/app_export.dart';
import 'package:windy_sabtami_s_application1/widgets/app_bar/appbar_leading_iconbutton.dart';
import 'package:windy_sabtami_s_application1/widgets/app_bar/appbar_subtitle.dart';
import 'package:windy_sabtami_s_application1/widgets/app_bar/custom_app_bar.dart';
import 'package:windy_sabtami_s_application1/widgets/custom_elevated_button.dart';

class TransferAmountScreen extends StatelessWidget {
  const TransferAmountScreen({Key? key}) : super(key: key);

  static Widget builder(BuildContext context) {
    return BlocProvider<TransferAmountBloc>(
        create: (context) => TransferAmountBloc(
            TransferAmountState(transferAmountModelObj: TransferAmountModel()))
          ..add(TransferAmountInitialEvent()),
        child: TransferAmountScreen());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TransferAmountBloc, TransferAmountState>(
        builder: (context, state) {
      return SafeArea(
          child: Scaffold(
              appBar: _buildAppBar(context),
              body: SizedBox(
                  width: double.maxFinite,
                  child: Column(children: [
                    SizedBox(height: 23.v),
                    _buildFiftyThree(context),
                    Spacer()
                  ])),
              bottomNavigationBar: _buildSendMoney(context)));
    });
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
        height: 51.v,
        leadingWidth: 59.h,
        leading: AppbarLeadingIconbutton(
            imagePath: ImageConstant.imgArrowLeftBlack900,
            margin: EdgeInsets.only(left: 24.h, top: 8.v, bottom: 8.v),
            onTap: () {
              onTapArrowLeft(context);
            }),
        centerTitle: true,
        title: AppbarSubtitle(text: "lbl_transfer_amount".tr));
  }

  /// Section Widget
  Widget _buildFiftyThree(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(horizontal: 25.h),
        padding: EdgeInsets.symmetric(horizontal: 20.h, vertical: 26.v),
        decoration: AppDecoration.outlineBlack900
            .copyWith(borderRadius: BorderRadiusStyle.roundedBorder13),
        child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(children: [
                Padding(
                    padding: EdgeInsets.only(top: 10.v, bottom: 11.v),
                    child:
                        Text("lbl_to".tr, style: theme.textTheme.labelLarge)),
                CustomImageView(
                    imagePath: ImageConstant.imgEllipse31140x40,
                    height: 40.adaptSize,
                    width: 40.adaptSize,
                    radius: BorderRadius.circular(20.h),
                    margin: EdgeInsets.only(left: 14.h)),
                Padding(
                    padding: EdgeInsets.only(left: 14.h, bottom: 2.v),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("lbl_marlee_rice".tr,
                              style: theme.textTheme.titleSmall),
                          Text("lbl_id_14345112075".tr,
                              style: theme.textTheme.labelMedium)
                        ]))
              ]),
              SizedBox(height: 23.v),
              Divider(color: appTheme.gray200),
              SizedBox(height: 13.v),
              Text("lbl_amount".tr, style: theme.textTheme.labelLarge),
              SizedBox(height: 4.v),
              Align(
                  alignment: Alignment.center,
                  child:
                      Text("lbl_02".tr, style: theme.textTheme.headlineLarge)),
              SizedBox(height: 5.v),
              Align(
                  alignment: Alignment.center,
                  child: RichText(
                      text: TextSpan(children: [
                        TextSpan(
                            text: "msg_available_balance2".tr,
                            style: CustomTextStyles.labelMediumffb5b5bf),
                        TextSpan(text: " "),
                        TextSpan(
                            text: "lbl_3_230_00".tr,
                            style: CustomTextStyles.labelMediumff8982ff)
                      ]),
                      textAlign: TextAlign.left))
            ]));
  }

  /// Section Widget
  Widget _buildSendMoney(BuildContext context) {
    return CustomElevatedButton(
        text: "lbl_send_money".tr,
        margin: EdgeInsets.only(left: 24.h, right: 24.h, bottom: 34.v),
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

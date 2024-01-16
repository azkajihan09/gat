import 'bloc/transfer_bloc.dart';
import 'models/transfer_model.dart';
import 'package:flutter/material.dart';
import 'package:windy_sabtami_s_application1/core/app_export.dart';
import 'package:windy_sabtami_s_application1/widgets/custom_icon_button.dart';

class TransferPage extends StatefulWidget {
  const TransferPage({Key? key}) : super(key: key);

  @override
  TransferPageState createState() => TransferPageState();

  static Widget builder(BuildContext context) {
    return BlocProvider<TransferBloc>(
        create: (context) =>
            TransferBloc(TransferState(transferModelObj: TransferModel()))
              ..add(TransferInitialEvent()),
        child: TransferPage());
  }
}

class TransferPageState extends State<TransferPage>
    with AutomaticKeepAliveClientMixin<TransferPage> {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TransferBloc, TransferState>(builder: (context, state) {
      return SafeArea(
          child: Scaffold(
              body: Container(
                  width: double.maxFinite,
                  decoration: AppDecoration.white,
                  child: Column(children: [
                    SizedBox(height: 40.v),
                    Padding(
                        padding: EdgeInsets.only(left: 85.h, right: 91.h),
                        child: Column(children: [
                          Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                    padding: EdgeInsets.only(top: 3.v),
                                    child: Text("lbl_1_500_00".tr,
                                        style: theme.textTheme.headlineLarge)),
                                Container(
                                    margin: EdgeInsets.only(left: 24.h),
                                    padding: EdgeInsets.all(5.h),
                                    decoration: AppDecoration.outlineIndigo
                                        .copyWith(
                                            borderRadius: BorderRadiusStyle
                                                .roundedBorder7),
                                    child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          CustomImageView(
                                              imagePath:
                                                  ImageConstant.imgFacebook,
                                              height: 15.v,
                                              width: 13.h),
                                          SizedBox(height: 8.v),
                                          CustomImageView(
                                              imagePath:
                                                  ImageConstant.imgUser15x13,
                                              height: 15.v,
                                              width: 13.h)
                                        ]))
                              ]),
                          SizedBox(height: 39.v),
                          CustomIconButton(
                              height: 70.adaptSize,
                              width: 70.adaptSize,
                              padding: EdgeInsets.all(23.h),
                              decoration: IconButtonStyleHelper.outlineBlueA,
                              onTap: () {
                                onTapBtnArrowLeft(context);
                              },
                              child: CustomImageView(
                                  imagePath: ImageConstant.imgArrowLeft))
                        ]))
                  ]))));
    });
  }

  /// Navigates to the sendMoneyScreen when the action is triggered.
  onTapBtnArrowLeft(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.sendMoneyScreen,
    );
  }
}

import 'bloc/confirmation_bloc.dart';
import 'models/confirmation_model.dart';
import 'package:flutter/material.dart';
import 'package:windy_sabtami_s_application1/core/app_export.dart';
import 'package:windy_sabtami_s_application1/widgets/custom_elevated_button.dart';

class ConfirmationScreen extends StatelessWidget {
  const ConfirmationScreen({Key? key}) : super(key: key);

  static Widget builder(BuildContext context) {
    return BlocProvider<ConfirmationBloc>(
        create: (context) => ConfirmationBloc(
            ConfirmationState(confirmationModelObj: ConfirmationModel()))
          ..add(ConfirmationInitialEvent()),
        child: ConfirmationScreen());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ConfirmationBloc, ConfirmationState>(
        builder: (context, state) {
      return SafeArea(
          child: Scaffold(
              body: Container(
                  width: double.maxFinite,
                  padding: EdgeInsets.symmetric(horizontal: 24.h),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("lbl_confirmation".tr,
                            style: CustomTextStyles.titleMediumSemiBold18),
                        SizedBox(height: 70.v),
                        CustomImageView(
                            imagePath: ImageConstant.imgIllustrationGray100,
                            height: 200.v,
                            width: 143.h),
                        SizedBox(height: 70.v),
                        CustomElevatedButton(
                            text: "lbl_back_home".tr,
                            onPressed: () {
                              onTapBackHome(context);
                            }),
                        SizedBox(height: 5.v)
                      ]))));
    });
  }

  /// Navigates to the minePageContainerScreen when the action is triggered.
  onTapBackHome(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.minePageContainerScreen,
    );
  }
}

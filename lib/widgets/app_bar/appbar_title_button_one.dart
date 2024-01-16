import 'package:flutter/material.dart';
import 'package:windy_sabtami_s_application1/core/app_export.dart';
import 'package:windy_sabtami_s_application1/widgets/custom_elevated_button.dart';

// ignore: must_be_immutable
class AppbarTitleButtonOne extends StatelessWidget {
  AppbarTitleButtonOne({
    Key? key,
    this.margin,
    this.onTap,
  }) : super(
          key: key,
        );

  EdgeInsetsGeometry? margin;

  Function? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap!.call();
      },
      child: Padding(
        padding: margin ?? EdgeInsets.zero,
        child: CustomElevatedButton(
          height: 40.v,
          width: 80.h,
          text: "lbl_sign_up".tr,
          buttonTextStyle: CustomTextStyles.titleMediumWhiteA700_1,
        ),
      ),
    );
  }
}

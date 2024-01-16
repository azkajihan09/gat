import '../models/duration_item_model.dart';
import 'package:flutter/material.dart';
import 'package:windy_sabtami_s_application1/core/app_export.dart';
import 'package:windy_sabtami_s_application1/widgets/custom_icon_button.dart';

// ignore: must_be_immutable
class DurationItemWidget extends StatelessWidget {
  DurationItemWidget(
    this.durationItemModelObj, {
    Key? key,
  }) : super(
          key: key,
        );

  DurationItemModel durationItemModelObj;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CustomIconButton(
          height: 50.adaptSize,
          width: 50.adaptSize,
          padding: EdgeInsets.all(15.h),
          decoration: IconButtonStyleHelper.fillGrayTL13,
          child: CustomImageView(
            imagePath: ImageConstant.imgVector,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
            left: 15.h,
            top: 6.v,
            bottom: 3.v,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "lbl_apple_store".tr,
                style: theme.textTheme.titleSmall,
              ),
              SizedBox(height: 4.v),
              Text(
                "lbl_21_june_2022".tr,
                style: theme.textTheme.labelMedium,
              ),
            ],
          ),
        ),
        Spacer(),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 7.v),
          child: Column(
            children: [
              Text(
                "lbl_220_00".tr,
                style: theme.textTheme.labelLarge,
              ),
              SizedBox(height: 1.v),
              Text(
                "lbl_debit_card".tr,
                style: theme.textTheme.labelMedium,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

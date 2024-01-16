import '../models/twenty_item_model.dart';
import 'package:flutter/material.dart';
import 'package:windy_sabtami_s_application1/core/app_export.dart';
import 'package:windy_sabtami_s_application1/widgets/custom_icon_button.dart';

// ignore: must_be_immutable
class TwentyItemWidget extends StatelessWidget {
  TwentyItemWidget(
    this.twentyItemModelObj, {
    Key? key,
  }) : super(
          key: key,
        );

  TwentyItemModel twentyItemModelObj;

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
            imagePath: twentyItemModelObj?.vector,
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
                twentyItemModelObj.appleStore!,
                style: theme.textTheme.titleSmall,
              ),
              SizedBox(height: 4.v),
              Text(
                twentyItemModelObj.june!,
                style: theme.textTheme.labelMedium,
              ),
            ],
          ),
        ),
        Spacer(),
        Padding(
          padding: EdgeInsets.only(
            top: 16.v,
            bottom: 15.v,
          ),
          child: Text(
            twentyItemModelObj.price!,
            style: theme.textTheme.labelLarge,
          ),
        ),
      ],
    );
  }
}

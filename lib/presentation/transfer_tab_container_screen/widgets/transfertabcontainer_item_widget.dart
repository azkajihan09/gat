import '../models/transfertabcontainer_item_model.dart';
import 'package:flutter/material.dart';
import 'package:windy_sabtami_s_application1/core/app_export.dart';

// ignore: must_be_immutable
class TransfertabcontainerItemWidget extends StatelessWidget {
  TransfertabcontainerItemWidget(
    this.transfertabcontainerItemModelObj, {
    Key? key,
  }) : super(
          key: key,
        );

  TransfertabcontainerItemModel transfertabcontainerItemModelObj;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 50.h,
      child: Align(
        alignment: Alignment.centerLeft,
        child: CustomImageView(
          imagePath: transfertabcontainerItemModelObj?.ellipse,
          height: 50.adaptSize,
          width: 50.adaptSize,
          radius: BorderRadius.circular(
            25.h,
          ),
          margin: EdgeInsets.symmetric(vertical: 15.v),
        ),
      ),
    );
  }
}

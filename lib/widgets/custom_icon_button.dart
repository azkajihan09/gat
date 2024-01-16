import 'package:flutter/material.dart';
import 'package:windy_sabtami_s_application1/core/app_export.dart';

class CustomIconButton extends StatelessWidget {
  CustomIconButton({
    Key? key,
    this.alignment,
    this.height,
    this.width,
    this.padding,
    this.decoration,
    this.child,
    this.onTap,
  }) : super(
          key: key,
        );

  final Alignment? alignment;

  final double? height;

  final double? width;

  final EdgeInsetsGeometry? padding;

  final BoxDecoration? decoration;

  final Widget? child;

  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return alignment != null
        ? Align(
            alignment: alignment ?? Alignment.center,
            child: iconButtonWidget,
          )
        : iconButtonWidget;
  }

  Widget get iconButtonWidget => SizedBox(
        height: height ?? 0,
        width: width ?? 0,
        child: IconButton(
          padding: EdgeInsets.zero,
          icon: Container(
            height: height ?? 0,
            width: width ?? 0,
            padding: padding ?? EdgeInsets.zero,
            decoration: decoration ??
                BoxDecoration(
                  borderRadius: BorderRadius.circular(17.h),
                  border: Border.all(
                    color: appTheme.gray300,
                    width: 1.h,
                  ),
                ),
            child: child,
          ),
          onPressed: onTap,
        ),
      );
}

/// Extension on [CustomIconButton] to facilitate inclusion of all types of border style etc
extension IconButtonStyleHelper on CustomIconButton {
  static BoxDecoration get fillGray => BoxDecoration(
        color: appTheme.gray100,
        borderRadius: BorderRadius.circular(7.h),
      );
  static BoxDecoration get fillGrayTL13 => BoxDecoration(
        color: appTheme.gray100,
        borderRadius: BorderRadius.circular(13.h),
      );
  static BoxDecoration get fillRedA => BoxDecoration(
        color: appTheme.redA70026,
        borderRadius: BorderRadius.circular(13.h),
      );
  static BoxDecoration get fillGreenA => BoxDecoration(
        color: appTheme.greenA70026,
        borderRadius: BorderRadius.circular(13.h),
      );
  static BoxDecoration get fillPink => BoxDecoration(
        color: appTheme.pink400.withOpacity(0.15),
        borderRadius: BorderRadius.circular(13.h),
      );
  static BoxDecoration get outlineBlueA => BoxDecoration(
        color: theme.colorScheme.primary,
        borderRadius: BorderRadius.circular(35.h),
        boxShadow: [
          BoxShadow(
            color: appTheme.blueA70066,
            spreadRadius: 2.h,
            blurRadius: 2.h,
            offset: Offset(
              0,
              8,
            ),
          ),
        ],
      );
  static BoxDecoration get fillPrimary => BoxDecoration(
        color: theme.colorScheme.primary,
        borderRadius: BorderRadius.circular(25.h),
      );
  static BoxDecoration get fillAmber => BoxDecoration(
        color: appTheme.amber600.withOpacity(0.15),
        borderRadius: BorderRadius.circular(13.h),
      );
  static BoxDecoration get fillLightBlue => BoxDecoration(
        color: appTheme.lightBlue500.withOpacity(0.15),
        borderRadius: BorderRadius.circular(13.h),
      );
  static BoxDecoration get fillIndigo => BoxDecoration(
        color: appTheme.indigo50,
        borderRadius: BorderRadius.circular(25.h),
      );
  static BoxDecoration get fillIndigoTL5 => BoxDecoration(
        color: appTheme.indigo50,
        borderRadius: BorderRadius.circular(5.h),
      );
  static BoxDecoration get fillBlueA => BoxDecoration(
        color: appTheme.blueA70001.withOpacity(0.15),
        borderRadius: BorderRadius.circular(13.h),
      );
  static BoxDecoration get fillLightBlueTL13 => BoxDecoration(
        color: appTheme.lightBlue800.withOpacity(0.15),
        borderRadius: BorderRadius.circular(13.h),
      );
  static BoxDecoration get fillTeal => BoxDecoration(
        color: appTheme.teal800.withOpacity(0.15),
        borderRadius: BorderRadius.circular(13.h),
      );
}

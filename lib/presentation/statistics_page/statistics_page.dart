import 'bloc/statistics_bloc.dart';
import 'models/statistics_model.dart';
import 'package:flutter/material.dart';
import 'package:windy_sabtami_s_application1/core/app_export.dart';
import 'package:windy_sabtami_s_application1/widgets/custom_elevated_button.dart';

// ignore_for_file: must_be_immutable
class StatisticsPage extends StatefulWidget {
  const StatisticsPage({Key? key})
      : super(
          key: key,
        );

  @override
  StatisticsPageState createState() => StatisticsPageState();
  static Widget builder(BuildContext context) {
    return BlocProvider<StatisticsBloc>(
      create: (context) => StatisticsBloc(StatisticsState(
        statisticsModelObj: StatisticsModel(),
      ))
        ..add(StatisticsInitialEvent()),
      child: StatisticsPage(),
    );
  }
}

class StatisticsPageState extends State<StatisticsPage>
    with AutomaticKeepAliveClientMixin<StatisticsPage> {
  @override
  bool get wantKeepAlive => true;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StatisticsBloc, StatisticsState>(
      builder: (context, state) {
        return SafeArea(
          child: Scaffold(
            body: Container(
              width: double.maxFinite,
              decoration: AppDecoration.white,
              child: Column(
                children: [
                  SizedBox(height: 40.v),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24.h),
                    child: Column(
                      children: [
                        _buildDay(context),
                        SizedBox(height: 9.v),
                        Align(
                          alignment: Alignment.centerRight,
                          child: Padding(
                            padding: EdgeInsets.only(
                              left: 31.h,
                              right: 6.h,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "lbl_0".tr,
                                  style: theme.textTheme.labelMedium,
                                ),
                                Text(
                                  "lbl_20".tr,
                                  style: theme.textTheme.labelMedium,
                                ),
                                Text(
                                  "lbl_40".tr,
                                  style: theme.textTheme.labelMedium,
                                ),
                                Text(
                                  "lbl_60".tr,
                                  style: theme.textTheme.labelMedium,
                                ),
                                Text(
                                  "lbl_80".tr,
                                  style: theme.textTheme.labelMedium,
                                ),
                                Text(
                                  "lbl_100".tr,
                                  style: theme.textTheme.labelMedium,
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 32.v),
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 43.h),
                          padding: EdgeInsets.all(5.h),
                          decoration: AppDecoration.fillGray.copyWith(
                            borderRadius: BorderRadiusStyle.roundedBorder10,
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              CustomElevatedButton(
                                height: 40.v,
                                width: 115.h,
                                text: "lbl_income".tr,
                                buttonStyle: CustomButtonStyles.fillPrimaryTL7,
                                buttonTextStyle:
                                    CustomTextStyles.titleSmallWhiteA700,
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                  left: 28.h,
                                  top: 11.v,
                                  bottom: 7.v,
                                ),
                                child: Text(
                                  "lbl_expense".tr,
                                  style: theme.textTheme.titleSmall,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 22.v),
                        _buildTabBarView(context),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  /// Section Widget
  Widget _buildDay(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: EdgeInsets.only(
            top: 4.v,
            bottom: 3.v,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 1.h),
                child: Text(
                  "lbl_sun".tr,
                  style: theme.textTheme.labelMedium,
                ),
              ),
              SizedBox(height: 8.v),
              Text(
                "lbl_mon".tr,
                style: theme.textTheme.labelMedium,
              ),
              SizedBox(height: 8.v),
              Padding(
                padding: EdgeInsets.only(left: 1.h),
                child: Text(
                  "lbl_tue".tr,
                  style: theme.textTheme.labelMedium,
                ),
              ),
              SizedBox(height: 7.v),
              Padding(
                padding: EdgeInsets.only(left: 1.h),
                child: Text(
                  "lbl_wed".tr,
                  style: theme.textTheme.labelMedium,
                ),
              ),
              SizedBox(height: 8.v),
              Padding(
                padding: EdgeInsets.only(left: 1.h),
                child: Text(
                  "lbl_thu".tr,
                  style: theme.textTheme.labelMedium,
                ),
              ),
              SizedBox(height: 6.v),
              Padding(
                padding: EdgeInsets.only(left: 1.h),
                child: Text(
                  "lbl_fri".tr,
                  style: theme.textTheme.labelMedium,
                ),
              ),
              SizedBox(height: 8.v),
              Padding(
                padding: EdgeInsets.only(left: 1.h),
                child: Text(
                  "lbl_sat".tr,
                  style: theme.textTheme.labelMedium,
                ),
              ),
            ],
          ),
        ),
        CustomImageView(
          imagePath: ImageConstant.imgGraph,
          height: 161.v,
          width: 291.h,
          margin: EdgeInsets.only(left: 11.h),
        ),
      ],
    );
  }

  /// Section Widget
  Widget _buildTabBarView(BuildContext context) {
    return Container(
      height: 155.v,
      child: TabBarView(
        controller: tabController,
        children: [],
      ),
    );
  }
}

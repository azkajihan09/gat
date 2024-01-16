import 'bloc/statistics_tab_container_bloc.dart';
import 'models/statistics_tab_container_model.dart';
import 'package:flutter/material.dart';
import 'package:windy_sabtami_s_application1/core/app_export.dart';
import 'package:windy_sabtami_s_application1/presentation/statistics_page/statistics_page.dart';
import 'package:windy_sabtami_s_application1/widgets/app_bar/appbar_subtitle.dart';
import 'package:windy_sabtami_s_application1/widgets/app_bar/appbar_trailing_iconbutton.dart';
import 'package:windy_sabtami_s_application1/widgets/app_bar/custom_app_bar.dart';
import 'package:windy_sabtami_s_application1/widgets/custom_drop_down.dart';
import 'package:windy_sabtami_s_application1/widgets/custom_elevated_button.dart';

class StatisticsTabContainerPage extends StatefulWidget {
  const StatisticsTabContainerPage({Key? key}) : super(key: key);

  @override
  StatisticsTabContainerPageState createState() =>
      StatisticsTabContainerPageState();

  static Widget builder(BuildContext context) {
    return BlocProvider<StatisticsTabContainerBloc>(
        create: (context) => StatisticsTabContainerBloc(
            StatisticsTabContainerState(
                statisticsTabContainerModelObj: StatisticsTabContainerModel()))
          ..add(StatisticsTabContainerInitialEvent()),
        child: StatisticsTabContainerPage());
  }
}

// ignore_for_file: must_be_immutable
class StatisticsTabContainerPageState extends State<StatisticsTabContainerPage>
    with TickerProviderStateMixin {
  late TabController tabviewController;

  @override
  void initState() {
    super.initState();
    tabviewController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: _buildAppBar(context),
            body: SizedBox(
                width: double.maxFinite,
                child: Column(children: [
                  SizedBox(height: 25.v),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("lbl_1_500_00".tr,
                            style: theme.textTheme.headlineLarge),
                        Padding(
                            padding: EdgeInsets.only(
                                left: 24.h, top: 7.v, bottom: 10.v),
                            child: BlocSelector<
                                    StatisticsTabContainerBloc,
                                    StatisticsTabContainerState,
                                    StatisticsTabContainerModel?>(
                                selector: (state) =>
                                    state.statisticsTabContainerModelObj,
                                builder:
                                    (context, statisticsTabContainerModelObj) {
                                  return CustomDropDown(
                                      width: 70.h,
                                      hintText: "lbl_usd".tr,
                                      hintStyle: theme.textTheme.labelLarge!,
                                      items: statisticsTabContainerModelObj
                                              ?.dropdownItemList ??
                                          [],
                                      borderDecoration:
                                          DropDownStyleHelper.outlineGray,
                                      onChanged: (value) {
                                        context
                                            .read<StatisticsTabContainerBloc>()
                                            .add(ChangeDropDownEvent(
                                                value: value));
                                      });
                                }))
                      ]),
                  SizedBox(height: 20.v),
                  _buildTabview(context),
                  SizedBox(
                      height: 491.v,
                      child:
                          TabBarView(controller: tabviewController, children: [
                        StatisticsPage.builder(context),
                        StatisticsPage.builder(context),
                        StatisticsPage.builder(context)
                      ]))
                ]))));
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
        height: 49.v,
        centerTitle: true,
        title: AppbarSubtitle(text: "lbl_statistics".tr),
        actions: [
          AppbarTrailingIconbutton(
              imagePath: ImageConstant.imgUser,
              margin: EdgeInsets.symmetric(horizontal: 24.h, vertical: 7.v))
        ]);
  }

  /// Section Widget
  Widget _buildTabview(BuildContext context) {
    return Container(
        height: 50.v,
        width: 327.h,
        decoration: BoxDecoration(
            color: appTheme.whiteA700,
            borderRadius: BorderRadius.circular(7.h),
            boxShadow: [
              BoxShadow(
                  color: appTheme.black900.withOpacity(0.05),
                  spreadRadius: 2.h,
                  blurRadius: 2.h,
                  offset: Offset(0, 10))
            ]),
        child: TabBar(
            controller: tabviewController,
            labelPadding: EdgeInsets.zero,
            tabs: [
              Tab(child: Text("lbl_d".tr)),
              Tab(
                  child: SizedBox(
                      height: 30.v,
                      width: 197.h,
                      child: Stack(alignment: Alignment.center, children: [
                        CustomImageView(
                            imagePath: ImageConstant.imgElement,
                            height: 15.v,
                            width: 197.h,
                            alignment: Alignment.center),
                        Align(
                            alignment: Alignment.center,
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Padding(
                                      padding:
                                          EdgeInsets.symmetric(vertical: 4.v),
                                      child: Text("lbl_m".tr)),
                                  CustomElevatedButton(
                                      height: 30.v,
                                      width: 65.h,
                                      text: "lbl_w".tr,
                                      margin: EdgeInsets.only(left: 28.h),
                                      buttonStyle:
                                          CustomButtonStyles.fillPrimaryTL7,
                                      buttonTextStyle:
                                          CustomTextStyles.titleSmallWhiteA700),
                                  Padding(
                                      padding: EdgeInsets.only(
                                          left: 27.h, top: 4.v, bottom: 4.v),
                                      child: Text("lbl_y".tr))
                                ]))
                      ]))),
              Tab(child: Text("lbl_all".tr))
            ]));
  }
}

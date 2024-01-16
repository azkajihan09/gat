import '../transfer_tab_container_screen/widgets/transfertabcontainer_item_widget.dart';
import 'bloc/transfer_tab_container_bloc.dart';
import 'models/transfer_tab_container_model.dart';
import 'models/transfertabcontainer_item_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart' as fs;
import 'package:windy_sabtami_s_application1/core/app_export.dart';
import 'package:windy_sabtami_s_application1/presentation/transfer_page/transfer_page.dart';
import 'package:windy_sabtami_s_application1/widgets/app_bar/appbar_leading_iconbutton.dart';
import 'package:windy_sabtami_s_application1/widgets/app_bar/appbar_subtitle.dart';
import 'package:windy_sabtami_s_application1/widgets/app_bar/appbar_trailing_iconbutton.dart';
import 'package:windy_sabtami_s_application1/widgets/app_bar/custom_app_bar.dart';

class TransferTabContainerScreen extends StatefulWidget {
  const TransferTabContainerScreen({Key? key}) : super(key: key);

  @override
  TransferTabContainerScreenState createState() =>
      TransferTabContainerScreenState();

  static Widget builder(BuildContext context) {
    return BlocProvider<TransferTabContainerBloc>(
        create: (context) => TransferTabContainerBloc(TransferTabContainerState(
            transferTabContainerModelObj: TransferTabContainerModel()))
          ..add(TransferTabContainerInitialEvent()),
        child: TransferTabContainerScreen());
  }
}

// ignore_for_file: must_be_immutable
class TransferTabContainerScreenState extends State<TransferTabContainerScreen>
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
                  SizedBox(height: 30.v),
                  _buildTransferTabContainer(context),
                  SizedBox(height: 12.v),
                  Text("lbl_alex_dordan".tr,
                      style: CustomTextStyles.titleMedium18),
                  SizedBox(height: 1.v),
                  Text("lbl_web_developer".tr,
                      style: theme.textTheme.labelMedium),
                  SizedBox(height: 28.v),
                  _buildContrastRow(context),
                  SizedBox(height: 51.v),
                  Container(
                      height: 30.v,
                      width: 210.h,
                      child: TabBar(
                          controller: tabviewController,
                          labelPadding: EdgeInsets.zero,
                          labelColor: appTheme.whiteA700,
                          labelStyle: TextStyle(
                              fontSize: 12.fSize,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w500),
                          unselectedLabelColor: appTheme.black900,
                          unselectedLabelStyle: TextStyle(
                              fontSize: 12.fSize,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w500),
                          indicator: BoxDecoration(
                              color: theme.colorScheme.primary,
                              borderRadius: BorderRadius.circular(7.h),
                              boxShadow: [
                                BoxShadow(
                                    color: theme.colorScheme.onError,
                                    spreadRadius: 2.h,
                                    blurRadius: 2.h,
                                    offset: Offset(0, 4))
                              ]),
                          tabs: [
                            Tab(child: Text("lbl_eur".tr)),
                            Tab(child: Text("lbl_usd".tr)),
                            Tab(child: Text("lbl_gbp".tr))
                          ])),
                  _buildTabBarView(context)
                ]))));
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
        leadingWidth: 59.h,
        leading: AppbarLeadingIconbutton(
            imagePath: ImageConstant.imgArrowLeftBlack900,
            margin: EdgeInsets.only(left: 24.h, top: 8.v, bottom: 7.v),
            onTap: () {
              onTapArrowLeft(context);
            }),
        centerTitle: true,
        title: AppbarSubtitle(text: "lbl_transfer".tr),
        actions: [
          AppbarTrailingIconbutton(
              imagePath: ImageConstant.imgUser,
              margin: EdgeInsets.fromLTRB(24.h, 7.v, 24.h, 8.v))
        ]);
  }

  /// Section Widget
  Widget _buildTransferTabContainer(BuildContext context) {
    return Align(
        alignment: Alignment.centerLeft,
        child: SizedBox(
            height: 80.v,
            child: BlocSelector<TransferTabContainerBloc,
                    TransferTabContainerState, TransferTabContainerModel?>(
                selector: (state) => state.transferTabContainerModelObj,
                builder: (context, transferTabContainerModelObj) {
                  return ListView.separated(
                      scrollDirection: Axis.horizontal,
                      separatorBuilder: (context, index) {
                        return SizedBox(width: 24.h);
                      },
                      itemCount: transferTabContainerModelObj
                              ?.transfertabcontainerItemList.length ??
                          0,
                      itemBuilder: (context, index) {
                        TransfertabcontainerItemModel model =
                            transferTabContainerModelObj
                                    ?.transfertabcontainerItemList[index] ??
                                TransfertabcontainerItemModel();
                        return TransfertabcontainerItemWidget(model);
                      });
                })));
  }

  /// Section Widget
  Widget _buildContrastRow(BuildContext context) {
    return Container(
        width: 325.h,
        margin: EdgeInsets.symmetric(horizontal: 25.h),
        padding: EdgeInsets.symmetric(horizontal: 44.h, vertical: 49.v),
        decoration: BoxDecoration(
            image: DecorationImage(
                image: fs.Svg(ImageConstant.imgGroup199), fit: BoxFit.cover)),
        child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              CustomImageView(
                  imagePath: ImageConstant.imgContrastWhiteA700,
                  height: 23.v,
                  width: 36.h,
                  margin: EdgeInsets.only(bottom: 18.v)),
              CustomImageView(
                  imagePath: ImageConstant.img1,
                  height: 4.v,
                  width: 32.h,
                  margin: EdgeInsets.only(left: 20.h, top: 10.v, bottom: 27.v)),
              CustomImageView(
                  imagePath: ImageConstant.img1,
                  height: 4.v,
                  width: 32.h,
                  margin: EdgeInsets.only(left: 10.h, top: 10.v, bottom: 27.v)),
              Padding(
                  padding: EdgeInsets.only(left: 10.h, top: 3.v, bottom: 22.v),
                  child: Text("lbl_4023".tr,
                      style: CustomTextStyles.labelMediumWhiteA700_1)),
              Padding(
                  padding: EdgeInsets.only(left: 8.h, top: 3.v, bottom: 22.v),
                  child: Text("lbl_5534".tr,
                      style: CustomTextStyles.labelMediumWhiteA700_1))
            ]));
  }

  /// Section Widget
  Widget _buildTabBarView(BuildContext context) {
    return SizedBox(
        height: 303.v,
        child: TabBarView(controller: tabviewController, children: [
          TransferPage.builder(context),
          TransferPage.builder(context),
          TransferPage.builder(context)
        ]));
  }

  /// Navigates to the previous screen.
  onTapArrowLeft(BuildContext context) {
    NavigatorService.goBack();
  }
}

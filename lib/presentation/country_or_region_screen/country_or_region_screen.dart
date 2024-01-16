import '../country_or_region_screen/widgets/countryorregion_item_widget.dart';
import 'bloc/country_or_region_bloc.dart';
import 'models/country_or_region_model.dart';
import 'models/countryorregion_item_model.dart';
import 'package:flutter/material.dart';
import 'package:windy_sabtami_s_application1/core/app_export.dart';
import 'package:windy_sabtami_s_application1/widgets/app_bar/appbar_leading_iconbutton.dart';
import 'package:windy_sabtami_s_application1/widgets/app_bar/appbar_trailing_iconbutton.dart';
import 'package:windy_sabtami_s_application1/widgets/app_bar/custom_app_bar.dart';
import 'package:windy_sabtami_s_application1/widgets/custom_search_view.dart';

class CountryOrRegionScreen extends StatelessWidget {
  const CountryOrRegionScreen({Key? key}) : super(key: key);

  static Widget builder(BuildContext context) {
    return BlocProvider<CountryOrRegionBloc>(
        create: (context) => CountryOrRegionBloc(CountryOrRegionState(
            countryOrRegionModelObj: CountryOrRegionModel()))
          ..add(CountryOrRegionInitialEvent()),
        child: CountryOrRegionScreen());
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            appBar: _buildAppBar(context),
            body: Container(
                width: double.maxFinite,
                padding: EdgeInsets.all(24.h),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      BlocSelector<CountryOrRegionBloc, CountryOrRegionState,
                              TextEditingController?>(
                          selector: (state) => state.searchController,
                          builder: (context, searchController) {
                            return CustomSearchView(
                                controller: searchController,
                                hintText: "msg_search_country".tr);
                          }),
                      SizedBox(height: 31.v),
                      Text("msg_country_or_region".tr,
                          style: CustomTextStyles.titleMediumSemiBold18),
                      SizedBox(height: 14.v),
                      _buildCountryOrRegion(context)
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
        actions: [
          AppbarTrailingIconbutton(
              imagePath: ImageConstant.imgUser,
              margin: EdgeInsets.fromLTRB(24.h, 7.v, 24.h, 8.v))
        ]);
  }

  /// Section Widget
  Widget _buildCountryOrRegion(BuildContext context) {
    return BlocSelector<CountryOrRegionBloc, CountryOrRegionState,
            CountryOrRegionModel?>(
        selector: (state) => state.countryOrRegionModelObj,
        builder: (context, countryOrRegionModelObj) {
          return ListView.separated(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              separatorBuilder: (context, index) {
                return SizedBox(height: 16.v);
              },
              itemCount:
                  countryOrRegionModelObj?.countryorregionItemList.length ?? 0,
              itemBuilder: (context, index) {
                CountryorregionItemModel model =
                    countryOrRegionModelObj?.countryorregionItemList[index] ??
                        CountryorregionItemModel();
                return CountryorregionItemWidget(model,
                    onTapCountrySelection: () {
                  onTapCountrySelection(context);
                });
              });
        });
  }

  /// Navigates to the minePageContainerScreen when the action is triggered.
  onTapCountrySelection(BuildContext context) {
    NavigatorService.pushNamed(AppRoutes.minePageContainerScreen);
  }

  /// Navigates to the previous screen.
  onTapArrowLeft(BuildContext context) {
    NavigatorService.goBack();
  }
}

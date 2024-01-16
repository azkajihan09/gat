import 'bloc/mine_page_container_bloc.dart';
import 'models/mine_page_container_model.dart';
import 'package:flutter/material.dart';
import 'package:windy_sabtami_s_application1/core/app_export.dart';
import 'package:windy_sabtami_s_application1/presentation/mine_page/mine_page.dart';
import 'package:windy_sabtami_s_application1/presentation/national_bank_page/national_bank_page.dart';
import 'package:windy_sabtami_s_application1/presentation/profile_page/profile_page.dart';
import 'package:windy_sabtami_s_application1/presentation/statistics_tab_container_page/statistics_tab_container_page.dart';
import 'package:windy_sabtami_s_application1/widgets/custom_bottom_app_bar.dart';
import 'package:windy_sabtami_s_application1/widgets/custom_floating_button.dart';

// ignore_for_file: must_be_immutable
class MinePageContainerScreen extends StatelessWidget {
  MinePageContainerScreen({Key? key}) : super(key: key);

  GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  static Widget builder(BuildContext context) {
    return BlocProvider<MinePageContainerBloc>(
        create: (context) => MinePageContainerBloc(MinePageContainerState(
            minePageContainerModelObj: MinePageContainerModel()))
          ..add(MinePageContainerInitialEvent()),
        child: MinePageContainerScreen());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MinePageContainerBloc, MinePageContainerState>(
        builder: (context, state) {
      return SafeArea(
          child: Scaffold(
              body: Navigator(
                  key: navigatorKey,
                  initialRoute: AppRoutes.minePage,
                  onGenerateRoute: (routeSetting) => PageRouteBuilder(
                      pageBuilder: (ctx, ani, ani1) =>
                          getCurrentPage(context, routeSetting.name!),
                      transitionDuration: Duration(seconds: 0))),
              bottomNavigationBar: _buildTabBar(context),
              floatingActionButton: CustomFloatingButton(
                  height: 50,
                  width: 50,
                  backgroundColor: theme.colorScheme.primary,
                  child: CustomImageView(
                      imagePath: ImageConstant.imgThumbsUpWhiteA700,
                      height: 25.0.v,
                      width: 25.0.h)),
              floatingActionButtonLocation:
                  FloatingActionButtonLocation.centerDocked));
    });
  }

  /// Section Widget
  Widget _buildTabBar(BuildContext context) {
    return CustomBottomAppBar(onChanged: (BottomBarEnum type) {
      Navigator.pushNamed(navigatorKey.currentContext!, getCurrentRoute(type));
    });
  }

  ///Handling route based on bottom click actions
  String getCurrentRoute(BottomBarEnum type) {
    switch (type) {
      case BottomBarEnum.Userindigo50:
        return AppRoutes.minePage;
      case BottomBarEnum.Statistics:
        return AppRoutes.statisticsTabContainerPage;
      case BottomBarEnum.Usersecondarycontainer:
        return AppRoutes.nationalBankPage;
      case BottomBarEnum.Searchsecondarycontainer:
        return AppRoutes.profilePage;
      default:
        return "/";
    }
  }

  ///Handling page based on route
  Widget getCurrentPage(
    BuildContext context,
    String currentRoute,
  ) {
    switch (currentRoute) {
      case AppRoutes.minePage:
        return MinePage.builder(context);
      case AppRoutes.statisticsTabContainerPage:
        return StatisticsTabContainerPage.builder(context);
      case AppRoutes.nationalBankPage:
        return NationalBankPage.builder(context);
      case AppRoutes.profilePage:
        return ProfilePage.builder(context);
      default:
        return DefaultWidget();
    }
  }
}

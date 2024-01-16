import 'package:flutter/material.dart';
import 'package:windy_sabtami_s_application1/core/app_export.dart';

class CustomBottomAppBar extends StatefulWidget {
  CustomBottomAppBar({this.onChanged});

  Function(BottomBarEnum)? onChanged;

  @override
  CustomBottomAppBarState createState() => CustomBottomAppBarState();
}

class CustomBottomAppBarState extends State<CustomBottomAppBar> {
  List<BottomMenuModel> bottomMenuList = [
    BottomMenuModel(
        icon: ImageConstant.imgUserIndigo50,
        activeIcon: ImageConstant.imgUserIndigo50,
        type: BottomBarEnum.Userindigo50,
        isSelected: true),
    BottomMenuModel(
      icon: ImageConstant.imgStatistics,
      activeIcon: ImageConstant.imgStatistics,
      type: BottomBarEnum.Statistics,
    ),
    BottomMenuModel(
      icon: ImageConstant.imgUserSecondarycontainer,
      activeIcon: ImageConstant.imgUserSecondarycontainer,
      type: BottomBarEnum.Usersecondarycontainer,
    ),
    BottomMenuModel(
      icon: ImageConstant.imgSearchSecondarycontainer,
      activeIcon: ImageConstant.imgSearchSecondarycontainer,
      type: BottomBarEnum.Searchsecondarycontainer,
    )
  ];

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      shape: CircularNotchedRectangle(),
      child: SizedBox(
        height: 84.v,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: List.generate(
            bottomMenuList.length,
            (index) {
              return InkWell(
                onTap: () {
                  for (var element in bottomMenuList) {
                    element.isSelected = false;
                  }
                  bottomMenuList[index].isSelected = true;
                  widget.onChanged?.call(bottomMenuList[index].type);
                  setState(() {});
                },
                child: bottomMenuList[index].isSelected
                    ? CustomImageView(
                        imagePath: bottomMenuList[index].activeIcon,
                        height: 20.v,
                        width: 19.h,
                        color: appTheme.indigo50,
                      )
                    : CustomImageView(
                        imagePath: bottomMenuList[index].icon,
                        height: 20.v,
                        width: 19.h,
                        color: theme.colorScheme.secondaryContainer,
                      ),
              );
            },
          ),
        ),
      ),
    );
  }
}

enum BottomBarEnum {
  Userindigo50,
  Statistics,
  Usersecondarycontainer,
  Searchsecondarycontainer,
}

class BottomMenuModel {
  BottomMenuModel({
    required this.icon,
    required this.activeIcon,
    required this.type,
    this.isSelected = false,
  });

  String icon;

  String activeIcon;

  BottomBarEnum type;

  bool isSelected;
}

class DefaultWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.all(10),
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Please replace the respective Widget here',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

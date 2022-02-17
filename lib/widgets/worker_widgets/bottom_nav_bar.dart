import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

class CustomNavBarWidget extends StatelessWidget {
  final int ?selectedIndex;
  // final List<PersistentBottomNavBarItem> items; // NOTE: You CAN declare your own model here instead of `PersistentBottomNavBarItem`.
  final ValueChanged<int>? onItemSelected;

   CustomNavBarWidget(
      {Key ?key,
        this.selectedIndex,
        // required this.items,
        this.onItemSelected,}):super(key: key);
  List<PersistentBottomNavBarItem> navBarsItems= [
      PersistentBottomNavBarItem(
        icon:const Icon(CupertinoIcons.home),
        title: ("الرئيسية"),
        activeColorPrimary: FlexColor.blueDarkSecondary,
        inactiveColorPrimary:FlexColor.indigoLightPrimaryVariant ,
      ),
      PersistentBottomNavBarItem(
        icon:const Icon(CupertinoIcons.collections_solid),
        title: ("طلباتى"),
        activeColorPrimary: FlexColor.blueDarkSecondary,
        inactiveColorPrimary:FlexColor.indigoLightPrimaryVariant ,
      ),
      PersistentBottomNavBarItem(
        icon:const Icon(CupertinoIcons.square_favorites),
        title: ("العمليات"),
        activeColorPrimary: FlexColor.blueDarkSecondary,
        inactiveColorPrimary:FlexColor.indigoLightPrimaryVariant ,
      ),
      PersistentBottomNavBarItem(
        icon:const Icon(CupertinoIcons.settings),
        title: ("Settings"),
        activeColorPrimary: FlexColor.blueDarkSecondary,
        inactiveColorPrimary:FlexColor.indigoLightPrimaryVariant ,
      ),
    ];

  Widget _buildItem(
      PersistentBottomNavBarItem item, bool isSelected) {
    return Container(
      alignment: Alignment.center,
      height: 60.0,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Flexible(
            child: IconTheme(
              data: IconThemeData(
                  size: 26.0,
                  color: isSelected
                      ? (item.activeColorSecondary ?? item.activeColorPrimary)
                      : item.inactiveColorPrimary ?? item.activeColorPrimary),
              child: item.icon,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 5.0),
            child: Material(
              type: MaterialType.transparency,
              child: FittedBox(
                  child: Text(
                    item.title!,
                    style: TextStyle(
                        color: isSelected
                            ? (item.activeColorSecondary ?? item.activeColorPrimary)
                            : item.inactiveColorPrimary,
                        fontWeight: FontWeight.w400,
                        fontSize: 12.0),
                  )),
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Container(
        width: double.infinity,
        height: 60.0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: navBarsItems.map((item) {
            int index = navBarsItems.indexOf(item);
            return Flexible(
              child: GestureDetector(
                onTap: () {
                  onItemSelected!(index);
                },
                child: _buildItem(
                    item, selectedIndex == index),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
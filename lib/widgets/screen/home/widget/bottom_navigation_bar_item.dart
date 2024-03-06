import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomBottomNavigationBarItem {
  static BottomNavigationBarItem build(String asset, String label, BuildContext context) => BottomNavigationBarItem(
      icon: SvgPicture.asset(
        asset,
        height: 22,
        colorFilter: ColorFilter.mode(
          Theme.of(context).unselectedWidgetColor,
          BlendMode.srcIn
        ),
      ),
      activeIcon: SvgPicture.asset(
        asset,
        height: 22,
        colorFilter: ColorFilter.mode(
            Theme.of(context).primaryColor,
            BlendMode.srcIn
        ),
      ),
      label: label,
    );

}
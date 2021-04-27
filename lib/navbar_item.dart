import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NavBarItem {
  final String icon;
  final String activeIcon;
  final String label;
  NavBarItem({this.icon, this.activeIcon, this.label});
}

List<NavBarItem> _navBarList = [
  NavBarItem(
    icon: "assets/home.svg",
    activeIcon: "assets/home_filled.svg",
    label: "Home",
  ),
  NavBarItem(
    icon: "assets/search.svg",
    activeIcon: "assets/search_filled.svg",
    label: "Search",
  ),
  NavBarItem(
    icon: "assets/favorite.svg",
    activeIcon: "assets/favorite_filled.svg",
    label: "Favorite",
  ),
  NavBarItem(
    icon: "assets/account.svg",
    activeIcon: "assets/account_filled.svg",
    label: "Account",
  ),
];

List navBarItems = _navBarList
    .map((e) => BottomNavigationBarItem(
          icon: SvgPicture.asset(
            e.icon,
            width: 24.0,
          ),
          activeIcon: SvgPicture.asset(
            e.activeIcon,
            width: 24.0,
          ),
          label: e.label,
        ))
    .toList();

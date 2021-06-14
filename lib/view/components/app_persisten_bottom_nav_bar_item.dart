import 'package:flutter/material.dart';
import 'package:market_catalog_final/utils/constants.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:theme_provider/theme_provider.dart';

PersistentBottomNavBarItem appPersistentBottomNavBarItem(
    {Icon icon, String title, Function onPressed, BuildContext context}) {
  return PersistentBottomNavBarItem(
    icon: icon,
    title: title,
    activeColorPrimary: ThemeProvider.themeOf(context).id == 'dark_theme'
        ? kBottomNavBarActiveColorDark
        : kBottomNavBarActiveColorLight,
    inactiveColorPrimary: ThemeProvider.themeOf(context).id == 'dark_theme'
        ? kBottomNavBarInactiveColorDark
        : kBottomNavBarInactiveColorLight,
    onPressed: onPressed,
  );
}

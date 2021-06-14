import 'package:flutter/material.dart';
import 'package:market_catalog_final/provider/utils/utils.dart';
import 'package:market_catalog_final/utils/constants.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:provider/provider.dart';
import 'package:theme_provider/theme_provider.dart';

class AppPersistentTabView extends StatelessWidget {
  const AppPersistentTabView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<Utils>(
      builder: (context, provider, child) {
        return PersistentTabView(
          context,
          controller: provider.persistentTabController,
          screens: provider.mainScreenWidgets,
          items: provider.navBarsItems(context),
          backgroundColor: ThemeProvider.themeOf(context).id == 'dark_theme'
              ? kBottomNavBarColorDark
              : kBottomNavBarColorLight, // Default is Colors.white.
          navBarStyle: NavBarStyle
              .style3, // Choose the nav bar style with this property.
        );
      },
    );
  }
}

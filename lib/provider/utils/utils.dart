import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:market_catalog_final/view/components/app_persisten_bottom_nav_bar_item.dart';
import 'package:market_catalog_final/view/screens/favorites.dart';
import 'package:market_catalog_final/view/screens/main_page.dart';
import 'package:market_catalog_final/view/screens/market_page.dart';
import 'package:market_catalog_final/view/screens/settings.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:theme_provider/theme_provider.dart';

class Utils with ChangeNotifier {
  String mainScreenAppBarTitle;
  bool isDarkMode = false;

  void setThemeMode(String mode, BuildContext context) {
    ThemeProvider.controllerOf(context).setTheme(mode);
    notifyListeners();
  }

  final PersistentTabController persistentTabController =
      PersistentTabController(initialIndex: 0);

  final List<Widget> mainScreenWidgets = [
    MainPage(),
    MarketPage(),
    Favorites(),
    Settings(),
  ];

  List<PersistentBottomNavBarItem> navBarsItems(BuildContext context) {
    return [
      appPersistentBottomNavBarItem(
        icon: Icon(Icons.home),
        title: ("Anasayfa"),
        context: context,
        onPressed: (BuildContext context) {
          persistentTabController.index = 0;
          notifyListeners();
        },
      ),
      appPersistentBottomNavBarItem(
        icon: Icon(Icons.shop),
        title: ("Marketler"),
        context: context,
        onPressed: (BuildContext context) {
          persistentTabController.index = 1;
          notifyListeners();
        },
      ),
      appPersistentBottomNavBarItem(
          icon: Icon(Icons.favorite),
          title: ("Favoriler"),
          context: context,
          onPressed: (BuildContext context) {
            persistentTabController.index = 2;
            notifyListeners();
          }),
      appPersistentBottomNavBarItem(
          icon: Icon(Icons.settings),
          title: ("Ayarlar"),
          context: context,
          onPressed: (BuildContext context) {
            persistentTabController.index = 3;
            notifyListeners();
          }),
    ];
  }
}

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:market_catalog_final/provider/catalog/catalog_data.dart';
import 'package:market_catalog_final/provider/connection.dart';
import 'package:market_catalog_final/provider/favorite/favorite_data.dart';
import 'package:market_catalog_final/provider/market/market_data.dart';
import 'package:market_catalog_final/provider/utils/utils.dart';
import 'package:market_catalog_final/utils/my_behavior.dart';
import 'package:market_catalog_final/view/components/app_theme_data_dark.dart';
import 'package:market_catalog_final/view/components/app_theme_data_light.dart';
import 'package:market_catalog_final/view/screens/main_screen.dart';
import 'package:provider/provider.dart';
import 'package:theme_provider/theme_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MarketCatalog());
}

class MarketCatalog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => MarketData(),
        ),
        ChangeNotifierProvider(
          create: (context) => CatalogData(),
        ),
        ChangeNotifierProvider(
          create: (context) => FavoriteData(),
        ),
        ChangeNotifierProvider(
          create: (context) => Utils(),
        ),
        Provider(
          create: (context) => Connection(),
        ),
      ],
      builder: (context, child) {
        return ThemeProvider(
          saveThemesOnChange: true,
          loadThemeOnInit: true,
          themes: [
            AppTheme(
                id: 'light_theme',
                data: appThemeDataLight(),
                description: 'Light Theme'),
            AppTheme(
                id: 'dark_theme',
                data: appThemeDataDark(),
                description: 'Dark Theme'),
          ],
          child: ThemeConsumer(
            child: Builder(
              builder: (themeContext) {
                return MaterialApp(
                  builder: (context, child) {
                    return ScrollConfiguration(
                      behavior: MyBehavior(),
                      child: child,
                    );
                  },
                  home: MainScreen(),
                  theme: ThemeProvider.themeOf(themeContext).data,
                );
              },
            ),
          ),
        );
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:market_catalog_final/provider/utils/utils.dart';
import 'package:provider/provider.dart';
import 'package:theme_provider/theme_provider.dart';

class AppSettingCard extends StatelessWidget {
  final String cardText;
  final String appTheme;
  const AppSettingCard({
    Key key,
    this.cardText,
    this.appTheme,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<Utils>(
      builder: (context, utilsData, child) {
        return Card(
          child: ListTile(
            title: Text(
              cardText,
            ),
            trailing: Radio<String>(
              value: appTheme,
              groupValue: ThemeProvider.themeOf(context).id,
              onChanged: (value) {
                utilsData.setThemeMode(value, context);
              },
            ),
          ),
        );
      },
    );
  }
}

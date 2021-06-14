import 'package:flutter/material.dart';
import 'package:market_catalog_final/view/components/app_setting_card.dart';

class Settings extends StatelessWidget {
  const Settings({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Icon(
              Icons.settings,
              size: 40,
            ),
            Text('AYARLAR'),
          ],
        ),
        elevation: 0,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Uygulama Teması: ',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          AppSettingCard(
            cardText: 'Açık renkli tema',
            appTheme: 'light_theme',
          ),
          AppSettingCard(
            cardText: 'Koyu renkli tema',
            appTheme: 'dark_theme',
          ),
        ],
      ),
    );
  }
}

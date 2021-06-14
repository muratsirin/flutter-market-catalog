import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:market_catalog_final/provider/connection.dart';
import 'package:market_catalog_final/view/components/app_persistent_tab_view.dart';
import 'package:market_catalog_final/view/components/show_alert_dialog.dart';
import 'package:provider/provider.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffebebeb),
      body: Consumer<Connection>(
        builder: (context, connection, child) {
          return FutureBuilder<void>(
            future: connection.getNetworkStatus(),
            builder: (context, snapshot) {
              if (connection.isConnected == false) {
                return showAlertDialog();
              } else {
                return AppPersistentTabView();
              }
            },
          );
        },
      ),
    );
  }
}

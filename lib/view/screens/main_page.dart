import 'package:flutter/material.dart';
import 'package:market_catalog_final/view/components/all_catalog.dart';
import 'package:market_catalog_final/view/components/last_added_catalogs.dart';

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Icon(
              Icons.home,
              size: 40,
            ),
            Text('ANASAYFA'),
          ],
        ),
        elevation: 0,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 0,
            ),
            child: LastAddedCatalogs(),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 0,
              ),
              child: AllCatalogs2(),
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:market_catalog_final/view/components/market_list.dart';

class MarketPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Icon(
              Icons.shop,
              size: 40,
            ),
            Text('MARKETLER'),
          ],
        ),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 0,
        ),
        child: MarketList(),
      ),
    );
  }
}

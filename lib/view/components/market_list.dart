import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:market_catalog_final/provider/market/market_data.dart';
import 'package:market_catalog_final/utils/constants.dart';
import 'package:market_catalog_final/view/components/app_circular_progress_indicator.dart';
import 'package:market_catalog_final/view/components/market_catalogs.dart';
import 'package:market_catalog_final/view/screens/catalog_by_market_name.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:provider/provider.dart';

class MarketList extends StatelessWidget {
  const MarketList({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<MarketData>(
      builder: (context, marketData, child) {
        return StreamBuilder<QuerySnapshot>(
          stream: marketData.getMarketsFromFireStore(),
          builder: (context, marketSnapshot) {
            if (!marketSnapshot.hasData) {
              return AppCircularProgressIndicator();
            } else {
              return ListView.builder(
                itemCount: marketSnapshot.data.docs.length,
                itemBuilder: (context, marketIndex) {
                  final market = marketData.getMarkets(
                      snapshot: marketSnapshot)[marketIndex];
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              market.marketName,
                              style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            TextButton(
                              child: Text(
                                'Tümünü gör',
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  color: kIconColorDark,
                                ),
                              ),
                              onPressed: () {
                                pushNewScreen(
                                  context,
                                  screen: CatalogByMarket(
                                    marketName: market.marketName,
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                      MarketCatalogs(
                        marketName: market.marketName,
                      ),
                    ],
                  );
                },
              );
            }
          },
        );
      },
    );
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:market_catalog_final/provider/catalog/catalog_data.dart';
import 'package:market_catalog_final/view/components/market_catalog_items.dart';
import 'package:market_catalog_final/view/screens/catalog_screen.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:provider/provider.dart';
import 'app_circular_progress_indicator.dart';

class MarketCatalogs extends StatelessWidget {
  final String marketName;
  const MarketCatalogs({Key key, this.marketName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      child: Consumer<CatalogData>(
        builder: (context, catalogData, child) {
          return StreamBuilder<QuerySnapshot>(
            stream: catalogData.getCatalogsFromFireStoreByMarketNameLimit(
                marketName: marketName),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return AppCircularProgressIndicator();
              } else {
                return ListView.builder(
                  itemCount: snapshot.data.docs.length,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    final catalog =
                        catalogData.getCatalogs(snapshot: snapshot)[index];
                    return Padding(
                      padding: const EdgeInsets.only(right: 5.0),
                      child: GestureDetector(
                        child: MarketCatalogItems(
                          itemImageURL: catalog.catalogImageURL,
                          itemTitle: catalog.catalogName,
                        ),
                        onTap: () {
                          pushNewScreen(
                            context,
                            screen: CatalogScreen(
                              catalogDocumentID: catalog.documentID,
                              catalogFileURL: catalog.catalogFileURL,
                              catalogImageURL: catalog.catalogImageURL,
                              catalogName: catalog.catalogName,
                              marketName: catalog.marketName,
                            ),
                          );
                        },
                      ),
                    );
                  },
                );
              }
            },
          );
        },
      ),
    );
  }
}

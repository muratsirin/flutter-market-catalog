import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:market_catalog_final/provider/catalog/catalog_data.dart';
import 'package:market_catalog_final/view/components/app_circular_progress_indicator.dart';
import 'package:market_catalog_final/view/components/last_added_items.dart';
import 'package:market_catalog_final/view/screens/catalog_screen.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:provider/provider.dart';

class LastAddedCatalogs extends StatelessWidget {
  const LastAddedCatalogs({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 275,
      child: Consumer<CatalogData>(
        builder: (context, catalogData, child) {
          return StreamBuilder<QuerySnapshot>(
            stream: catalogData.getLastAddedCatalogsFromFireStore(),
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
                    return LastAddedItems(
                      itemTitle: catalog.catalogName,
                      itemImageURL: catalog.catalogImageURL,
                      marketName: catalog.marketName,
                      onPress: () {
                        pushNewScreen(
                          context,
                          screen: CatalogScreen(
                            catalogDocumentID: catalog.documentID,
                            catalogName: catalog.catalogName,
                            catalogImageURL: catalog.catalogImageURL,
                            catalogFileURL: catalog.catalogFileURL,
                            marketName: catalog.marketName,
                          ),
                        );
                      },
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

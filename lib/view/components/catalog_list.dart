import 'package:flutter/material.dart';
import 'package:market_catalog_final/provider/catalog/catalog_data.dart';
import 'package:market_catalog_final/view/screens/catalog_screen.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:provider/provider.dart';
import 'app_items.dart';
import 'app_slivergrid_delegate.dart';

class CatalogList extends StatelessWidget {
  final snapshot;
  const CatalogList({Key key, this.snapshot}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<CatalogData>(builder: (context, catalogData, child) {
      return GridView.builder(
        itemCount: snapshot.data.docs.length,
        gridDelegate: appSliverDelegate(),
        itemBuilder: (context, index) {
          final catalog = catalogData.getCatalogs(snapshot: snapshot)[index];
          return AppItems(
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
    });
  }
}

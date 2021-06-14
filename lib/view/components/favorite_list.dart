import 'package:flutter/material.dart';
import 'package:market_catalog_final/provider/favorite/favorite_data.dart';
import 'package:market_catalog_final/view/components/app_items.dart';
import 'package:market_catalog_final/view/components/app_slivergrid_delegate.dart';
import 'package:market_catalog_final/view/screens/catalog_screen.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:provider/provider.dart';

class FavoriteList extends StatelessWidget {
  const FavoriteList({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<FavoriteData>(
      builder: (context, favoriteData, child) {
        return GridView.builder(
          itemCount: favoriteData.favoriteList.length,
          gridDelegate: appSliverDelegate(),
          itemBuilder: (context, index) {
            final favorite = favoriteData.favoriteList[index];
            return AppItems(
              itemImageURL: favorite.catalogImageURL,
              itemTitle: favorite.catalogName,
              marketName: favorite.marketName,
              onPress: () {
                pushNewScreen(
                  context,
                  screen: CatalogScreen(
                    catalogDocumentID: favorite.catalogDocumentID,
                    catalogName: favorite.catalogName,
                    catalogImageURL: favorite.catalogImageURL,
                    catalogFileURL: favorite.catalogFileURL,
                    marketName: favorite.marketName,
                  ),
                );
              },
            );
          },
        );
      },
    );
  }
}

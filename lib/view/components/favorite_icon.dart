import 'package:flutter/material.dart';
import 'package:market_catalog_final/provider/favorite/favorite_data.dart';
import 'package:provider/provider.dart';

class FavoriteIcon extends StatelessWidget {
  final String catalogDocumentID;
  final String catalogName;
  final String catalogImageURL;
  final String catalogFileURL;
  final String marketName;

  const FavoriteIcon({
    Key key,
    this.catalogDocumentID,
    this.catalogName,
    this.catalogImageURL,
    this.catalogFileURL,
    this.marketName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<FavoriteData>(
      builder: (context, favoriteData, child) {
        return GestureDetector(
          child: Icon(
            favoriteData.isFavorite(documentID: catalogDocumentID)
                ? Icons.favorite
                : Icons.favorite_border,
          ),
          onTap: () {
            if (favoriteData.isFavorite(documentID: catalogDocumentID) ==
                false) {
              favoriteData.addFavorite(
                catalogDocumentID: catalogDocumentID,
                catalogName: catalogName,
                catalogFileURL: catalogFileURL,
                catalogImageURL: catalogImageURL,
                marketName: marketName,
              );
            } else {
              favoriteData.deleteFavorite(catalogDocumentID);
            }
          },
        );
      },
    );
  }
}

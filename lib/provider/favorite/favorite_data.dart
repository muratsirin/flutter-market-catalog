import 'package:flutter/cupertino.dart';
import 'package:market_catalog_final/model/favorites.dart';
import 'package:market_catalog_final/sqflite/database_helper.dart';
import 'package:async/async.dart';

class FavoriteData with ChangeNotifier {
  DatabaseHelper databaseHelper = DatabaseHelper.instance;
  String fCatalogName;
  String fCatalogImageURL;
  String fCatalogFileURL;
  String fCatalogDocumentID;
  String fMarketName;
  AsyncMemoizer asyncMemoizer = AsyncMemoizer();

  List<Favorite> favoriteList = [];

  Future<dynamic> addFavoriteToDB({Favorite favorite}) async {
    try {
      final int id = DateTime.now().millisecondsSinceEpoch;
      final favorite = Favorite(
        id: id,
        catalogName: fCatalogName,
        catalogImageURL: fCatalogImageURL,
        catalogFileURL: fCatalogFileURL,
        catalogDocumentID: fCatalogDocumentID,
        marketName: fMarketName,
      );

      var database = await databaseHelper.database;
      var query = database.insert('favorite', favorite.toMap());
      favoriteList.insert(0, favorite);

      return query;
    } catch (e) {
      throw 'Bir hata oluştu';
    }
  }

  bool isFavorite({String documentID}) {
    bool isFavorite = false;
    getFavorite();
    List<String> catalogDocumentID = [];
    for (var favorite in favoriteList) {
      catalogDocumentID.add(favorite.catalogDocumentID);
    }
    if (catalogDocumentID.contains(documentID)) {
      isFavorite = true;
    } else {
      isFavorite = false;
    }
    return isFavorite;
  }

  void addFavorite({
    String catalogDocumentID,
    String catalogName,
    String catalogImageURL,
    String catalogFileURL,
    String marketName,
  }) {
    fCatalogName = catalogName;
    fCatalogFileURL = catalogFileURL;
    fCatalogDocumentID = catalogDocumentID;
    fCatalogImageURL = catalogImageURL;
    fMarketName = marketName;
    notifyListeners();
    addFavoriteToDB(
      favorite: Favorite(
        catalogDocumentID: catalogDocumentID,
        catalogName: catalogName,
        catalogImageURL: catalogImageURL,
        catalogFileURL: catalogFileURL,
        marketName: marketName,
      ),
    );
  }

  Future<List<Map<String, dynamic>>> get favorite async {
    try {
      var database = await databaseHelper.database;
      var query = database.rawQuery('SELECT * FROM favorite ORDER BY id DESC');

      return query;
    } catch (e) {
      throw 'Bir hata oluştu';
    }
  }

  Future<void> getFavorite() async {
    try {
      return this.asyncMemoizer.runOnce(() async {
        var favoriteMapList = await favorite;
        for (Map favoriteMap in favoriteMapList) {
          favoriteList.add(Favorite.fromMap(favoriteMap));
        }
        notifyListeners();
      });
    } catch (e) {
      throw 'Bir hata oluştu';
    }
  }

  Future deleteFavoriteFromDB(String catalogDocumentID) async {
    try {
      var database = await databaseHelper.database;
      return database.delete('favorite',
          where: 'catalogDocumentID = ?', whereArgs: [catalogDocumentID]);
    } catch (e) {
      throw 'Bir hata oluştu';
    }
  }

  Future deleteFavorite(String catalogDocumentID) {
    try {
      favoriteList.removeWhere(
          (element) => element.catalogDocumentID == catalogDocumentID);
      notifyListeners();
      return deleteFavoriteFromDB(catalogDocumentID);
    } catch (e) {
      throw 'Bir hata oluştu';
    }
  }
}

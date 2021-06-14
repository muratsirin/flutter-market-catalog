import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:market_catalog_final/model/catalog.dart';

final _fireStore = FirebaseFirestore.instance;

class CatalogData with ChangeNotifier {
  Stream<QuerySnapshot> getCatalogsFromFireStore() {
    try {
      return _fireStore
          .collection('catalogs')
          .orderBy('addedTime', descending: true)
          .snapshots();
    } catch (e) {
      throw 'Bir hata oluştu';
    }
  }

  Stream<QuerySnapshot> getLastAddedCatalogsFromFireStore() {
    try {
      return _fireStore
          .collection('catalogs')
          .orderBy('addedTime', descending: true)
          .limit(10)
          .snapshots();
    } catch (e) {
      throw 'Bir hata oluştu';
    }
  }

  Stream<QuerySnapshot> getCatalogsFromFireStoreByMarketName(
      {String marketName}) {
    try {
      return _fireStore
          .collection('catalogs')
          .where('marketName', isEqualTo: marketName)
          .orderBy('addedTime', descending: true)
          .snapshots();
    } catch (e) {
      throw 'Bir hata oluştu';
    }
  }

  Stream<QuerySnapshot> getCatalogsFromFireStoreByMarketNameLimit(
      {String marketName}) {
    try {
      return _fireStore
          .collection('catalogs')
          .where('marketName', isEqualTo: marketName)
          .orderBy('addedTime', descending: true)
          .limit(8)
          .snapshots();
    } catch (e) {
      throw 'Bir hata oluştu';
    }
  }

  List<Catalog> getCatalogs({dynamic snapshot}) {
    List<Catalog> catalogs = [];
    try {
      final catalogSnapshot = snapshot.data.docs.reversed;
      for (var catalogData in catalogSnapshot) {
        catalogs.add(Catalog.fromData(catalogData));
      }
      return catalogs;
    } catch (e) {
      throw 'Bir hata oluştu';
    }
  }
}

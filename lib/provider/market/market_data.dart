import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:market_catalog_final/model/market.dart';

final _fireStore = FirebaseFirestore.instance;

class MarketData with ChangeNotifier {
  Stream<QuerySnapshot> getMarketsFromFireStore() {
    try {
      return _fireStore
          .collection('markets')
          .orderBy('addedTime', descending: true)
          .snapshots();
    } catch (e) {
      throw 'Bir hata oluştu';
    }
  }

  List<Market> getMarkets({dynamic snapshot}) {
    try {
      final marketSnapshot = snapshot.data.docs.reversed;
      List<Market> markets = [];
      for (var marketData in marketSnapshot) {
        markets.add(Market.fromData(marketData));
      }
      return markets;
    } catch (e) {
      throw 'Bir hata oluştu';
    }
  }
}

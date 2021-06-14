import 'package:cloud_firestore/cloud_firestore.dart';

class Market {
  String documentId;
  String marketName;
  int marketPriority;
  String marketLogoURL;
  FieldValue addedTime;

  Market(
      {this.documentId,
      this.marketName,
      this.marketPriority,
      this.marketLogoURL,
      this.addedTime});

  factory Market.fromData(QueryDocumentSnapshot queryDocumentSnapshot) {
    return new Market(
      documentId: queryDocumentSnapshot.id,
      marketName: queryDocumentSnapshot.data()['marketName'],
      marketPriority: queryDocumentSnapshot.data()['marketPriority'],
      marketLogoURL: queryDocumentSnapshot.data()['marketLogoURL'],
    );
  }
}

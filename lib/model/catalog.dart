import 'package:cloud_firestore/cloud_firestore.dart';

class Catalog {
  int id;
  String documentID;
  String catalogName;
  int catalogPriority;
  String marketName;
  String catalogImageURL;
  String catalogFileURL;
  FieldValue addedTime;

  Catalog(
      {this.id,
      this.documentID,
      this.catalogName,
      this.catalogPriority,
      this.marketName,
      this.catalogImageURL,
      this.catalogFileURL,
      this.addedTime});

  factory Catalog.fromData(QueryDocumentSnapshot queryDocumentSnapshot) {
    return new Catalog(
      id: queryDocumentSnapshot.data()['id'],
      documentID: queryDocumentSnapshot.id,
      catalogName: queryDocumentSnapshot.data()['catalogName'],
      catalogPriority: queryDocumentSnapshot.data()['catalogPriority'],
      catalogImageURL: queryDocumentSnapshot.data()['catalogImageURL'],
      catalogFileURL: queryDocumentSnapshot.data()['catalogFileURL'],
      marketName: queryDocumentSnapshot.data()['marketName'],
    );
  }
}

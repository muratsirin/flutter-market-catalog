class Favorite {
  int id;
  String catalogDocumentID;
  String catalogImageURL;
  String catalogFileURL;
  String catalogName;
  String marketName;

  Favorite({
    this.id,
    this.catalogDocumentID,
    this.catalogImageURL,
    this.catalogFileURL,
    this.catalogName,
    this.marketName,
  });

  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    map['id'] = this.id;
    map['catalogDocumentID'] = this.catalogDocumentID;
    map['catalogName'] = this.catalogName;
    map['catalogImageURL'] = this.catalogImageURL;
    map['catalogFileURL'] = this.catalogFileURL;
    map['marketName'] = this.marketName;

    return map;
  }

  Favorite.fromMap(Map<String, dynamic> map) {
    this.id = map['id'];
    this.catalogDocumentID = map['catalogDocumentID'];
    this.catalogName = map['catalogName'];
    this.catalogImageURL = map['catalogImageURL'];
    this.catalogFileURL = map['catalogFileURL'];
    this.marketName = map['marketName'];
  }

  @override
  String toString() {
    return 'Favorite{id: $id, catalogName: $catalogName, catalogDocumentID: $catalogDocumentID, catalogImageURL: $catalogImageURL, catalogFileURL: $catalogFileURL, marketName: $marketName}';
  }
}

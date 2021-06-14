import 'package:flutter/material.dart';
import 'package:market_catalog_final/view/components/favorite_icon.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class CatalogScreen extends StatelessWidget {
  final String catalogDocumentID;
  final String catalogName;
  final String catalogImageURL;
  final String catalogFileURL;
  final String marketName;

  const CatalogScreen({
    Key key,
    this.catalogDocumentID,
    this.catalogFileURL,
    this.catalogName,
    this.catalogImageURL,
    this.marketName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(catalogName),
        elevation: 0,
        actions: [
          FavoriteIcon(
            catalogDocumentID: catalogDocumentID,
            catalogName: catalogName,
            catalogFileURL: catalogFileURL,
            catalogImageURL: catalogImageURL,
            marketName: marketName,
          ),
        ],
      ),
      body: SfPdfViewer.network(
        catalogFileURL,
      ),
    );
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:market_catalog_final/provider/catalog/catalog_data.dart';
import 'package:market_catalog_final/view/components/app_circular_progress_indicator.dart';
import 'package:market_catalog_final/view/components/catalog_list.dart';
import 'package:provider/provider.dart';

class CatalogByMarket extends StatelessWidget {
  final String marketName;

  CatalogByMarket({this.marketName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(marketName),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 8,
        ),
        child: StreamBuilder<QuerySnapshot>(
          stream: Provider.of<CatalogData>(context)
              .getCatalogsFromFireStoreByMarketName(marketName: marketName),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return Center(
                child: AppCircularProgressIndicator(),
              );
            } else {
              return CatalogList(
                snapshot: snapshot,
              );
            }
          },
        ),
      ),
    );
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:market_catalog_final/provider/catalog/catalog_data.dart';
import 'package:market_catalog_final/view/components/catalog_list.dart';
import 'package:provider/provider.dart';
import 'app_circular_progress_indicator.dart';

class AllCatalogList extends StatelessWidget {
  const AllCatalogList({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: Provider.of<CatalogData>(context).getCatalogsFromFireStore(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return AppCircularProgressIndicator();
        } else {
          return CatalogList(
            snapshot: snapshot,
          );
        }
      },
    );
  }
}

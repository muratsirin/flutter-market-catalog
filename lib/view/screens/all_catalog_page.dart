import 'package:flutter/material.dart';
import 'package:market_catalog_final/view/components/all_catalog_list.dart';

class AllCatalogPage extends StatelessWidget {
  const AllCatalogPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('KATALOGLAR'),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 8,
        ),
        child: AllCatalogList(),
      ),
    );
  }
}

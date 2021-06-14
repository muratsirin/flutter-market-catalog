import 'package:flutter/material.dart';
import 'package:market_catalog_final/utils/constants.dart';
import 'package:market_catalog_final/view/components/all_catalog_list.dart';
import 'package:market_catalog_final/view/screens/all_catalog_page.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

class AllCatalogs2 extends StatelessWidget {
  const AllCatalogs2({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Kataloglar',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextButton(
                child: Text(
                  'Tümünü gör',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: kIconColorDark,
                  ),
                ),
                onPressed: () {
                  pushNewScreen(
                    context,
                    screen: AllCatalogPage(),
                  );
                },
              ),
            ],
          ),
        ),
        Expanded(
          child: AllCatalogList(),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:market_catalog_final/provider/favorite/favorite_data.dart';
import 'package:market_catalog_final/view/components/favorite_list.dart';
import 'package:provider/provider.dart';

class Favorites extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Icon(
              Icons.favorite,
              size: 40,
            ),
            Text('FAVORİLER'),
          ],
        ),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 8,
        ),
        child: FutureBuilder(
          future:
              Provider.of<FavoriteData>(context, listen: false).getFavorite(),
          builder: (context, snapshot) {
            return FavoriteList();
          },
        ),
      ),
    );
  }
}

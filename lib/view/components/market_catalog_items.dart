import 'package:flutter/material.dart';
import 'app_circular_progress_indicator.dart';

class MarketCatalogItems extends StatelessWidget {
  final String itemImageURL;
  final String itemTitle;
  const MarketCatalogItems({Key key, this.itemImageURL, this.itemTitle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return itemImageURL != null
        ? Column(
            children: [
              Expanded(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.network(
                    itemImageURL,
                    width: 150,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Text(
                itemTitle,
                style: TextStyle(
                  fontSize: 15,
                ),
              ),
            ],
          )
        : AppCircularProgressIndicator();
  }
}

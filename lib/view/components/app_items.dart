import 'package:flutter/material.dart';
import 'package:market_catalog_final/view/components/app_circular_progress_indicator.dart';

class AppItems extends StatelessWidget {
  final String itemTitle;
  final String itemImageURL;
  final String marketName;
  final Function onPress;

  const AppItems({
    Key key,
    this.itemTitle,
    this.itemImageURL,
    this.marketName,
    this.onPress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: itemImageURL != null
          ? Column(
              children: [
                Expanded(
                  child: Stack(
                    alignment: Alignment.topRight,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: Image.network(
                          itemImageURL,
                          width: MediaQuery.of(context).size.width * 0.5,
                          fit: BoxFit.fill,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(3),
                          ),
                          child: Text(
                            marketName,
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
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
          : AppCircularProgressIndicator(),
    );
  }
}

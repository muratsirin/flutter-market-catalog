import 'package:flutter/material.dart';
import 'package:market_catalog_final/view/components/app_circular_progress_indicator.dart';

class LastAddedItems extends StatelessWidget {
  final String itemTitle;
  final String itemImageURL;
  final String marketName;
  final Function onPress;

  const LastAddedItems({
    Key key,
    this.itemTitle,
    this.itemImageURL,
    this.marketName,
    this.onPress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 20),
      child: GestureDetector(
        onTap: onPress,
        child: itemImageURL != null
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Text(
                      itemTitle,
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Stack(
                    alignment: Alignment.topRight,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: Image.network(
                          itemImageURL,
                          height: 240,
                          width: MediaQuery.of(context).size.width * 0.6,
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
                ],
              )
            : AppCircularProgressIndicator(),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:market_catalog_final/utils/constants.dart';

class AppCircularProgressIndicator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(
        backgroundColor: kIconColorDark,
      ),
    );
  }
}

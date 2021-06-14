import 'package:flutter/material.dart';

appSliverDelegate() {
  return SliverGridDelegateWithFixedCrossAxisCount(
    crossAxisCount: 2,
    crossAxisSpacing: 15,
    mainAxisSpacing: 15,
  );
}

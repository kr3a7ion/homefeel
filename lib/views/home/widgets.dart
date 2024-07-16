import 'package:flutter/material.dart';

IconButton customIcon32(
  Function() onTapped, {
  double theHeight = 28,
  required String theIconPath,
}) {
  return IconButton(
      onPressed: onTapped,
      icon: Image.asset(
        theIconPath,
        height: theHeight,
      ));
}

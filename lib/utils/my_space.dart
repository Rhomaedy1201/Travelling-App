import 'package:flutter/material.dart';

Widget spaceHeight(space) {
  return SizedBox(
    height: double.parse(
      space.toString(),
    ),
  );
}

Widget spaceWidth(space) {
  return SizedBox(
    width: double.parse(
      space.toString(),
    ),
  );
}

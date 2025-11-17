import 'package:flutter/material.dart';
import 'package:smart_med/presentation/components/tag_item.dart';

Widget TagsRow() {
  return Wrap(
    spacing: 8,
    children: [
      TagItem("All", selected: true),
      TagItem("General"),
      TagItem("Dentist"),
      TagItem("Nutritionist"),
    ],
  );
}
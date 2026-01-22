import 'package:flutter/material.dart';
import 'package:smart_med/presentation/components/tag_item.dart';

Widget TagsRow() {
  return SingleChildScrollView(
    scrollDirection: Axis.horizontal,
    child: Row(
      children: [
        TagItem("All", selected: true),
        SizedBox(width: 12),
        TagItem("Specialist"),
        SizedBox(width: 12),
        TagItem("Surgeon"),
        SizedBox(width: 12),
        TagItem("Treatment"),
      ],
    ),
  );
}

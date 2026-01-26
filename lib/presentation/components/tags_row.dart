import 'package:flutter/material.dart';
import 'package:smart_med/presentation/components/tag_item.dart';

Widget TagsRow() {
  return SingleChildScrollView(
    scrollDirection: Axis.horizontal,
    child: Row(
      children: const [
        TagItem("All", selected: true),
        SizedBox(width: 14),
        TagItem("Specialist"),
        SizedBox(width: 14),
        TagItem("Treatment"),
        SizedBox(width: 14),
        TagItem("Surgeon"),
      ],
    ),
  );
}

import 'package:flutter/material.dart';
import 'package:smart_med/presentation/views/components/tag_item.dart';

Widget TagsRow() {
  return SingleChildScrollView(
    scrollDirection: Axis.horizontal,
    child: Row(
      children: const [
        TagItem("All", selected: true),
        SizedBox(width: 14),
        TagItem("Cardiology"),
        SizedBox(width: 14),
        TagItem("Dentistry"),
        SizedBox(width: 14),
        TagItem("Surgery"),
      ],
    ),
  );
}

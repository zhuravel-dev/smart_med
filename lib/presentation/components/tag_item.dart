import 'package:flutter/material.dart';

Widget TagItem(String text, {bool selected = false}) {
  return ChoiceChip(
    label: Text(text),
    selected: selected,
    backgroundColor: Colors.transparent,
    selectedColor: Colors.transparent,
    labelStyle: TextStyle(
      color: selected ? Colors.blue : Colors.black,
      fontWeight: selected ? FontWeight.bold : FontWeight.normal,
    ),
    onSelected: (_) {},
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(20),
      side: const BorderSide(color: Colors.blue, width: 2),
    ),
  );
}

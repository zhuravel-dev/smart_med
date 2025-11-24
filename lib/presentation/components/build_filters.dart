import 'package:flutter/material.dart';

Widget _buildFilters() {
  int _selectedFilter = 0;

  final items = ["All", "Therapists", "Cardiologists", "Neurologists"];
  return Wrap(
    spacing: 8,
    children: [
      for (int i = 0; i < items.length; i++)
        ChoiceChip(
          label: Text(items[i]),
          selected: _selectedFilter == i,
          //onSelected: (_) => setState(() => _selectedFilter = i),
          backgroundColor: Colors.transparent,
          selectedColor: Colors.transparent,
          labelStyle: TextStyle(
            color: _selectedFilter == i ? Colors.blue : Colors.black,
            fontWeight: _selectedFilter == i
                ? FontWeight.bold
                : FontWeight.normal,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
            side: const BorderSide(color: Colors.blue, width: 2),
          ),
        ),
    ],
  );
}

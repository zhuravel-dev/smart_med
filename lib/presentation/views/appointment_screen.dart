import 'package:flutter/material.dart';
import 'package:smart_med/presentation/components/doctor_list.dart';

class AppointmentScreen extends StatefulWidget {
  const AppointmentScreen({super.key});

  @override
  State<AppointmentScreen> createState() => _AppointmentScreenState();
}

class _AppointmentScreenState extends State<AppointmentScreen> {
  int _selectedFilter = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Appointment Screen",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            DoctorList(context),

          ],
        ),
      ),
    );
  }

  Widget _buildFilters() {
    final items = ["All", "Specialist", "Surgery", "Treatment"];
    return Wrap(
      spacing: 8,
      children: [
        for (int i = 0; i < items.length; i++)
          ChoiceChip(
            label: Text(items[i]),
            selected: _selectedFilter == i,
            onSelected: (_) => setState(() => _selectedFilter = i),
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
}

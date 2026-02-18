import 'package:flutter/material.dart';
import 'package:smart_med/presentation/components/list_of_doctors.dart';
import 'package:smart_med/presentation/components/custom_app_bar.dart';

class AppointmentScreen extends StatefulWidget {
  const AppointmentScreen({super.key});

  @override
  State<AppointmentScreen> createState() => _AppointmentScreenState();
}

class _AppointmentScreenState extends State<AppointmentScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: CustomAppBar(title: "Appointments"),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
          ),
          Expanded(child: ListOfDoctors()),
        ],
      ),
    );
  }
}

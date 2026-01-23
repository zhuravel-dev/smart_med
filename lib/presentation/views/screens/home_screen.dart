import 'package:flutter/material.dart';
import 'package:smart_med/infra/constants.dart';
import 'package:smart_med/presentation/components/home_greeting_header.dart';
import 'package:smart_med/presentation/components/main_card.dart';
import 'package:smart_med/presentation/components/make_appointment_title.dart';
import 'package:smart_med/presentation/components/tags_row.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: SafeArea(
        bottom: true,
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
          children: [
            const SizedBox(height: 6),
            HomeGreetingHeader(),
            const SizedBox(height: 20),
            MakeAppointmentTitle(),
            const SizedBox(height: 16),
            TagsRow(),
            const SizedBox(height: 12),
            MainCard(
              color: const Color(0xff2F6BFF),
              doctorType: "Neurosurgery",
              time: "10:50 - 02:40",
              doctorsAvailable: 12,
              avatarImage: neurosurgery.first,
              onTap: () {},
            ),
            MainCard(
              color: Colors.white,
              isLight: true,
              doctorType: "Cardiology",
              time: "09:00 - 12:30",
              doctorsAvailable: 8,
              avatarImage: cardiology.first,
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}

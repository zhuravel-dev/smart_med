import 'package:flutter/material.dart';
import 'package:smart_med/presentation/components/home_greeting_header.dart';
import 'package:smart_med/presentation/components/main_cards_row.dart';
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
      backgroundColor: Color(0xFFE1E9FB),
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
            MainCardsRow(),
          ],
        ),
      ),
    );
  }
}

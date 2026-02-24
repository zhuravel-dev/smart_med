import 'package:flutter/material.dart';
import 'package:smart_med/presentation/views/components/home_greeting_header.dart';
import 'package:smart_med/presentation/views/components/main_cards_row.dart';
import 'package:smart_med/presentation/views/components/make_appointment_title.dart';
import 'package:smart_med/presentation/views/components/tags_row.dart';

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
            const SizedBox(height: 8),
            HomeGreetingHeader(),
            const SizedBox(height: 20),
            MakeAppointmentTitle(),
            const SizedBox(height: 24),
            TagsRow(),
            const SizedBox(height: 16),
            MainCardsRow(),
          ],
        ),
      ),
    );
  }
}

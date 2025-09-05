import 'package:flutter/material.dart';
import 'package:smart_med/infra/mock/mock_visit_history.dart';
import 'package:smart_med/presentation/components/visit_history_card.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.blue),
        title: const Text(
          "Visit History",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search, color: Colors.blue),
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: mockVisitHistory
                .map(
                  (visit) => Padding(
                    padding: const EdgeInsets.only(bottom: 16),
                    child: VisitHistoryCard(
                      doctor:
                          "Dr. ${visit.doctor.firstName} ${visit.doctor.lastName}",
                      speciality: visit.doctor.specialization,
                      datetime: visit.datetime,
                      highlighted: visit.highlighted,
                    ),
                  ),
                )
                .toList(),
          ),
        ),
      ),
    );
  }
}

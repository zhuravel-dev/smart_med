import 'package:smart_med/domain/entities/visit_history_model.dart';
import 'mock_doctors.dart';

final mockVisitHistory = [
  VisitHistory(
    doctor: mockDoctors.firstWhere((d) => d.id == 1),
    datetime: "12 Aug 2026 • 10:30 AM",
    highlighted: true,
  ),
  VisitHistory(
    doctor: mockDoctors.firstWhere((d) => d.id == 2),
    datetime: "05 Aug 2026 • 02:00 PM",
  ),
  VisitHistory(
    doctor: mockDoctors.firstWhere((d) => d.id == 3),
    datetime: "28 Jul 2026 • 09:15 AM",
  ),
];

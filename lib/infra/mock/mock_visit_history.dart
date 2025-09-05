import 'package:smart_med/domain/entities/doctor_model.dart';
import 'package:smart_med/domain/entities/visit_history.dart';

final mockVisitHistory = [
  VisitHistory(
    doctor: Doctor(
      id: 1,
      firstName: "John",
      lastName: "Smith",
      specialization: "Cardiologist",
      experienceYears: 15,
      rating: 4.7,
      reviews: ["Very professional", "Helpful advice"],
      workingHours: "09:00 - 17:00",
      patientsCount: 200,
      aboutMe: "Specialist in cardiovascular health.",
    ),
    datetime: "12 Aug 2025 • 10:30 AM",
    highlighted: true,
  ),
  VisitHistory(
    doctor: Doctor(
      id: 2,
      firstName: "Anna",
      lastName: "Lee",
      specialization: "Dentist",
      experienceYears: 10,
      rating: 4.5,
      reviews: ["Gentle treatment", "Explains everything clearly"],
      workingHours: "10:00 - 18:00",
      patientsCount: 150,
      aboutMe: "Passionate about dental care.",
    ),
    datetime: "05 Aug 2025 • 02:00 PM",
  ),
  VisitHistory(
    doctor: Doctor(
      id: 3,
      firstName: "Michael",
      lastName: "Brown",
      specialization: "Neurologist",
      experienceYears: 20,
      rating: 4.9,
      reviews: ["Expert in his field", "Very attentive"],
      workingHours: "08:00 - 16:00",
      patientsCount: 300,
      aboutMe: "Experienced neurologist with focus on brain health.",
    ),
    datetime: "28 Jul 2025 • 09:15 AM",
  ),
];

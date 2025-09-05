import 'package:smart_med/domain/entities/doctor_model.dart';

final mockDoctors = [
  Doctor(
    id: 1,
    firstName: "John",
    lastName: "Doe",
    specialization: "Therapist",
    experienceYears: 12,
    rating: 4.8,
    reviews: ["Great doctor", "Very attentive"],
    workingHours: "09:00 - 17:00",
    patientsCount: 120,
    aboutMe:
        "I am a therapist with many years of experience. I enjoy helping people and focusing on preventive healthcare.",
  ),
  Doctor(
    id: 2,
    firstName: "Anna",
    lastName: "Smith",
    specialization: "Cardiologist",
    experienceYears: 8,
    rating: 4.6,
    reviews: ["Professional", "Caring"],
    workingHours: "10:00 - 18:00",
    patientsCount: 95,
    aboutMe: "Passionate about heart health and patient care.",
  ),
];

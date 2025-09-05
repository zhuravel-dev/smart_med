import 'package:smart_med/domain/entities/doctor_model.dart';

class VisitHistory {
  final Doctor doctor;
  final String datetime;
  final bool highlighted;

  VisitHistory({
    required this.doctor,
    required this.datetime,
    this.highlighted = false,
  });
}

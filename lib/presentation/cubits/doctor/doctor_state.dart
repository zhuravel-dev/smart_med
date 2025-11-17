import 'package:smart_med/domain/entities/doctor_model.dart';

class DoctorState {
  final Doctor? doctor;
  final bool isLoading;

  const DoctorState({this.doctor, this.isLoading = false});

  DoctorState copyWith({
    Doctor? doctor,
    bool? isLoading,
  }) {
    return DoctorState(
      doctor: doctor ?? this.doctor,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}

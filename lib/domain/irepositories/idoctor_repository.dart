import 'package:smart_med/domain/entities/doctor_model.dart';

abstract class IDoctorRepository {
  Future<Doctor> getDoctor();
  Future<void> updateDoctor(Doctor doctor);
  Future<void> deleteDoctor();
}

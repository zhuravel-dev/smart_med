import 'package:smart_med/domain/entities/doctor.dart';

abstract class IDoctorRepository {
  Future<Doctor> getDoctor();
  Future<void> updateDoctor(Doctor doctor);
  Future<void> deleteDoctor();
}

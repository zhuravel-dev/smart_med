import 'package:smart_med/domain/entities/doctor.dart';
import 'package:smart_med/infra/helpers/result.dart';

abstract class IDoctorApi {
  Future<Result<Doctor>> getCurrentDoctor();
  Future<Result<Doctor>> getDoctorById(int doctorId);
  Future<Result<void>> updateDoctor(Doctor doctor);
  Future<Result<void>> deleteDoctor(int doctorId);
}

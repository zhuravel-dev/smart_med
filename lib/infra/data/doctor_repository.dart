import 'package:smart_med/domain/entities/doctor.dart';
import 'package:get_it/get_it.dart';
import 'package:smart_med/domain/irepositories/idoctor_repository.dart';
import 'package:smart_med/domain/iservices/idoctor_api.dart';

class DoctorRepository implements IDoctorRepository {
  final _doctorApi = GetIt.I<IDoctorApi>();

  @override
  Future<Doctor> getDoctor() async {
    final result = await _doctorApi.getCurrentDoctor();
    if (result.hasData && result.data != null) {
      return result.data!;
    } else {
      throw result.exception ??
          Exception('Error in DoctorRepository getDoctor()');
    }
  }

  @override
  Future<void> updateDoctor(Doctor doctor) async {
    final result = await _doctorApi.updateDoctor(doctor);
    if (result.hasError) {
      throw result.exception!;
    }
  }

  @override
  Future<void> deleteDoctor() async {
    final doctor = await getDoctor();
    final result = await _doctorApi.deleteDoctor(doctor.id);
    if (result.hasError) {
      throw result.exception!;
    }
  }
}

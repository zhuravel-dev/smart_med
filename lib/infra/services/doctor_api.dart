import 'dart:async';
import 'package:smart_med/domain/entities/doctor_model.dart';
import 'package:smart_med/domain/iservices/idoctor_api.dart';
import 'package:smart_med/infra/helpers/result.dart';
import 'package:smart_med/infra/helpers/failures.dart';

class DoctorApi implements IDoctorApi {
  Doctor _currentDoctor = Doctor(
    id: 1,
    firstName: 'First Name',
    lastName: 'Last Name',
    specialization: 'specialization',
    experienceYears: 10,
    rating: 4.7,
    reviews: ['review1', 'review2'],
    workingHours: '09:00 - 18:00',
    patientsCount: 120,
    recoveredPatients: 80,
    inCare: 25,
    free: 15,
    aboutMe: 'About Me',
  );

  bool throwException = false;
  bool throwFailure = false;

  @override
  Future<Result<Doctor>> getCurrentDoctor() async {
    if (throwException) return Result.error(Exception('Simulated exception'));
    if (throwFailure) return Result.failure(Failure.serverFailure());

    return Result.correct(_currentDoctor);
  }

  @override
  Future<Result<Doctor>> getDoctorById(int doctorId) async {
    if (throwException) return Result.error(Exception('Simulated exception'));
    if (throwFailure) return Result.failure(Failure.serverFailure());

    if (_currentDoctor.id == doctorId) {
      return Result.correct(_currentDoctor);
    } else {
      return Result.error(Exception('Doctor not found'));
    }
  }

  @override
  Future<Result<void>> updateDoctor(Doctor doctor) async {
    if (throwException) return Result.error(Exception('Simulated exception'));
    if (throwFailure) return Result.failure(Failure.serverFailure());

    if (_currentDoctor.id == doctor.id) {
      _currentDoctor = _currentDoctor.copyWith(
        firstName: doctor.firstName,
        lastName: doctor.lastName,
        specialization: doctor.specialization,
        experienceYears: doctor.experienceYears,
        rating: doctor.rating,
        reviews: doctor.reviews,
        workingHours: doctor.workingHours,
        patientsCount: doctor.patientsCount,
        recoveredPatients: doctor.recoveredPatients,
        inCare: doctor.inCare,
        free: doctor.free,
        aboutMe: doctor.aboutMe,
      );
      return Result.empty();
    } else {
      return Result.error(Exception('Doctor not found'));
    }
  }

  @override
  Future<Result<void>> deleteDoctor(int doctorId) async {
    if (throwException) return Result.error(Exception('Simulated exception'));
    if (throwFailure) return Result.failure(Failure.serverFailure());

    if (_currentDoctor.id == doctorId) {
      _currentDoctor = Doctor(
        id: 1,
        firstName: '',
        lastName: '',
        specialization: '',
        experienceYears: 0,
        rating: 0.0,
        reviews: [],
        workingHours: '',
        patientsCount: 0,
        recoveredPatients: 0,
        inCare: 0,
        free: 0,
        aboutMe: '',
      );
      return Result.empty();
    } else {
      return Result.error(Exception('Doctor not found'));
    }
  }
}

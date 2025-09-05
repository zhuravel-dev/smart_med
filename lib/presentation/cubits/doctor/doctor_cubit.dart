import 'package:get_it/get_it.dart';
import 'package:bloc/bloc.dart';
import 'package:smart_med/domain/entities/doctor_model.dart';
import 'package:smart_med/domain/irepositories/idoctor_repository.dart';
import 'package:smart_med/presentation/cubits/doctor/doctor_state.dart';

class DoctorCubit extends Cubit<DoctorState> {
  final _doctorRepository = GetIt.I<IDoctorRepository>();

  DoctorCubit() : super(const DoctorState(isLoading: true));

  Future<void> loadDoctor() async {
    emit(state.copyWith(isLoading: true));
    final doctor = await _doctorRepository.getDoctor();
    emit(DoctorState(doctor: doctor, isLoading: false));
  }

  Future<void> updateDoctor(Doctor doctor) async {
    await _doctorRepository.updateDoctor(doctor);
    await loadDoctor();
  }

  Future<void> deleteDoctor() async {
    await _doctorRepository.deleteDoctor();
    emit(const DoctorState(doctor: null, isLoading: false));
  }
}

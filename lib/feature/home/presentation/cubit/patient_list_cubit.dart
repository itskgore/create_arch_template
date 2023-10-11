import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:patientvisit/feature/home/domain/models/patients_list_model.dart';
import 'package:patientvisit/core/helpers/usecase.dart';
import 'package:patientvisit/feature/home/domain/usecase/get_patients_usecase.dart';

part 'patient_list_state.dart';

class PatientListCubit extends Cubit<PatientListState> {
  final GetPatientUsecase getPatientUsecase;
  PatientListCubit({required this.getPatientUsecase})
      : super(PatientListInitial());

  getPatientList() {
    final result = getPatientUsecase(IdParams(id: "1"));
    emit(PatientListLoading());
    result.then((value) => value.fold(
        (l) => emit(PatientListError(l.displayErrorMessage())),
        (r) => emit(PatientListLoaded(r))));
  }
}

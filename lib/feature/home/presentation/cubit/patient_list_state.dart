part of 'patient_list_cubit.dart';

sealed class PatientListState extends Equatable {
  const PatientListState();

  @override
  List<Object> get props => [];
}

final class PatientListInitial extends PatientListState {}

final class PatientListLoading extends PatientListState {}

final class PatientListLoaded extends PatientListState {
  final List<PatientInfoModel> patientList;

  PatientListLoaded(this.patientList);
}

final class PatientListError extends PatientListState {
  final String errorMsg;

  PatientListError(this.errorMsg);
}

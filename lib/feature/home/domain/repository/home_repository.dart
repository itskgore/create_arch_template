import 'package:dartz/dartz.dart';
import 'package:patientvisit/feature/home/domain/models/patients_list_model.dart';
import 'package:patientvisit/core/helpers/failures.dart';

abstract class HomeRepository {
  Future<Either<Failure, List<PatientInfoModel>>> getPatientList(
      {required String id});
}

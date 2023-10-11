import 'package:dartz/dartz.dart';
import 'package:patientvisit/feature/home/domain/models/patients_list_model.dart';
import 'package:patientvisit/core/helpers/failures.dart';
import 'package:patientvisit/core/helpers/usecase.dart';
import 'package:patientvisit/feature/home/domain/repository/home_repository.dart';

class GetPatientUsecase extends UseCase<List<PatientInfoModel>, IdParams> {
  final HomeRepository homeRepository;

  GetPatientUsecase(this.homeRepository);

  @override
  Future<Either<Failure, List<PatientInfoModel>>> call(IdParams params) {
    return homeRepository.getPatientList(id: params.id);
  }
}

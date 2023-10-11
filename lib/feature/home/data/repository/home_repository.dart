import 'package:dartz/dartz.dart';
import 'package:patientvisit/feature/home/domain/models/patients_list_model.dart';
import 'package:patientvisit/core/helpers/failures.dart';
import 'package:patientvisit/feature/home/data/datasource/local_datasource.dart';
import 'package:patientvisit/feature/home/data/datasource/remote_datasource.dart';
import 'package:patientvisit/feature/home/domain/repository/home_repository.dart';

class HomeRepositoryImp extends HomeRepository {
  final RemoteHomeDatasource remoteHomeDatasource;
  final LocalHomeDatasource localHomeDatasource;

  HomeRepositoryImp(this.remoteHomeDatasource, this.localHomeDatasource);
  @override
  Future<Either<Failure, List<PatientInfoModel>>> getPatientList(
      {required String id}) async {
    try {
      final data = await remoteHomeDatasource.getPatientList(id: id);
      return Right(data);
    } on Failure catch (e) {
      return Left(e);
    }
  }
}

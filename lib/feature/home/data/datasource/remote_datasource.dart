import 'dart:convert';

import 'package:patientvisit/core/config/repository_config.dart';
import 'package:patientvisit/feature/home/domain/models/patients_list_model.dart';
import 'package:patientvisit/core/helpers/failures.dart';

abstract class RemoteHomeDatasource {
  Future<List<PatientInfoModel>> getPatientList({required String id});
}

class RemoteHomeDatasourceImp extends Repository
    implements RemoteHomeDatasource {
  @override
  Future<List<PatientInfoModel>> getPatientList({required String id}) async {
    try {
      final result = await Repository().dio.get('/getPatients$id');
      final response = await hanldeStatusCode(result);
      if (response.status) {
        return jsonDecode(result.data)['data']
            .map((e) => PatientInfoModel.fromJson(e));
      } else {
        throw response.failure ?? const ServerFailure();
      }
    } catch (e) {
      return handleThrownException(e);
    }
  }
}

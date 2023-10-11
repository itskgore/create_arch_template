import 'dart:convert';

import 'package:patientvisit/feature/home/domain/models/patients_list_model.dart';
import 'package:patientvisit/service_registration/dependency_injection.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class LocalHomeDatasource {
  Future<List<PatientInfoModel>> getPatientList();
  Future<bool> storePatientList(List<PatientInfoModel> data);
}

class LocalHomeDatasourceImp extends LocalHomeDatasource {
  @override
  Future<List<PatientInfoModel>> getPatientList() {
    return jsonDecode(
            locator<SharedPreferences>().getString('Patient_list') ?? "")
        .map((e) => PatientInfoModel.fromJson(e));
  }

  @override
  Future<bool> storePatientList(List<PatientInfoModel> data) async {
    return await locator<SharedPreferences>()
        .setString('Patient_list', jsonEncode(data));
  }
}

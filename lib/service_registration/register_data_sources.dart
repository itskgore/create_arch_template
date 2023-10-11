import 'package:patientvisit/feature/home/data/datasource/local_datasource.dart';
import 'package:patientvisit/feature/home/data/datasource/remote_datasource.dart';
import 'package:patientvisit/service_registration/dependency_injection.dart';

class RegisterDataSources {
  RegisterDataSources() {
    locator.registerLazySingleton<RemoteHomeDatasource>(
      () => RemoteHomeDatasourceImp(),
    );
    locator.registerLazySingleton<LocalHomeDatasource>(
      () => LocalHomeDatasourceImp(),
    );
  }
}

import 'package:patientvisit/feature/home/data/repository/home_repository.dart';
import 'package:patientvisit/feature/home/domain/repository/home_repository.dart';
import 'package:patientvisit/service_registration/dependency_injection.dart';

class RegisterRepository {
  RegisterRepository() {
    locator.registerLazySingleton<HomeRepository>(
      () => HomeRepositoryImp(locator(), locator()),
    );
  }
}

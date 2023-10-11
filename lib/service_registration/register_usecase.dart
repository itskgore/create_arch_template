import 'package:patientvisit/feature/home/domain/usecase/get_patients_usecase.dart';
import 'package:patientvisit/service_registration/dependency_injection.dart';

class RegisterUseCases {
  RegisterUseCases() {
    locator.registerLazySingleton(() => GetPatientUsecase(locator()));
  }
}

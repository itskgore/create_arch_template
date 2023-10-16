import 'package:patientvisit/feature/home/data/repository/home_repository.dart';
import 'package:patientvisit/feature/home/domain/repository/home_repository.dart';
import 'package:patientvisit/feature/voice_recorder/data/repository/submit_recording_repository_impl.dart';
import 'package:patientvisit/feature/voice_recorder/domain/repository/submit_recording_repository.dart';
import 'package:patientvisit/service_registration/dependency_injection.dart';

class RegisterRepository {
  RegisterRepository() {
    locator.registerLazySingleton<HomeRepository>(
      () => HomeRepositoryImp(locator(), locator()),
    );
    locator.registerLazySingleton<SubmitRecordingRepository>(
        () => SubmitRecordingRepositoryImpl(locator()));
  }
}

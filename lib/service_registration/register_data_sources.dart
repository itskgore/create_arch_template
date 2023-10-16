import 'package:patientvisit/feature/home/data/datasource/local_datasource.dart';
import 'package:patientvisit/feature/home/data/datasource/remote_datasource.dart';
import 'package:patientvisit/feature/voice_recorder/data/datasource/submit_recording_remote_src.dart';
import 'package:patientvisit/feature/voice_recorder/data/datasource/submit_recording_remote_src_impl.dart';
import 'package:patientvisit/service_registration/dependency_injection.dart';

class RegisterDataSources {
  RegisterDataSources() {
    locator.registerLazySingleton<RemoteHomeDatasource>(
      () => RemoteHomeDatasourceImp(),
    );
    locator.registerLazySingleton<LocalHomeDatasource>(
      () => LocalHomeDatasourceImp(),
    );
    locator.registerLazySingleton<SubmitRecordingRemoteSrc>(
        () => SubmitRecordingRemoteSrcImpl());
  }
}

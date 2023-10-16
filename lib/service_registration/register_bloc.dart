import 'package:patientvisit/feature/home/presentation/cubit/patient_list_cubit.dart';
import 'package:patientvisit/feature/voice_recorder/presentation/cubit/voice_recorder_cubit.dart';
import 'package:patientvisit/service_registration/dependency_injection.dart';

class RegisterBlocs {
  RegisterBlocs() {
    locator.registerFactory(
      () => PatientListCubit(getPatientUsecase: locator()),
    );
    locator.registerFactory(
        () => VoiceRecorderCubit(submitRecordingUsecase: locator()));
  }
}

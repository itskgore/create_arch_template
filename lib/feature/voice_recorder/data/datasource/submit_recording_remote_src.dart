import 'package:patientvisit/feature/voice_recorder/domain/models/submit_recording_response_model.dart';

abstract class SubmitRecordingRemoteSrc {
  Future<SubmitRecordingResponseModel> submitRecording(
      {required String audioPath});
}

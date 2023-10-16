import 'package:patientvisit/core/config/repository_config.dart';
import 'package:patientvisit/feature/voice_recorder/data/datasource/submit_recording_remote_src.dart';
import 'package:patientvisit/feature/voice_recorder/domain/models/submit_recording_response_model.dart';

class SubmitRecordingRemoteSrcImpl extends Repository
    implements SubmitRecordingRemoteSrc {
  @override
  Future<SubmitRecordingResponseModel> submitRecording(
      {required String audioPath}) {
    // TODO: implement submitRecording
    throw UnimplementedError();
  }
}

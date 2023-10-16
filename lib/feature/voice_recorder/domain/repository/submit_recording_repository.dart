import 'package:dartz/dartz.dart';
import 'package:patientvisit/core/helpers/failures.dart';
import 'package:patientvisit/feature/voice_recorder/domain/models/submit_recording_response_model.dart';

abstract class SubmitRecordingRepository {
  Future<Either<Failure, SubmitRecordingResponseModel>> submitRecording(
      {required String audioPath});
}

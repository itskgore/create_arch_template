import 'package:dartz/dartz.dart';
import 'package:patientvisit/core/helpers/failures.dart';
import 'package:patientvisit/feature/voice_recorder/data/datasource/submit_recording_remote_src.dart';
import 'package:patientvisit/feature/voice_recorder/domain/models/submit_recording_response_model.dart';
import 'package:patientvisit/feature/voice_recorder/domain/repository/submit_recording_repository.dart';

class SubmitRecordingRepositoryImpl implements SubmitRecordingRepository {
  final SubmitRecordingRemoteSrc submitRecordingRemoteSrc;

  SubmitRecordingRepositoryImpl(this.submitRecordingRemoteSrc);

  @override
  Future<Either<Failure, SubmitRecordingResponseModel>> submitRecording(
      {required String audioPath}) async {
    try {
      final data =
          await submitRecordingRemoteSrc.submitRecording(audioPath: audioPath);
      return Right(data);
    } on Failure catch (e) {
      return Left(e);
    }
  }
}

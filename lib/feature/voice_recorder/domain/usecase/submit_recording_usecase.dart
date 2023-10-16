import 'package:dartz/dartz.dart';
import 'package:patientvisit/core/helpers/failures.dart';
import 'package:patientvisit/core/helpers/usecase.dart';
import 'package:patientvisit/feature/voice_recorder/domain/models/submit_recording_response_model.dart';
import 'package:patientvisit/feature/voice_recorder/domain/repository/submit_recording_repository.dart';

class SubmitRecordingUsecase
    extends UseCase<SubmitRecordingResponseModel, String> {
  final SubmitRecordingRepository submitRecordingRepository;

  SubmitRecordingUsecase(this.submitRecordingRepository);

  @override
  Future<Either<Failure, SubmitRecordingResponseModel>> call(String params) {
    return submitRecordingRepository.submitRecording(audioPath: params);
  }
}

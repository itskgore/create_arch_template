import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:patientvisit/feature/voice_recorder/domain/usecase/submit_recording_usecase.dart';
import 'package:patientvisit/feature/voice_recorder/presentation/cubit/voice_recorder_state.dart';

class VoiceRecorderCubit extends Cubit<VoiceRecorderState> {
  final SubmitRecordingUsecase submitRecordingUsecase;
  VoiceRecorderCubit({required this.submitRecordingUsecase})
      : super(VoiceRecorderInitial());

  changeShowPlayer(bool player) {
    emit(ShowPlayerState(player));
  }

  updatePlayer(String path, bool player) {
    emit(UpdatePlayerState(path, player));
  }

  submitRecording(String audioPath) {
    final result = submitRecordingUsecase(audioPath);
    emit(VoiceRecorderLoading());
    //TODO: emit the error and loaded states
  }
}

import 'package:equatable/equatable.dart';

sealed class VoiceRecorderState extends Equatable {
  const VoiceRecorderState();

  @override
  List<Object> get props => [];
}

final class VoiceRecorderInitial extends VoiceRecorderState {}

final class VoiceRecorderLoading extends VoiceRecorderState {}

final class ShowPlayerState extends VoiceRecorderState {
  final bool showPlayer;

  const ShowPlayerState(this.showPlayer);
}

final class UpdatePlayerState extends VoiceRecorderState {
  final String audioPath;
  final bool showPlayer;

  const UpdatePlayerState(this.audioPath, this.showPlayer);
}

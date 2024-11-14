import 'package:youtube_player_flutter/youtube_player_flutter.dart';

abstract class TrailerState {}

class TrailerStateFailure extends TrailerState {
  final String errorMessage;

  TrailerStateFailure({required this.errorMessage});
}

class TrailerStateLoaded extends TrailerState {
  final YoutubePlayerController youtubePlayerController;

  TrailerStateLoaded({required this.youtubePlayerController});
}

class TrailerStateLoading extends TrailerState {}

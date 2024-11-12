import 'package:movies/domain/movie/entities/movie_entity.dart';

abstract class NowPlayingState {}

class NowPlayingStateFailure extends NowPlayingState {
  final String errorMessage;

  NowPlayingStateFailure({required this.errorMessage});
}

class NowPlayingStateLoaded extends NowPlayingState {
  final List<MovieEntity> movie;

  NowPlayingStateLoaded({required this.movie});
}

class NowPlayingStateLoading extends NowPlayingState {}

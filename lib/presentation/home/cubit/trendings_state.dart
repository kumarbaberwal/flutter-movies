import 'package:movies/domain/movie/entities/movie_entity.dart';

abstract class TrendingsState {}

class TrendingsStateFailure extends TrendingsState {
  final String errorMessage;

  TrendingsStateFailure({required this.errorMessage});
}

class TrendingsStateLoaded extends TrendingsState {
  final List<MovieEntity> movie;

  TrendingsStateLoaded({required this.movie});
}

class TrendingsStateLoading extends TrendingsState {}

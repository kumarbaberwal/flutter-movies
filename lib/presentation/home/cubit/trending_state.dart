import 'package:movies/domain/movie/entities/movie_entity.dart';

abstract class TrendingState {}

class TrendingStateFailure extends TrendingState {
  final String errorMessage;

  TrendingStateFailure({required this.errorMessage});
}

class TrendingStateLoaded extends TrendingState {
  final List<MovieEntity> movie;

  TrendingStateLoaded({required this.movie});
}

class TrendingStateLoading extends TrendingState {}

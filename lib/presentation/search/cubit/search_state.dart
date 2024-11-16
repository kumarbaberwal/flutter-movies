import 'package:movies/domain/movie/entities/movie_entity.dart';
import 'package:movies/domain/tv/entities/tv_entity.dart';

class MovieLoaded extends SearchState {
  final List<MovieEntity> movieEntity;

  MovieLoaded({required this.movieEntity});
}

abstract class SearchState {}

class SearchStateFailure extends SearchState {
  final String errorMessage;

  SearchStateFailure({required this.errorMessage});
}

class SearchStateInitial extends SearchState {}

class SearchStateLoading extends SearchState {}

class TvLoaded extends SearchState {
  final List<TvEntity> tvEntity;

  TvLoaded({required this.tvEntity});
}

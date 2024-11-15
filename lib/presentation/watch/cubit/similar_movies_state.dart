import 'package:movies/domain/movie/entities/movie_entity.dart';

abstract class SimilarMoviesState {}

class SimilarMoviesStateFailure extends SimilarMoviesState {
  final String errorMessage;

  SimilarMoviesStateFailure({required this.errorMessage});
}

class SimilarMoviesStateLoaded extends SimilarMoviesState {
  final List<MovieEntity> movieEntity;

  SimilarMoviesStateLoaded({required this.movieEntity});
}

class SimilarMoviesStateLoading extends SimilarMoviesState {}

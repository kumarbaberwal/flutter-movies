import 'package:movies/domain/movie/entities/movie_entity.dart';

abstract class RecommendationMoviesState {}

class RecommendationMoviesStateFailure extends RecommendationMoviesState {
  final String errorMessage;

  RecommendationMoviesStateFailure({required this.errorMessage});
}

class RecommendationMoviesStateLoaded extends RecommendationMoviesState {
  final List<MovieEntity> movieEntity;

  RecommendationMoviesStateLoaded({required this.movieEntity});
}

class RecommendationMoviesStateLoading extends RecommendationMoviesState {}

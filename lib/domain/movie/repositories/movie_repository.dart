import 'package:dartz/dartz.dart';

abstract class MovieRepository {
  Future<Either> getMovieTrailer(int movieId);
  Future<Either> getNowPlayingMovies();
  Future<Either> getRecommendationMovies(int movieId);
  Future<Either> getSimilarMovies(int movieId);
  Future<Either> getTrendingMovies();
}

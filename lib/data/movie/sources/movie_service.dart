import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:movies/core/constants/api_url.dart';
import 'package:movies/core/network/dio_client.dart';
import 'package:movies/service_locator.dart';

class MovieApiServiceImpl extends MovieService {
  @override
  Future<Either> getMovieTrailer(int movieId) async {
    try {
      var response =
          await sl<DioClient>().get("${ApiUrl.movie}$movieId/trailer");
      return Right(response.data);
    } on DioException catch (e) {
      return Left(e.response!.data['message']);
    }
  }

  @override
  Future<Either> getNowPlayingMovies() async {
    try {
      var response = await sl<DioClient>().get(ApiUrl.nowPlayingMovies);
      return Right(response.data);
    } on DioException catch (e) {
      return Left(e.response!.data['message']);
    }
  }

  @override
  Future<Either> getRecommendationMovies(int movieId) async {
    try {
      var response =
          await sl<DioClient>().get("${ApiUrl.movie}$movieId/recommendations");
      return Right(response.data);
    } on DioException catch (e) {
      return Left(e.response!.data['message']);
    }
  }

  @override
  Future<Either> getSimilarMovies(int movieId) async {
    try {
      var response =
          await sl<DioClient>().get("${ApiUrl.movie}$movieId/similar");
      return Right(response.data);
    } on DioException catch (e) {
      return Left(e.response!.data['message']);
    }
  }

  @override
  Future<Either> getTrendingMovies() async {
    try {
      var response = await sl<DioClient>().get(ApiUrl.trendingMovies);
      return Right(response.data);
    } on DioException catch (e) {
      return Left(e.response!.data['message']);
    }
  }

  @override
  Future<Either> searchMovie(String query) async {
    try {
      var response = await sl<DioClient>().get("${ApiUrl.search}movie/$query");
      return Right(response.data);
    } on DioException catch (e) {
      return Left(e.response!.data['message']);
    }
  }
}

abstract class MovieService {
  Future<Either> getMovieTrailer(int movieId);
  Future<Either> getNowPlayingMovies();
  Future<Either> getRecommendationMovies(int movieId);
  Future<Either> getSimilarMovies(int movieId);
  Future<Either> getTrendingMovies();
  Future<Either> searchMovie(String query);
}

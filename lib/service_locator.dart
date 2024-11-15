import 'package:get_it/get_it.dart';
import 'package:movies/core/network/dio_client.dart';
import 'package:movies/data/auth/repositories/auth_repository_impl.dart';
import 'package:movies/data/auth/sources/auth_api_service.dart';
import 'package:movies/data/movie/repositories/movie_repository_impl.dart';
import 'package:movies/data/movie/sources/movie_service.dart';
import 'package:movies/data/tv/repositories/tv_repository_impl.dart';
import 'package:movies/data/tv/sources/tv_service.dart';
import 'package:movies/domain/auth/repositories/auth_repository.dart';
import 'package:movies/domain/auth/usecases/is_logged_in_use_case.dart';
import 'package:movies/domain/auth/usecases/signin_use_case.dart';
import 'package:movies/domain/auth/usecases/signup_use_case.dart';
import 'package:movies/domain/movie/repositories/movie_repository.dart';
import 'package:movies/domain/movie/usecases/get_movie_trailer_use_case.dart';
import 'package:movies/domain/movie/usecases/get_now_playing_movies_use_case.dart';
import 'package:movies/domain/movie/usecases/get_recommendation_movies_use_case.dart';
import 'package:movies/domain/movie/usecases/get_similar_movies_use_case.dart';
import 'package:movies/domain/movie/usecases/get_trending_movies_use_case.dart';
import 'package:movies/domain/tv/repositories/tv_repository.dart';
import 'package:movies/domain/tv/usecases/get_popular_tv_use_case.dart';

final sl = GetIt.instance;

void serviceLocator() {
  // dio client
  sl.registerSingleton<DioClient>(DioClient());

  // services
  sl.registerSingleton<AuthService>(AuthApiServiceImpl());
  sl.registerSingleton<MovieService>(MovieApiServiceImpl());
  sl.registerSingleton<TvService>(TvApiServiceImpl());

  // repositories
  sl.registerSingleton<AuthRepository>(AuthRepositoryImpl());
  sl.registerSingleton<MovieRepository>(MovieRepositoryImpl());
  sl.registerSingleton<TvRepository>(TvRepositoryImpl());

  // usecases
  sl.registerSingleton<SignupUseCase>(SignupUseCase());
  sl.registerSingleton<SigninUseCase>(SigninUseCase());
  sl.registerSingleton<IsLoggedInUseCase>(IsLoggedInUseCase());
  sl.registerSingleton<GetTrendingMoviesUseCase>(GetTrendingMoviesUseCase());
  sl.registerSingleton<GetNowPlayingMoviesUseCase>(
      GetNowPlayingMoviesUseCase());
  sl.registerSingleton<GetPopularTvUseCase>(GetPopularTvUseCase());
  sl.registerSingleton<GetMovieTrailerUseCase>(GetMovieTrailerUseCase());
  sl.registerSingleton<GetRecommendationMoviesUseCase>(
      GetRecommendationMoviesUseCase());
  sl.registerSingleton<GetSimilarMoviesUseCase>(GetSimilarMoviesUseCase());
}

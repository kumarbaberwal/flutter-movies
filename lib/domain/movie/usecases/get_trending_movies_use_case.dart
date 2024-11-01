import 'package:dartz/dartz.dart';
import 'package:movies/core/usecase/use_case.dart';
import 'package:movies/domain/movie/repositories/movie_repository.dart';
import 'package:movies/service_locator.dart';

class GetTrendingMoviesUseCase extends UseCase<Either, dynamic> {
  @override
  Future<Either> call({params}) async {
    return await sl<MovieRepository>().getTrendingMovies();
  }
}

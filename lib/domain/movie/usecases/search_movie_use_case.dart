import 'package:dartz/dartz.dart';
import 'package:movies/core/usecase/use_case.dart';
import 'package:movies/domain/movie/repositories/movie_repository.dart';
import 'package:movies/service_locator.dart';

class SearchMovieUseCase extends UseCase<Either, String> {
  @override
  Future<Either> call({String? params}) async {
    return await sl<MovieRepository>().searchMovie(params!);
  }
}

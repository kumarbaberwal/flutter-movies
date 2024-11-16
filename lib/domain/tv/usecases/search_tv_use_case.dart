import 'package:dartz/dartz.dart';
import 'package:movies/core/usecase/use_case.dart';
import 'package:movies/domain/tv/repositories/tv_repository.dart';
import 'package:movies/service_locator.dart';

class SearchTvUseCase extends UseCase<Either, String> {
  @override
  Future<Either> call({String? params}) async {
    return await sl<TvRepository>().searchTv(params!);
  }
}

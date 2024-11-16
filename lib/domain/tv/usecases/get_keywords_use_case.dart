import 'package:dartz/dartz.dart';
import 'package:movies/core/usecase/use_case.dart';
import 'package:movies/domain/tv/repositories/tv_repository.dart';
import 'package:movies/service_locator.dart';

class GetKeywordsUseCase extends UseCase<Either, int> {
  @override
  Future<Either> call({int? params}) async {
    return await sl<TvRepository>().getKeywords(params!);
  }
}

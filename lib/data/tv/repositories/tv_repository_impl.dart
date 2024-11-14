import 'package:dartz/dartz.dart';
import 'package:movies/common/helper/mapper/tv_mapper.dart';
import 'package:movies/data/tv/models/tv_model.dart';
import 'package:movies/data/tv/sources/tv_service.dart';
import 'package:movies/domain/tv/repositories/tv_repository.dart';
import 'package:movies/service_locator.dart';

class TvRepositoryImpl extends TvRepository {
  @override
  Future<Either> getPopularTv() async {
    var returnedData = await sl<TvService>().getPopularTv();
    return returnedData.fold((error) {
      return Left(error);
    }, (data) {
      var tv = List.from(data['content'])
          .map((item) => TvMapper.toEntity(TVModel.fromJson(item)))
          .toList();
      return Right(tv);
    });
  }
}

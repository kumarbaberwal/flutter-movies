import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:movies/core/constants/api_url.dart';
import 'package:movies/core/network/dio_client.dart';
import 'package:movies/service_locator.dart';

class TvApiServiceImpl extends TvService {
  @override
  Future<Either> getPopularTv() async {
    try {
      var response = await sl<DioClient>().get(
        ApiUrl.popularTV,
      );
      return Right(response.data);
    } on DioException catch (e) {
      return Left(e.response!.data['message']);
    }
  }
}

abstract class TvService {
  Future<Either> getPopularTv();
}
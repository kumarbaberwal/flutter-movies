import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:movies/core/constants/api_url.dart';
import 'package:movies/core/network/dio_client.dart';
import 'package:movies/data/auth/models/signin_req_params.dart';
import 'package:movies/data/auth/models/signup_req_params.dart';
import 'package:movies/service_locator.dart';

abstract class AuthService {
  Future<Either> signin(SigninReqParams params);
  Future<Either> signup(SignupReqParams params);
}

class AuthApiServiceImpl extends AuthService {
  @override
  Future<Either> signin(SigninReqParams params) async {
    try {
      var response =
          await sl<DioClient>().post(ApiUrl.signin, data: params.toMap());
      return Right(response.data);
    } on DioException catch (e) {
      return Left(e.response!.data['message']);
    }
  }

  @override
  Future<Either> signup(SignupReqParams params) async {
    try {
      var response =
          await sl<DioClient>().post(ApiUrl.signup, data: params.toMap());
      return Right(response.data);
    } on DioException catch (e) {
      return Left(e.response!.data['message']);
    }
  }
}

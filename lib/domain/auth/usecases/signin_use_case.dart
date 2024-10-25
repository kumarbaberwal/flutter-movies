import 'package:dartz/dartz.dart';
import 'package:movies/core/usecase/use_case.dart';
import 'package:movies/data/auth/models/signin_req_params.dart';
import 'package:movies/domain/auth/repositories/auth_repository.dart';
import 'package:movies/service_locator.dart';

class SigninUseCase extends UseCase<Either, SigninReqParams> {
  @override
  Future<Either> call({SigninReqParams? params}) async {
    return await sl<AuthRepository>().signin(params!);
  }
}

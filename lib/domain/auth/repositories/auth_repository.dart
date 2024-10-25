import 'package:dartz/dartz.dart';
import 'package:movies/data/auth/models/signin_req_params.dart';

import '../../../data/auth/models/signup_req_params.dart';

abstract class AuthRepository {
  Future<bool> isLoggedIn();
  Future<Either> signin(SigninReqParams params);
  Future<Either> signup(SignupReqParams params);
}

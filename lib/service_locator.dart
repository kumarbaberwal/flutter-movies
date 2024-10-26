import 'package:get_it/get_it.dart';
import 'package:movies/core/network/dio_client.dart';
import 'package:movies/data/auth/repositories/auth_repository_impl.dart';
import 'package:movies/data/auth/sources/auth_api_service.dart';
import 'package:movies/domain/auth/repositories/auth_repository.dart';
import 'package:movies/domain/auth/usecases/is_logged_in_use_case.dart';
import 'package:movies/domain/auth/usecases/signin_use_case.dart';
import 'package:movies/domain/auth/usecases/signup_use_case.dart';

final sl = GetIt.instance;

void serviceLocator() {

  // dio client
  sl.registerSingleton<DioClient>(DioClient());


  // services
  sl.registerSingleton<AuthApiService>(AuthApiServiceImpl());

  // repositories
  sl.registerSingleton<AuthRepository>(AuthRepositoryImpl());

  // usecases
  sl.registerSingleton<SignupUseCase>(SignupUseCase());
  sl.registerSingleton<SigninUseCase>(SigninUseCase());
  sl.registerSingleton<IsLoggedInUseCase>(IsLoggedInUseCase());

}
import 'package:movies/core/usecase/use_case.dart';
import 'package:movies/domain/auth/repositories/auth_repository.dart';
import 'package:movies/service_locator.dart';

class IsLoggedInUseCase extends UseCase<bool, dynamic> {
  @override
  Future<bool> call({params}) async {
    return await sl<AuthRepository>().isLoggedIn();
  }
}

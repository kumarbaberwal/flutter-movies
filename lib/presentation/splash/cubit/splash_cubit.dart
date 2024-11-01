import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/domain/auth/usecases/is_logged_in_use_case.dart';
import 'package:movies/presentation/splash/cubit/splash_state.dart';
import 'package:movies/service_locator.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit() : super(DisplaySplash());

  void appStarted() async {
    await Future.delayed(
      const Duration(
        seconds: 2,
      ),
    );

    var isLoggedIn = await sl<IsLoggedInUseCase>().call();
    if (isLoggedIn) {
      emit(Authenticated());
    } else {
      emit(UnAuthenticated());
    }
  }
}

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/presentation/splash/cubit/splash_state.dart';

class SplashCubit extends Cubit<SplashState>{
  SplashCubit(): super(DisplaySplash());

  void appStarted() async {
    await Future.delayed(const Duration(seconds: 2,),);
    emit(UnAuthenticated());
  }
}
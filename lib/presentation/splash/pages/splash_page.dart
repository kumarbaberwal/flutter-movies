import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/common/helper/navigation/app_navigation.dart';
import 'package:movies/core/configs/assets/app_images.dart';
import 'package:movies/presentation/auth/pages/signin_page.dart';
import 'package:movies/presentation/home/pages/home_page.dart';
import 'package:movies/presentation/splash/cubit/splash_cubit.dart';
import 'package:movies/presentation/splash/cubit/splash_state.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<SplashCubit, SplashState>(
        listener: (context, state) {
          if (state is UnAuthenticated){
            AppNavigation.pushAndRemoveUntil(context, SigninPage());
          } else if(state is Authenticated){
            AppNavigation.pushReplacement(context, const HomePage());
          }
        },
        child: Stack(
          children: [
            Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    AppImages.splashBackgroundd,
                  ),
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.center,
                      end: Alignment.bottomCenter,
                      colors: [
                    const Color(0xff1A1B20).withOpacity(0),
                    const Color(0xff1A1B20),
                  ])),
            )
          ],
        ),
      ),
    );
  }
}

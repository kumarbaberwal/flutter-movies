import 'package:fan_carousel_image_slider/fan_carousel_image_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/core/configs/assets/app_images.dart';
import 'package:movies/presentation/home/cubit/trending_cubit.dart';
import 'package:movies/presentation/home/cubit/trending_state.dart';

class TrendingMovies extends StatelessWidget {
  const TrendingMovies({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TrendingCubit()..getTrendingMovies(),
      child: BlocBuilder<TrendingCubit, TrendingState>(
        builder: (context, state) {
          if (state is TrendingStateLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is TrendingStateLoaded) {
            return FanCarouselImageSlider.sliderType1(
              imagesLink: state.movie
                  .map((e) =>
                      AppImages.movieImageBasePath + e.posterPath.toString())
                  .toList(),
              isAssets: false,
              autoPlay: false,
              sliderHeight: 400,
              showIndicator: true,
            );
          }
          if (state is TrendingStateFailure) {
            return Text(state.errorMessage);
          }
          return Container();
        },
      ),
    );
  }
}

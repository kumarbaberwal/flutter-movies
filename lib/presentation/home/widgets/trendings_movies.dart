import 'package:fan_carousel_image_slider/fan_carousel_image_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/core/configs/assets/app_images.dart';
import 'package:movies/presentation/home/cubit/trendings_cubit.dart';
import 'package:movies/presentation/home/cubit/trendings_state.dart';

class TrendingsMovies extends StatelessWidget {
  const TrendingsMovies({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TrendingsCubit()..getTrendingMovies(),
      child: BlocBuilder<TrendingsCubit, TrendingsState>(
        builder: (context, state) {
          if (state is TrendingsStateLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is TrendingsStateLoaded) {
            return FanCarouselImageSlider.sliderType1(
              imagesLink: state.movie
                  .map((item) =>
                      AppImages.movieImageBasePath + item.posterPath.toString())
                  .toList(),
              isAssets: false,
              autoPlay: false,
              sliderHeight: 400,
              showIndicator: true,
            );
          }
          if (state is TrendingsStateFailure) {
            return Text(state.errorMessage);
          }
          return Container();
        },
      ),
    );
  }
}

// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/common/widgets/movie/movie_card.dart';
import 'package:movies/presentation/watch/cubit/recommendation_movies_cubit.dart';
import 'package:movies/presentation/watch/cubit/recommendation_movies_state.dart';

class RecommendationMovies extends StatelessWidget {
  final int movieId;
  const RecommendationMovies({
    super.key,
    required this.movieId,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          RecommendationMoviesCubit()..getRecommendationMovies(movieId),
      child: BlocBuilder<RecommendationMoviesCubit, RecommendationMoviesState>(
        builder: (context, state) {
          if (state is RecommendationMoviesStateLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is RecommendationMoviesStateLoaded) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Recommendation",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                SizedBox(
                  height: 300,
                  child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return MovieCard(movieEntity: state.movieEntity[index]);
                      },
                      separatorBuilder: (context, index) => const SizedBox(
                            width: 10,
                          ),
                      itemCount: state.movieEntity.length),
                ),
              ],
            );
          }
          if (state is RecommendationMoviesStateFailure) {
            return Center(
              child: Text(state.errorMessage),
            );
          }
          return Container();
        },
      ),
    );
  }
}

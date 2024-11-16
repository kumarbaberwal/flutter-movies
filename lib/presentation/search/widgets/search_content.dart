import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/common/widgets/movie/movie_card.dart';
import 'package:movies/common/widgets/tv/tv_card.dart';
import 'package:movies/presentation/search/cubit/search_cubit.dart';
import 'package:movies/presentation/search/cubit/search_state.dart';

class SearchContent extends StatelessWidget {
  const SearchContent({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit, SearchState>(
      builder: (context, state) {
        if (state is SearchStateLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        if (state is MovieLoaded) {
          return GridView.builder(
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              childAspectRatio: 0.6,
            ),
            itemBuilder: (context, index) {
              return MovieCard(movieEntity: state.movieEntity[index]);
            },
            itemCount: state.movieEntity.length,
          );
        }
        if (state is TvLoaded) {
          return GridView.builder(
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              childAspectRatio: 0.6,
            ),
            itemBuilder: (context, index) {
              return TvCard(tvEntity: state.tvEntity[index]);
            },
            itemCount: state.tvEntity.length,
          );
        }
        return Container();
      },
    );
  }
}

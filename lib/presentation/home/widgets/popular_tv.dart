import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/common/widgets/tv/tv_card.dart';
import 'package:movies/presentation/home/cubit/popular_tv_cubit.dart';
import 'package:movies/presentation/home/cubit/popular_tv_state.dart';

class PopularTv extends StatelessWidget {
  const PopularTv({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PopularTvCubit()..getPopularTv(),
      child: BlocBuilder<PopularTvCubit, PopularTvState>(
        builder: (context, state) {
          if (state is PopularTvStateLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is PopularTvStateLoaded) {
            return SizedBox(
              height: 300,
              child: ListView.separated(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return TvCard(tvEntity: state.tv[index]);
                  },
                  separatorBuilder: (context, index) => const SizedBox(
                        width: 10,
                      ),
                  itemCount: state.tv.length),
            );
          }
          if (state is PopularTvStateFailure) {
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

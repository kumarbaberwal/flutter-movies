// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/common/cubit/generic_data_cubit.dart';
import 'package:movies/common/cubit/generic_data_state.dart';
import 'package:movies/common/widgets/tv/tv_card.dart';
import 'package:movies/domain/tv/entities/tv_entity.dart';
import 'package:movies/domain/tv/usecases/get_recommendation_tv_use_case.dart';
import 'package:movies/service_locator.dart';

class RecommendationTv extends StatelessWidget {
  final int tvId;
  const RecommendationTv({
    super.key,
    required this.tvId,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GenericDataCubit()
        ..getData<List<TvEntity>>(sl<GetRecommendationTvUseCase>(),
            params: tvId),
      child: BlocBuilder<GenericDataCubit, GenericDataState>(
        builder: (context, state) {
          if (state is GenericDataStateLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is GenericDataStateLoaded) {
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
                        return TvCard(tvEntity: state.data[index]);
                      },
                      separatorBuilder: (context, index) => const SizedBox(
                            width: 10,
                          ),
                      itemCount: state.data.length),
                ),
              ],
            );
          }
          if (state is GenericDataStateFailure) {
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

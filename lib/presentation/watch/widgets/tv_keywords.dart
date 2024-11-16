// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/common/cubit/generic_data_cubit.dart';
import 'package:movies/common/cubit/generic_data_state.dart';
import 'package:movies/core/entities/keyword_entity.dart';
import 'package:movies/domain/tv/usecases/get_keywords_use_case.dart';
import 'package:movies/service_locator.dart';

class TvKeywords extends StatelessWidget {
  final int tvId;
  const TvKeywords({
    super.key,
    required this.tvId,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GenericDataCubit()
        ..getData<List<KeywordEntity>>(sl<GetKeywordsUseCase>(), params: tvId),
      child: BlocBuilder<GenericDataCubit, GenericDataState>(
        builder: (context, state) {
          if (state is GenericDataStateLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is GenericDataStateLoaded) {
            List<KeywordEntity> keywords = state.data;
            return Wrap(
              spacing: 5,
              children: keywords
                  .map((item) => Chip(label: Text(item.name!)))
                  .toList(),
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

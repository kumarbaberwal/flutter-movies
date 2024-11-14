// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:movies/domain/tv/entities/tv_entity.dart';

abstract class PopularTvState {}

class PopularTvStateFailure extends PopularTvState {
  final String errorMessage;

  PopularTvStateFailure({required this.errorMessage});
}

class PopularTvStateLoaded extends PopularTvState {
  final List<TvEntity> tv;
  PopularTvStateLoaded({
    required this.tv,
  });
}

class PopularTvStateLoading extends PopularTvState {}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/domain/movie/usecases/search_movie_use_case.dart';
import 'package:movies/domain/tv/usecases/search_tv_use_case.dart';
import 'package:movies/presentation/search/cubit/search_state.dart';
import 'package:movies/presentation/search/cubit/selectable_option_cubit.dart';
import 'package:movies/service_locator.dart';

class SearchCubit extends Cubit<SearchState> {
  final TextEditingController textEditingController = TextEditingController();
  SearchCubit() : super(SearchStateInitial());

  void search(String query, SearchType searchType) {
    if (query.isNotEmpty) {
      emit(SearchStateLoading());

      switch (searchType) {
        case SearchType.moive:
          searchMovies(query);
          break;
        case SearchType.tv:
          searchTv(query);
          break;
      }
    }
  }

  void searchMovies(String query) async {
    var returnedData = await sl<SearchMovieUseCase>().call(params: query);

    returnedData.fold((error) {
      emit(SearchStateFailure(errorMessage: error));
    }, (data) {
      emit(MovieLoaded(movieEntity: data));
    });
  }

  void searchTv(String query) async {
    var returnedData = await sl<SearchTvUseCase>().call(params: query);

    returnedData.fold((error) {
      emit(SearchStateFailure(errorMessage: error));
    }, (data) {
      emit(TvLoaded(tvEntity: data));
    });
  }
}

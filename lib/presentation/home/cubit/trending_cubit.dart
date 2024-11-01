import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/domain/movie/usecases/get_trending_movies_use_case.dart';
import 'package:movies/presentation/home/cubit/trending_state.dart';
import 'package:movies/service_locator.dart';

class TrendingCubit extends Cubit<TrendingState> {
  TrendingCubit() : super(TrendingStateLoading());

  void getTrendingMovies() async {
    var returnedData = await sl<GetTrendingMoviesUseCase>().call();
    returnedData.fold((error) {
      emit(TrendingStateFailure(errorMessage: error));
    }, (data) {
      emit(TrendingStateLoaded(movie: data));
    });
  }
}

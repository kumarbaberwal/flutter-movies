import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/domain/movie/usecases/get_trending_movies_use_case.dart';
import 'package:movies/presentation/home/cubit/trendings_state.dart';
import 'package:movies/service_locator.dart';

class TrendingsCubit extends Cubit<TrendingsState> {
  TrendingsCubit() : super(TrendingsStateLoading());

  void getTrendingMovies() async {
    var returnedData = await sl<GetTrendingMoviesUseCase>().call();
    returnedData.fold((error) {
      emit(TrendingsStateFailure(errorMessage: error));
    }, (data) {
      emit(TrendingsStateLoaded(movie: data));
    });
  }
}

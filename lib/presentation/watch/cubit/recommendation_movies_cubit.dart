import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/domain/movie/usecases/get_recommendation_movies_use_case.dart';
import 'package:movies/presentation/watch/cubit/recommendation_movies_state.dart';
import 'package:movies/service_locator.dart';

class RecommendationMoviesCubit extends Cubit<RecommendationMoviesState> {
  RecommendationMoviesCubit() : super(RecommendationMoviesStateLoading());

  void getRecommendationMovies(int movieId) async {
    var returnedData =
        await sl<GetRecommendationMoviesUseCase>().call(params: movieId);
    returnedData.fold((error) {
      emit(RecommendationMoviesStateFailure(errorMessage: error));
    }, (data) {
      emit(RecommendationMoviesStateLoaded(movieEntity: data));
    });
  }
}

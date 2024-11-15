import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/domain/movie/usecases/get_similar_movies_use_case.dart';
import 'package:movies/presentation/watch/cubit/similar_movies_state.dart';
import 'package:movies/service_locator.dart';

class SimilarMoviesCubit extends Cubit<SimilarMoviesState> {
  SimilarMoviesCubit() : super(SimilarMoviesStateLoading());

  void getSimilarMovies(int movieId) async {
    var returnedData =
        await sl<GetSimilarMoviesUseCase>().call(params: movieId);
    returnedData.fold((error) {
      emit(SimilarMoviesStateFailure(errorMessage: error));
    }, (data) {
      emit(SimilarMoviesStateLoaded(movieEntity: data));
    });
  }
}

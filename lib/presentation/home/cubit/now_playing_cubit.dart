import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/domain/movie/usecases/get_now_playing_movies_use_case.dart';
import 'package:movies/presentation/home/cubit/now_playing_state.dart';
import 'package:movies/service_locator.dart';

class NowPlayingCubit extends Cubit<NowPlayingState> {
  NowPlayingCubit() : super(NowPlayingStateLoading());

  void getNowPlayingMovies() async {
    var returnedData = await sl<GetNowPlayingMoviesUseCase>().call();

    returnedData.fold((error) {
      emit(NowPlayingStateFailure(errorMessage: error));
    }, (data) {
      emit(NowPlayingStateLoaded(movie: data));
    });
  }
}

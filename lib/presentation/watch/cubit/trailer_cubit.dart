import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/core/entities/trailer_entity.dart';
import 'package:movies/domain/movie/usecases/get_movie_trailer_use_case.dart';
import 'package:movies/presentation/watch/cubit/trailer_state.dart';
import 'package:movies/service_locator.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class TrailerCubit extends Cubit<TrailerState> {
  TrailerCubit() : super(TrailerStateLoading());

  void getMovieTrailer(int movieId) async {
    var returnedData = await sl<GetMovieTrailerUseCase>().call(params: movieId);
    returnedData.fold((error) {
      emit(TrailerStateFailure(errorMessage: error));
    }, (data) async {
      TrailerEntity trailerEntity = data;
      YoutubePlayerController controller = YoutubePlayerController(
        initialVideoId: trailerEntity.key!,
        flags: const YoutubePlayerFlags(
          autoPlay: false,
        ),
      );
      emit(TrailerStateLoaded(youtubePlayerController: controller));
    });
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/presentation/watch/cubit/trailer_cubit.dart';
import 'package:movies/presentation/watch/cubit/trailer_state.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class TvVideoPlayer extends StatelessWidget {
  final int tvId;
  const TvVideoPlayer({
    super.key,
    required this.tvId,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TrailerCubit()..getMovieTrailer(tvId),
      child: BlocBuilder<TrailerCubit, TrailerState>(
        builder: (context, state) {
          if (state is TrailerStateLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is TrailerStateLoaded) {
            return YoutubePlayer(
              controller: state.youtubePlayerController,
              showVideoProgressIndicator: true,
            );
          }
          if (state is TrailerStateFailure) {
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

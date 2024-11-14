import 'package:flutter/material.dart';
import 'package:movies/common/widgets/appbar/app_bar.dart';
import 'package:movies/domain/movie/entities/movie_entity.dart';
import 'package:movies/presentation/watch/widgets/video_player.dart';

class MovieWatchPage extends StatelessWidget {
  final MovieEntity movieEntity;
  const MovieWatchPage({
    super.key,
    required this.movieEntity,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BasicAppbar(
        hideBack: false,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [VideoPlayer(movieId: movieEntity.id!)],
        ),
      ),
    );
  }
}

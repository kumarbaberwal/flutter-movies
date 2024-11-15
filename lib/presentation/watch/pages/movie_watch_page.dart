import 'package:flutter/material.dart';
import 'package:movies/common/widgets/appbar/app_bar.dart';
import 'package:movies/domain/movie/entities/movie_entity.dart';
import 'package:movies/presentation/watch/widgets/recommendation_movies.dart';
import 'package:movies/presentation/watch/widgets/video_overview.dart';
import 'package:movies/presentation/watch/widgets/video_player.dart';
import 'package:movies/presentation/watch/widgets/video_release_date.dart';
import 'package:movies/presentation/watch/widgets/video_title.dart';
import 'package:movies/presentation/watch/widgets/video_vote_average.dart';

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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            VideoPlayer(movieId: movieEntity.id!),
            const SizedBox(
              height: 16,
            ),
            VideoTitle(title: movieEntity.title!),
            const SizedBox(
              height: 16,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                VideoReleaseDate(videoReleaseDate: movieEntity.releaseDate!),
                VideoVoteAverage(videoVoteAverage: movieEntity.voteAverage!),
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            VideoOverview(overview: movieEntity.overview!),
            const SizedBox(
              height: 16,
            ),
            RecommendationMovies(movieId: movieEntity.id!),
            const SizedBox(
              height: 16,
            ),
          ],
        ),
      ),
    );
  }
}

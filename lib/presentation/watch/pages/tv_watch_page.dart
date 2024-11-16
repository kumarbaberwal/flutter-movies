import 'package:flutter/material.dart';
import 'package:movies/common/widgets/appbar/app_bar.dart';
import 'package:movies/domain/tv/entities/tv_entity.dart';
import 'package:movies/presentation/watch/widgets/recommendation_tv.dart';
import 'package:movies/presentation/watch/widgets/similar_tv.dart';
import 'package:movies/presentation/watch/widgets/tv_keywords.dart';
import 'package:movies/presentation/watch/widgets/tv_video_player.dart';
import 'package:movies/presentation/watch/widgets/video_overview.dart';
import 'package:movies/presentation/watch/widgets/video_title.dart';
import 'package:movies/presentation/watch/widgets/video_vote_average.dart';

class TvWatchPage extends StatelessWidget {
  final TvEntity tvEntity;
  const TvWatchPage({
    super.key,
    required this.tvEntity,
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
            TvVideoPlayer(tvId: tvEntity.id!),
            const SizedBox(
              height: 16,
            ),
            VideoTitle(title: tvEntity.name!),
            const SizedBox(
              height: 16,
            ),
            TvKeywords(tvId: tvEntity.id!),
            const SizedBox(
              height: 16,
            ),
            VideoVoteAverage(videoVoteAverage: tvEntity.voteAverage!),
            const SizedBox(
              height: 16,
            ),
            VideoOverview(overview: tvEntity.overview!),
            const SizedBox(
              height: 16,
            ),
            RecommendationTv(tvId: tvEntity.id!),
            const SizedBox(
              height: 16,
            ),
            SimilarTv(tvId: tvEntity.id!),
            const SizedBox(
              height: 16,
            ),
          ],
        ),
      ),
    );
  }
}

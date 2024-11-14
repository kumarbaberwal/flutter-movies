import 'package:flutter/material.dart';
import 'package:movies/common/widgets/appbar/app_bar.dart';
import 'package:movies/domain/movie/entities/movie_entity.dart';

class MovieWatchPage extends StatelessWidget {
  final MovieEntity movieEntity;
  const MovieWatchPage({
    super.key,
    required this.movieEntity,
  });

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: BasicAppbar(
        hideBack: false,
      ),
    );
  }
}

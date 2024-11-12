import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movies/common/widgets/appbar/app_bar.dart';
import 'package:movies/core/configs/assets/app_vectors.dart';
import 'package:movies/presentation/home/widgets/category_text.dart';
import 'package:movies/presentation/home/widgets/now_playing_movies.dart';
import 'package:movies/presentation/home/widgets/trendings_movies.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppbar(
        hideBack: true,
        title: SvgPicture.asset(AppVectors.logo),
      ),
      body: const SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CategoryText(category: "Trending 🔥"),
            TrendingsMovies(),
            SizedBox(
              height: 16,
            ),
            CategoryText(category: "Now Playing"),
            SizedBox(
              height: 16,
            ),
            NowPlayingMovies(),
            SizedBox(
              height: 16,
            ),
          ],
        ),
      ),
    );
  }
}

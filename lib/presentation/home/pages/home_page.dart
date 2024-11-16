import 'package:flutter/material.dart';
import 'package:movies/common/helper/navigation/app_navigation.dart';
import 'package:movies/common/widgets/appbar/app_bar.dart';
import 'package:movies/presentation/home/widgets/category_text.dart';
import 'package:movies/presentation/home/widgets/now_playing_movies.dart';
import 'package:movies/presentation/home/widgets/popular_tv.dart';
import 'package:movies/presentation/home/widgets/trendings_movies.dart';
import 'package:movies/presentation/search/pages/search_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppbar(
        hideBack: true,
        action: IconButton(
            onPressed: () {
              AppNavigation.push(context, const SearchPage());
            },
            icon: const Icon(Icons.search)),
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Movie",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontSize: 28,
              ),
            ),
            SizedBox(
              width: 5,
            ),
            Text(
              "Kumar",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.red,
                fontSize: 24,
              ),
            ),
          ],
        ),
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
            CategoryText(category: "Popular TV"),
            SizedBox(
              height: 16,
            ),
            PopularTv(),
            SizedBox(
              height: 16,
            ),
          ],
        ),
      ),
    );
  }
}

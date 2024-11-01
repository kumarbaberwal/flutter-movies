import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movies/common/widgets/appbar/app_bar.dart';
import 'package:movies/core/configs/assets/app_vectors.dart';
import 'package:movies/presentation/home/widgets/trending_movies.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppbar(
        hideBack: true,
        leading: Padding(
          padding: const EdgeInsets.only(left: 10),
          child: SvgPicture.asset(AppVectors.logo),
        ),
      ),
      body: const SingleChildScrollView(
        child: Column(
          children: [
            TrendingMovies(),
          ],
        ),
      ),
    );
  }
}

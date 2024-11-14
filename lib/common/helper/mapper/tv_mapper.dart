import 'package:movies/data/tv/models/tv_model.dart';
import 'package:movies/domain/tv/entities/tv_entity.dart';

class TvMapper {
  static TvEntity toEntity(TVModel tv) {
    return TvEntity(
        adult: tv.adult,
        backdropPath: tv.backdropPath,
        genreIds: tv.genreIds,
        id: tv.id,
        originCountry: tv.originCountry,
        originalLanguage: tv.originalLanguage,
        originalName: tv.originalName,
        overview: tv.overview,
        popularity: tv.popularity,
        posterPath: tv.posterPath,
        firstAirDate: tv.firstAirDate,
        name: tv.name,
        voteAverage: tv.voteAverage,
        voteCount: tv.voteCount);
  }
}

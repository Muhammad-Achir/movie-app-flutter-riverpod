import 'cast.dart';

class Movie {
  final String id;
  final int movieId;
  final String originalTitle;
  final String originalLanguage;
  final String overview;
  final double popularity;
  final String posterPath;
  final String backdropPath;
  final String releaseDate;
  final double voteAverage;
  final int voteCount;
  final bool adult;
  final List<Cast> casts;

  Movie({
    required this.id,
    required this.movieId,
    required this.originalTitle,
    required this.originalLanguage,
    required this.overview,
    required this.popularity,
    required this.posterPath,
    required this.backdropPath,
    required this.releaseDate,
    required this.voteAverage,
    required this.voteCount,
    required this.adult,
    required this.casts,
  });
}

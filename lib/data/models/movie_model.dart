import '../../domain/entities/movie.dart';
import '../../domain/entities/cast.dart';

class MovieModel extends Movie {
  MovieModel({
    required super.id,
    required super.movieId,
    required super.originalTitle,
    required super.originalLanguage,
    required super.overview,
    required super.popularity,
    required super.posterPath,
    required super.backdropPath,
    required super.releaseDate,
    required super.voteAverage,
    required super.voteCount,
    required super.adult,
    required super.casts,
  });

  factory MovieModel.fromJson(Map<String, dynamic> json) {
    return MovieModel(
      id: json['id'],
      movieId: json['movie_id'],
      originalTitle: json['original_title'],
      originalLanguage: json['original_language'],
      overview: json['overview'],
      popularity: (json['popularity'] as num).toDouble(),
      posterPath: json['poster_path'] ?? '',
      backdropPath: json['backdrop_path'] ?? '',
      releaseDate: json['release_date'],
      voteAverage: (json['vote_average'] as num).toDouble(),
      voteCount: json['vote_count'],
      adult: json['adult'] == 1,
      casts: (json['casts'] as List).map((e) => CastModel.fromJson(e)).toList(),
    );
  }
}

class CastModel extends Cast {
  CastModel({
    required super.name,
    required super.profilePath,
    required super.character,
  });

  factory CastModel.fromJson(Map<String, dynamic> json) {
    return CastModel(
      name: json['name'],
      profilePath: json['profile_path'] ?? '',
      character: json['character'],
    );
  }
}

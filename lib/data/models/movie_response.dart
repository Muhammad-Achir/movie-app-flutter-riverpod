import 'movie_model.dart';

class MovieResponse {
  final List<MovieModel> movies;
  final String? nextPageUrl;

  MovieResponse({required this.movies, required this.nextPageUrl});
}

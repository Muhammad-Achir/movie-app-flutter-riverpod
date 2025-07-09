import '../entities/movie.dart';
import '../repositories/movie_repository.dart';

class FetchMovies {
  final MovieRepository repository;

  FetchMovies(this.repository);

  Future<(List<Movie>, String?)> call(String url) {
    return repository.fetchMovies(url);
  }
}

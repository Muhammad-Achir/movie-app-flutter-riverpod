import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/network/http_client.dart';
import '../../data/datasources/movie_remote_datasource.dart';
import '../../data/repositories/movie_repository_impl.dart';
import '../../domain/entities/movie.dart';
import '../../domain/usecases/fetch_movies.dart';

final movieProvider = StateNotifierProvider<MovieNotifier, AsyncValue<List<Movie>>>(
  (ref) => MovieNotifier(
    FetchMovies(
      MovieRepositoryImpl(
        MovieRemoteDataSource(HttpClient()),
      ),
    ),
  ),
);

class MovieNotifier extends StateNotifier<AsyncValue<List<Movie>>> {
  final FetchMovies fetchMoviesUseCase;
  MovieNotifier(this.fetchMoviesUseCase) : super(const AsyncValue.loading()) {
    fetchInitial();
  }

  String? _nextPageUrl = "https://jsonfakery.com/movies/infinite-scroll";
  final List<Movie> _movies = [];

  Future<void> fetchInitial() async {
    _movies.clear();
    await _fetch();
  }

  Future<void> fetchMore() async {
    if (_nextPageUrl == null) return;
    await _fetch();
  }

  Future<void> _fetch() async {
    try {
      final (newMovies, nextUrl) = await fetchMoviesUseCase(_nextPageUrl!);
      _nextPageUrl = nextUrl;
      _movies.addAll(newMovies);
      state = AsyncValue.data([..._movies]);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }
}

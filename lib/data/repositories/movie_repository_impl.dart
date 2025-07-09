import '../../domain/entities/movie.dart';
import '../../domain/repositories/movie_repository.dart';
import '../datasources/movie_remote_datasource.dart';

class MovieRepositoryImpl implements MovieRepository {
  final MovieRemoteDataSource remoteDataSource;
  MovieRepositoryImpl(this.remoteDataSource);

  @override
  Future<(List<Movie>, String?)> fetchMovies(String url) async {
    final response = await remoteDataSource.fetchMovies(url);
    return (response.movies, response.nextPageUrl);
  }
}

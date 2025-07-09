import '../models/movie_model.dart';
import '../models/movie_response.dart';
import '../../core/network/http_client.dart';

class MovieRemoteDataSource {
  final HttpClient client;
  MovieRemoteDataSource(this.client);

  Future<MovieResponse> fetchMovies(String url) async {
    final response = await client.get(url);
    final data = response['data'] as List;
    final nextPage = response['next_page_url'] as String?;

    final movies = data.map((e) => MovieModel.fromJson(e)).toList();
    return MovieResponse(movies: movies, nextPageUrl: nextPage);
  }
}

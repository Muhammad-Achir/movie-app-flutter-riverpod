import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../../domain/entities/movie.dart';

class MovieCard extends StatelessWidget {
  final Movie movie;
  const MovieCard({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    // final posterUrl = movie.posterPath.isNotEmpty
    //     ? movie.posterPath
    //     : 'https://via.placeholder.com/300x450?text=No+Poster';

    final backdropUrl = movie.backdropPath.isNotEmpty
        ? movie.backdropPath
        : 'https://via.placeholder.com/600x300?text=No+Backdrop';

    return Card(
      color: Colors.grey[900],
      margin: const EdgeInsets.all(12),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CachedNetworkImage(
            imageUrl: backdropUrl,
            fit: BoxFit.cover,
            placeholder: (context, url) =>
                const SizedBox(height: 180, child: Center(child: CircularProgressIndicator())),
            errorWidget: (context, url, error) => const Icon(Icons.broken_image),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              movie.originalTitle,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Text(movie.overview, maxLines: 3, overflow: TextOverflow.ellipsis, style: const TextStyle(color: Colors.white70)),
          ),
          const SizedBox(height: 8),
          SizedBox(
            height: 90,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: movie.casts.length,
              itemBuilder: (_, i) {
                final cast = movie.casts[i];
                final profileUrl = cast.profilePath.isNotEmpty
                    ? cast.profilePath
                    : 'https://via.placeholder.com/100x100?text=No+Photo';
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Column(
                    children: [
                      ClipOval(
                        child: CachedNetworkImage(
                          imageUrl: profileUrl,
                          width: 50,
                          height: 50,
                          fit: BoxFit.cover,
                          placeholder: (context, url) => const CircularProgressIndicator(),
                          errorWidget: (context, url, error) => const Icon(Icons.person),
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(cast.name, style: const TextStyle(color: Colors.white, fontSize: 12)),
                    ],
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}

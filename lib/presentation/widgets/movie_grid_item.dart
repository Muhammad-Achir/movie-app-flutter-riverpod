import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../../domain/entities/movie.dart';

class MovieGridItem extends StatelessWidget {
  final Movie movie;
  final VoidCallback onTap;

  const MovieGridItem({super.key, required this.movie, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final poster = movie.posterPath.isNotEmpty
        ? movie.posterPath
        : 'https://via.placeholder.com/300x450?text=No+Poster';

    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        height: 280, // total tinggi item
        child: Card(
          color: Colors.grey[900],
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          clipBehavior: Clip.antiAlias, // agar border radius terpotong rapi
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: CachedNetworkImage(
                  imageUrl: poster,
                  width: double.infinity, // ✅ agar gambar full ke kanan
                  fit: BoxFit.cover,
                  placeholder: (context, url) =>
                      const Center(child: CircularProgressIndicator()),
                  errorWidget: (context, url, error) =>
                      const Icon(Icons.broken_image),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(8, 8, 8, 4),
                child: Text(
                  movie.originalTitle,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(8, 0, 8, 8),
                child: Text(
                  "⭐ ${movie.popularity.toStringAsFixed(1)}",
                  style: const TextStyle(
                    color: Colors.amberAccent,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

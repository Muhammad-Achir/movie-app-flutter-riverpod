import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../../domain/entities/movie.dart';

class DetailPage extends StatelessWidget {
  final Movie movie;
  const DetailPage({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    final backdrop = movie.backdropPath.isNotEmpty
        ? movie.backdropPath
        : 'https://via.placeholder.com/600x300?text=No+Backdrop';

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text(movie.originalTitle, style: const TextStyle(color: Colors.white)),
        backgroundColor: Colors.transparent,
      ),
      body: ListView(
        children: [
          CachedNetworkImage(
            imageUrl: backdrop,
            height: 200,
            fit: BoxFit.cover,
            errorWidget: (_, __, ___) => const Icon(Icons.broken_image),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              movie.overview,
              style: const TextStyle(color: Colors.white70, fontSize: 16),
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Text("Casts", style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
          ),
          const SizedBox(height: 12),
          SizedBox(
            height: 110,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: movie.casts.length,
              itemBuilder: (context, index) {
                final cast = movie.casts[index];
                final profile = cast.profilePath.isNotEmpty
                    ? cast.profilePath
                    : 'https://via.placeholder.com/100x100?text=No+Photo';
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    children: [
                      ClipOval(
                        child: CachedNetworkImage(
                          imageUrl: profile,
                          width: 60,
                          height: 60,
                          fit: BoxFit.cover,
                          errorWidget: (_, __, ___) => const Icon(Icons.person),
                        ),
                      ),
                      const SizedBox(height: 4),
                      SizedBox(
                        width: 70,
                        child: Text(cast.name,
                            style: const TextStyle(color: Colors.white, fontSize: 12),
                            textAlign: TextAlign.center,
                            overflow: TextOverflow.ellipsis),
                      )
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

import 'package:app/data/model/movie.dart';
import 'package:app/hook/use_router.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class MovieDetailPage extends HookConsumerWidget {
  const MovieDetailPage({
    Key? key,
    required this.movie,
  }) : super(key: key);

  final Movie movie;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = useRouter();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
          onPressed: () {
            router.pop();
          },
        ),
        title: Text(movie.title ?? ''),
        automaticallyImplyLeading: false,
        centerTitle: true,
      ),
      body: SafeArea(
        child: Container(
          color: Colors.black,
          child: ListView(
            children: [
              CachedNetworkImage(
                imageUrl: "https://image.tmdb.org/t/p/w500${movie.posterPath}",
                placeholder: (context, url) => const Center(
                  child: CircularProgressIndicator(),
                ),
                errorWidget: (context, url, error) => const Center(
                  child: Icon(
                    Icons.error,
                    size: 100,
                    color: Colors.red,
                  ),
                ),
                fit: BoxFit.fitWidth,
              ),
              Text(
                movie.originalTitle ?? '',
                style: const TextStyle(
                  fontSize: 24,
                  color: Colors.white,
                ),
              ),
              Text(
                movie.releaseDate ?? '',
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.white,
                ),
              ),
              Text(
                movie.overview ?? '',
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

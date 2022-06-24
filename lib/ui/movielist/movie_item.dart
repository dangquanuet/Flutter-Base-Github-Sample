import 'package:app/data/model/movie.dart';
import 'package:app/hook/use_l10n.dart';
import 'package:app/hook/use_router.dart';
import 'package:app/route/app_router.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class MovieItem extends HookConsumerWidget {
  const MovieItem({Key? key, required this.movie}) : super(key: key);

  final Movie movie;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = useRouter();
    final l10n = useL10n();
    return InkWell(
      child: Stack(
        alignment: Alignment.bottomCenter,
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
          Container(
            padding: const EdgeInsets.all(16),
            alignment: Alignment.center,
            decoration: const BoxDecoration(
              color: Color.fromARGB(127, 0, 0, 0),
            ),
            child: Text(
              movie.title ?? '',
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20.0,
              ),
            ),
          ),
        ],
      ),
      onTap: () {
        router.push(MovieDetailRoute(movie: movie));
      },
    );
  }
}

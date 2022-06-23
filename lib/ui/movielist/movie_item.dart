import 'package:app/data/model/movie.dart';
import 'package:app/hook/use_l10n.dart';
import 'package:app/hook/use_router.dart';
import 'package:app/ui/theme/layout_size.dart';
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
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(LayoutSize.sizePaddingMedium),
        child: CachedNetworkImage(
          imageUrl: "https://image.tmdb.org/t/p/w200${movie.posterPath}",
          fit: BoxFit.fitWidth,
        ),
      ),
    );
  }
}

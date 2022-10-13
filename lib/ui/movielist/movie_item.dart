import 'package:app/data/model/movie.dart';
import 'package:app/hook/use_l10n.dart';
import 'package:app/hook/use_router.dart';
import 'package:app/route/app_router.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../config/colors.dart';

class MovieItem extends HookConsumerWidget {
  const MovieItem({
    Key? key,
    required this.movie,
  }) : super(key: key);

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
            errorWidget: (context, url, error) => Center(
              child: Icon(
                Icons.error,
                size: 100.sp,
                color: Colors.red,
              ),
            ),
            fit: BoxFit.fitWidth,
          ),
          Container(
            padding: REdgeInsets.all(16.r),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: ColorCustom.black50,
            ),
            child: Text(
              movie.title ?? '',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 20.sp,
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

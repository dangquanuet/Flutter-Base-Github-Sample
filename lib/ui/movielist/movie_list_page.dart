import 'package:app/foundation/extension/list.dart';
import 'package:app/hook/use_l10n.dart';
import 'package:app/hook/use_router.dart';
import 'package:app/ui/component/error/container_error_handling.dart';
import 'package:app/ui/movielist/movie_item.dart';
import 'package:app/ui/movielist/movie_list_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../data/model/movie.dart';

class MovieListPage extends HookConsumerWidget {
  const MovieListPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const Scaffold(
      body: ContainerErrorHandling(
        child: SafeArea(
          child: MovieListView(),
        ),
      ),
    );
  }
}

class MovieListView extends HookConsumerWidget {
  const MovieListView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = useRouter();
    final l10n = useL10n();
    final movieListViewModel = ref.read(movieListViewModelProvider);
    final itemList =
        ref.watch(movieListViewModelProvider.select((value) => value.itemList));
    final isFirstLoad = ref
        .watch(movieListViewModelProvider.select((value) => value.isFirstLoad));
    // for load more
    final isLoadSuccess = ref.watch(
        movieListViewModelProvider.select((value) => value.isLoadSuccess));

    final scrollController = useScrollController();
    scrollController.addListener(
      () async {
        if (scrollController.position.pixels >
            scrollController.position.maxScrollExtent - 1.sh) {
          if (!movieListViewModel.isLoading) {
            movieListViewModel.loadMore();
          }
        }
      },
    );

    useEffect(() {
      WidgetsBinding.instance.addPostFrameCallback(
        (timeStamp) {
          debugPrint("movieList firstLoad");
          movieListViewModel.firstLoad();
        },
      );
      return null;
    }, []);

    return RefreshIndicator(
      onRefresh: () async => movieListViewModel.refresh(),
      child: isFirstLoad
          ? SizedBox(
              width: 1.sw,
              height: 1.sh,
              child: const Center(
                child: CircularProgressIndicator(),
              ),
            )
          : itemList.isEmpty
              ? ListView.builder(
                  itemCount: 1,
                  itemBuilder: (context, index) {
                    return Container(
                      width: 1.sw,
                      height: 1.sh,
                      alignment: Alignment.center,
                      child: Text(l10n.noResult),
                    );
                  },
                )
              : ListView.builder(
                  controller: scrollController,
                  itemCount: itemList.length + 1,
                  itemBuilder: (context, index) {
                    if (index == itemList.length) {
                      if (isLoadSuccess) {
                        return const SizedBox();
                      } else {
                        return const LinearProgressIndicator();
                      }
                    } else {
                      return MovieItem(
                        movie: itemList.getOrNull(index) ?? const Movie(),
                      );
                    }
                  },
                ),
    );
  }
}

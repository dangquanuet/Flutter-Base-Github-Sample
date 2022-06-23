import 'package:app/hook/use_l10n.dart';
import 'package:app/hook/use_router.dart';
import 'package:app/ui/component/error/container_error_handling.dart';
import 'package:app/ui/movielist/movie_item.dart';
import 'package:app/ui/movielist/movie_list_view_model.dart';
import 'package:app/ui/theme/layout_size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class MovieListPage extends HookConsumerWidget {
  const MovieListPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = useRouter();
    final l10n = useL10n();
    final movieListViewModel = ref.read(movieListViewModelProvider);
    final itemList =
        ref.watch(movieListViewModelProvider.select((value) => value.itemList));

    // for load more
    final isLoadSuccess = ref.watch(
        movieListViewModelProvider.select((value) => value.isLoadSuccess));

    final scrollController = useScrollController();
    scrollController.addListener(
      () async {
        if (scrollController.position.pixels >
            scrollController.position.maxScrollExtent -
                MediaQuery.of(context).size.height) {
          if (!movieListViewModel.isLoading) {
            movieListViewModel.loadMore();
          }
        }
      },
    );

    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) {
        movieListViewModel.firstLoad();
      },
    );

    return Scaffold(
      body: ContainerErrorHandling(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(LayoutSize.sizePaddingMedium),
            child: itemList.isEmpty
                ? Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    alignment: Alignment.center,
                    child: Text(l10n.noResult),
                  )
                : RefreshIndicator(
                    onRefresh: () async => movieListViewModel.refresh(),
                    child: ListView.builder(
                      controller: scrollController,
                      itemCount: itemList.length + 1,
                      itemBuilder: (context, index) {
                        if (index == itemList.length) {
                          if (isLoadSuccess) {
                            return const SizedBox();
                          }
                          return const LinearProgressIndicator();
                        } else {
                          return MovieItem(movie: itemList[index]);
                        }
                      },
                    ),
                  ),
          ),
        ),
      ),
    );
  }
}

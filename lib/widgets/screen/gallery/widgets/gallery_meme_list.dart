import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import '../../../../data_layer_library.dart';
import '../../../../logging.dart';
import '../../../component/meme/meme_card.dart';

class GalleryMemeList extends StatefulWidget {
  const GalleryMemeList({super.key});

  @override
  State<GalleryMemeList> createState() => _GalleryMemeListState();
}

class _GalleryMemeListState extends State<GalleryMemeList> with AutomaticKeepAliveClientMixin<GalleryMemeList> {
  @override
  bool get wantKeepAlive => true;

  static const _pageSize = 10;

  final PagingController<int, FeedItem> _pagingController = PagingController(
    firstPageKey: 0,
  );

  @override
  void initState() {
    _pagingController.addPageRequestListener(_fetchPage);
    super.initState();
  }

  @override
  void dispose() {
    _pagingController.dispose();
    super.dispose();
  }

  Future<void> _fetchPage(int pageKey) async {
    try {
      final galleryBloc = context.read<GalleryBloc>();
      final newItems = await context.read<ApiRepository>().getGalleryMemes(
        galleryBloc.id,
        pageKey,
        _pageSize,
      );

      if (mounted) {
        if (newItems.isEmpty)
          _pagingController.appendLastPage(newItems);
        else
          _pagingController.appendPage(newItems, pageKey + 1);
      }
    } catch (error, stackTrace) {
      talker.warning('Failed to load gallery memes page $pageKey', error, stackTrace);
      if (mounted)
        _pagingController.error = error;
    }
  }


  @override
  Widget build(BuildContext context) {
    super.build(context);
    return RefreshIndicator(
      onRefresh: () async {
        _pagingController.refresh();
      },
      child: PagedListView<int, FeedItem>(
        pagingController: _pagingController,
        builderDelegate: PagedChildBuilderDelegate<FeedItem>(
          itemBuilder: (context, item, index) =>
              BlocProvider(
                create: (context) => MemeBloc(context.read(), item.galleryId, item.memeId),
                child: const MemeCard(),
              ),
        ),
      ),
    );
  }
}

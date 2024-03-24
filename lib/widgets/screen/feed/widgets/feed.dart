import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import '../../../../api.dart';
import '../../../../bloc/meme_bloc.dart';
import '../../../../data.dart';
import '../../../../logging.dart';
import 'meme_card.dart';

class Feed extends StatefulWidget {
  const Feed({required this.type, super.key});

  final FeedType type;

  @override
  State<Feed> createState() => _FeedState();
}

class _FeedState extends State<Feed> with AutomaticKeepAliveClientMixin<Feed> {
  static const _pageSize = 20;

  final PagingController<int, FeedItem> _pagingController = PagingController(
      firstPageKey: 0);

  @override
  void initState() {
    _pagingController.addPageRequestListener(_fetchPage);
    super.initState();
  }

  Future<void> _fetchPage(int pageKey) async {
    try {
      final newItems = await context.read<ApiRepository>().getFeed(
          pageKey, _pageSize, widget.type);
      if (newItems.isEmpty) {
        if (mounted) {
          _pagingController.appendLastPage(newItems);
        }
      } else {
        if (mounted) {
          _pagingController.appendPage(newItems, pageKey + 1);
        }
      }
    } catch (error, stackTrace) {
      talker.warning('Failed to load feed page ${widget.type} $pageKey', error,
          stackTrace);
      if (mounted) {
        _pagingController.error = error;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return PagedListView<int, FeedItem>(
      pagingController: _pagingController,
      builderDelegate: PagedChildBuilderDelegate<FeedItem>(
        itemBuilder: (context, item, index) =>
          BlocProvider(
            create: (context) => MemeBloc(context.read(), item.galleryId, item.memeId),
            child: const MemeCard(),
          ),
      ),
    );
  }

  @override
  void dispose() {
    _pagingController.dispose();
    super.dispose();
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}

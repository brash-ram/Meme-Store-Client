import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import '../../../../data_layer_library.dart';
import 'gallery_card.dart';

class TenantProfileGalleries extends StatefulWidget {
  const TenantProfileGalleries({required this.galleryIds, super.key});

  final List<int> galleryIds;

  @override
  State<TenantProfileGalleries> createState() => _TenantProfileGalleriesState();
}

class _TenantProfileGalleriesState extends State<TenantProfileGalleries> {
  final PagingController<int, int> _pagingController = PagingController(firstPageKey: 0);

  @override
  void initState() {
    _pagingController
      ..addPageRequestListener(_fetchPage)
      ..addStatusListener((status) {
        if (status == PagingStatus.subsequentPageError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: const Text(
                'Something went wrong while fetching a new page.',
              ),
              action: SnackBarAction(
                label: 'Retry',
                onPressed: _pagingController.retryLastFailedRequest,
              ),
            ),
          );
        }
      }
    );

    super.initState();
  }

  Future<void> _fetchPage(int pageKey) async {
    try {
      if (pageKey == 0) {
        _pagingController.appendLastPage(widget.galleryIds);
      }


      // final isLastPage = newItems.length < _pageSize;
      // if (isLastPage) {
      //
      // } else {
      //   final nextPageKey = pageKey + 1;
      //   _pagingController.appendPage(newItems, nextPageKey);
      // }
    } catch (error, stack) {
      _pagingController.error = error;

    }
  }

  @override
  Widget build(BuildContext context) => PagedSliverList<int, int>(
    pagingController: _pagingController,
    builderDelegate: PagedChildBuilderDelegate<int>(
      animateTransitions: true,
      itemBuilder: (context, item, index) => BlocProvider.value(
        value: GalleryBloc(context.read(), item),
        child: const GalleryCard(),
      ),
    ),
  );

  @override
  void dispose() {
    _pagingController.dispose();
    super.dispose();
  }
}

import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data_layer_library.dart';
import 'widgets/gallery_meme_list.dart';

@RoutePage()
class GalleryScreen extends StatelessWidget {
  const GalleryScreen({@pathParam required this.galleryId, super.key});

  final int galleryId;

  @override
  Widget build(BuildContext context) => BlocProvider.value(
    value: GalleryBloc(context.read(), galleryId),
    child: Scaffold(
      appBar: AppBar(
        leading: const AutoLeadingButton(),
        title: ModelBlocDataSelector<GalleryBloc, Gallery, String>(
          selector: (value) => value.name,
          builder: (context, state) => Text(state),
        ),
        actions: [
          if (kDebugMode)
            Builder(
              builder: (context) =>
                  IconButton(
                    icon: const Icon(Icons.refresh),
                    tooltip: 'Refresh',
                    onPressed: () async => context.read<MemeBloc>().update(),
                  ),
            ),
          if (kDebugMode)
            Builder(
              builder: (context) =>
                  IconButton(
                    icon: const Icon(Icons.rotate_right),
                    tooltip: 'Reset',
                    onPressed: () async => context.read<MemeBloc>().reset(),
                  ),
            ),
        ],
      ),
      body: const GalleryMemeList(),
    ),
  );
}

import 'package:auto_route/auto_route.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '/data_layer_library.dart';

import 'widgets/meme_details.dart';


@RoutePage()
class MemeScreen extends StatelessWidget {
  const MemeScreen({
    @pathParam required this.galleryId,
    @pathParam required this.memeId,
    super.key,
  });

  final int galleryId;
  final int memeId;

  @override
  Widget build(BuildContext context) => BlocProvider.value(
    value: MemeBloc(context.read(), galleryId, memeId),
    child: Scaffold(
      appBar: AppBar(
        leading: const AutoLeadingButton(),
        title: ModelBlocDataSelector<MemeBloc, Meme, String>(
          selector: (value) => value.title,
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
      body: const MemeDetails(),
    ),
  );
}

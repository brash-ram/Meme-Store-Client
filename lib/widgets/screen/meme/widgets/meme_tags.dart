import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '/data_layer_library.dart';


class MemeTags extends StatelessWidget {
  const MemeTags({
    required this.builder,
    super.key,
  });

  final Widget Function(BuildContext context, MemeTag tag) builder;

  @override
  Widget build(BuildContext context) {
    // Rebuild if meme changes
    final meme = context.watch<MemeBloc>();
    return BlocProvider(
      // Recreate tags bloc if ID changes
      key: Key('MemeTags#${meme.galleryId}_${meme.memeId}'),
      create: (context) {
        final meme = context.read<MemeBloc>();
        return MemeTagsBloc(context.read(), meme.galleryId, meme.memeId);
      },
      child: BlocListener<MemeBloc, BlocState<Meme>>(
        listener: (context, state) async => switch (state) {
          BlocStateInitial() => context.read<MemeTagsBloc>().reset(),
          BlocStateUpdating() => context.read<MemeTagsBloc>().update(),
          _ => null,
        },
        child: ModelBlocDataSelector<MemeTagsBloc, List<MemeTag>, List<MemeTag>>(
          selector: (value) => value,
          builder: (context, data) => Wrap(
            spacing: 8.0, // gap between adjacent chips
            runSpacing: 4.0, // gap between lines
            children: [
              for (final tag in data)
                builder(context, tag),
            ],
          ),
        ),
      ),
    );
  }
}

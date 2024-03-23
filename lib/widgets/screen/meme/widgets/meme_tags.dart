import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '/data_layer_library.dart';

class MemeTags extends StatelessWidget {
  const MemeTags({super.key});

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
          selector: (value) => [ ...value, ],
          builder: (context, data) => Padding(
            padding: const EdgeInsets.all(8.0),
            child: Wrap(
                spacing: 8.0, // gap between adjacent chips
                runSpacing: 4.0, // gap between lines
                children: [
                  for (final tag in data)
                    MemeTagWidget(tag: tag),
                ],
              ),
          ),
        ),
      ),
    );
  }
}

class MemeTagWidget extends StatelessWidget {
  const MemeTagWidget({
    required this.tag,
    super.key,
  });

  final MemeTag tag;

  @override
  Widget build(BuildContext context) =>
    Material(
      shape: RoundedRectangleBorder(
        side: BorderSide(
            color: Theme.of(context).colorScheme.outline,
            width: 1,
        ),
          borderRadius: const BorderRadius.all(Radius.circular(16)),
      ),
      borderOnForeground: true,
      type: MaterialType.card,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(tag.name),
          ),
          IconButton(
            splashRadius: 25,
            visualDensity: VisualDensity.compact,
            color: tag.myVote == VoteType.up
              ? Colors.green
              : Theme.of(context).iconTheme.color,
            icon: const Icon(
              Icons.arrow_upward,
            ),
            onPressed: () async => context.read<ApiRepository>().voteForMemeTag(
              context.read<MemeTagsBloc>().memeId,
              tag.id,
              VoteType.up,
            ),
          ),
          IconButton(
            splashRadius: 25,
            visualDensity: VisualDensity.compact,
            color: tag.myVote == VoteType.down
              ? Colors.red
              : Theme.of(context).iconTheme.color,
            icon: const Icon(
              Icons.arrow_downward,
            ),
            onPressed: () async => context.read<ApiRepository>().voteForMemeTag(
              context.read<MemeTagsBloc>().memeId,
              tag.id,
              VoteType.down,
            ),
          ),
        ],
      ),
    );
}

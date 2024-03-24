import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '/data_layer_library.dart';


class MemeTagWidget extends StatelessWidget {
  const MemeTagWidget({
    required this.tag,
    super.key,
  });

  final MemeTag tag;

  @override
  Widget build(BuildContext context) {
    final api = context.read<ApiRepository>();
    final tagsBloc = context.read<MemeTagsBloc>();
    return Material(
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
            onPressed: () async => api.voteForMemeTag(
              tagsBloc.galleryId,
              tagsBloc.memeId,
              tag.id,
              tag.myVote == VoteType.up
                ? null
                : VoteType.up,
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
            onPressed: () async => api.voteForMemeTag(
              tagsBloc.galleryId,
              tagsBloc.memeId,
              tag.id,
              tag.myVote == VoteType.down
                ? null
                : VoteType.down,
            ),
          ),
        ],
      ),
    );
  }
}

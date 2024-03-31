import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/router/router.dart';
import '../../../component/asset/meme_image.dart';
import '../../../component/meme/meme_card_tag.dart';
import '../../../component/tenant/tenant_link.dart';
import '../../meme/widgets/meme_tags.dart';
import '/data_layer_library.dart';

class MemeCard extends StatelessWidget {
  const MemeCard({super.key});

  @override
  Widget build(BuildContext context) => Card(
    child: Stack(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 200,
                child: MemeImage(interactive: false,),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ModelBlocDataSelector<MemeBloc, Meme, String>(
                  selector: (value) => value.title,
                  builder: (context, state) => Text(state),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ModelBlocDataSelector<MemeBloc, Meme, int>(
                  selector: (value) => value.authorId,
                  builder: (context, data) => TenantLink(id: data),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: MemeTags(
                  builder: (context, tag) =>
                    MemeCardTag(tag: tag,),
                ),
              ),
            ],
          ),
        ),
        Positioned.fill(
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              borderRadius: switch(Theme.of(context).cardTheme.shape) {
                RoundedRectangleBorder(:final borderRadius) => borderRadius.resolve(null),
                _ => const BorderRadius.all(Radius.circular(12.0)),
              },
              onTap: () async {
                final meme = context.read<MemeBloc>();
                await context.navigateTo(MemeRoute(galleryId: meme.galleryId, memeId: meme.memeId));
              },
            ),
          ),
        ),
      ],
    ),
  );
}

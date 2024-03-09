import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../../core/router/router.dart';
import '../asset/meme_image.dart';
import '../tags/list_tags.dart';


class MemeCard extends StatelessWidget {
  const MemeCard({super.key});

  @override
  Widget build(BuildContext context) => Padding(
      padding: const EdgeInsets.all(2.5),
      child: DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(7.0)),
          border: Border.all(
            color: Theme.of(context).colorScheme.outline,
          ),
          color: Theme.of(context).colorScheme.surface,
        ),
        child: Padding(
          padding: const EdgeInsets.all(5),
          child: InkWell(
            onTap: () async {
              await AutoRouter.of(context).push(const MemeRoute());
            },
            child: Column(
              children: [
                MemeImage(),
                Text(
                  "Название мема",
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      color: Theme.of(context).primaryColor,
                      fontWeight: FontWeight.bold
                  ),
                  maxLines: 2,
                ),
                ListTags()
              ],
            ),
          ),
        ),
      )
  );
}

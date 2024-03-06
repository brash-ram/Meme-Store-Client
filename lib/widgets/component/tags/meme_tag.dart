import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/style/icons.dart';

class MemeTag extends StatelessWidget {
  const MemeTag({super.key, this.readonly = true});

  final bool readonly;

  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.only(right: 4),
    child: Chip(
        color: MaterialStateProperty.all(Theme.of(context).colorScheme.tertiary),
        labelPadding: EdgeInsets.zero,
        label: Row(
          mainAxisSize: MainAxisSize.min,
          children: readonly ? _readonlyBody(context) : _body(context),
        ),
    ),
  );

  List<Widget> _body(BuildContext context) => [
      Text(
        'Тэг',
        style: Theme.of(context).textTheme.labelMedium?.copyWith(
            color: Theme.of(context).colorScheme.onTertiary,
        ),
      ),
      const SizedBox(width: 4,),
      InkWell(
        onTap: () {},
        child: SvgPicture.asset(
          iconAdd,
          height: 10,
          colorFilter: ColorFilter.mode(
            Theme.of(context).colorScheme.onTertiary,
            BlendMode.srcIn,
          ),
        ),
      ),
      const SizedBox(width: 4,),
      Text(
        '13',
        style: Theme.of(context).textTheme.labelSmall?.copyWith(
          color: Theme.of(context).colorScheme.onTertiary,
        ),
      ),
      const SizedBox(width: 4,),
      InkWell(
        onTap: () {},
        child: SvgPicture.asset(
          iconMinus,
          height: 10,
          colorFilter: ColorFilter.mode(
              Theme.of(context).colorScheme.onTertiary,
              BlendMode.srcIn,
          ),
        ),
      ),
    ];

  List<Widget> _readonlyBody(BuildContext context) => [
    Text(
      'Тэг',
      style: Theme.of(context).textTheme.labelMedium?.copyWith(
        color: Theme.of(context).colorScheme.onTertiary,
      ),
    ),
  ];
}

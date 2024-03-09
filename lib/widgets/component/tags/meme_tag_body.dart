import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/style/icons.dart';

class MemeTagBody extends StatelessWidget {
  const MemeTagBody({super.key});

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).primaryColor;
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          'Тэг',
          style: Theme.of(context).textTheme.labelMedium?.copyWith(
            color: color,
          ),
        ),
        const SizedBox(width: 4,),
        InkWell(
          onTap: () {},
          child: SvgPicture.asset(
            iconAdd,
            height: 10,
            colorFilter: ColorFilter.mode(
              color,
              BlendMode.srcIn,
            ),
          ),
        ),
        const SizedBox(width: 4,),
        Text(
          '13',
          style: Theme.of(context).textTheme.labelSmall?.copyWith(
            color: color,
          ),
        ),
        const SizedBox(width: 4,),
        InkWell(
          onTap: () {},
          child: SvgPicture.asset(
            iconMinus,
            height: 10,
            colorFilter: ColorFilter.mode(
              color,
              BlendMode.srcIn,
            ),
          ),
        ),
      ],
    );
  }
}

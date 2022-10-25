import 'package:flutter/material.dart';

class CardSubtitleWidget extends StatelessWidget {
  final String subtitle;
  const CardSubtitleWidget({Key? key, required this.subtitle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      subtitle,
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
      style: Theme.of(context)
          .textTheme
          .headlineMedium!
          .copyWith(fontWeight: FontWeight.w300),
    );
  }
}

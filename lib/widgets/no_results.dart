import 'package:breaking_bad/utils/colors.dart';
import 'package:flutter/material.dart';

class NoResults extends StatelessWidget {
  final String image;
  final String text;
  final String subText;

  const NoResults({
    required this.image,
    required this.text,
    this.subText = '',
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(image),
        const SizedBox(
          height: 20,
        ),
        Text(
          text,
          style: Theme.of(context).textTheme.displaySmall,
        ),
        const SizedBox(
          height: 8,
        ),
        Text(
          subText,
          style: Theme.of(context)
              .textTheme
              .headlineMedium!
              .copyWith(color: labelBrownColor),
        ),
      ],
    );
  }
}

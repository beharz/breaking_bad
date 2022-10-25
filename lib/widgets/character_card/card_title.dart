import 'package:flutter/material.dart';

class CardTitleWidget extends StatelessWidget {
  final String title;
  const CardTitleWidget({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: Theme.of(context)
          .textTheme
          .headlineMedium!
          .copyWith(fontWeight: FontWeight.w500),
    );
  }
}

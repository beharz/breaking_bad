import 'package:breaking_bad/utils/app_sizes/app_dimensions.dart';
import 'package:flutter/material.dart';

class AppBarWidget extends StatelessWidget {
  const AppBarWidget({
    required this.leftButton,
    required this.title,
    required this.rightButton,
    Key? key,
  }) : super(key: key);

  final Widget leftButton;
  final String title;
  final Widget rightButton;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: AppDimensions.smallPadding4,
        bottom: AppDimensions.smallPadding4,
        right: AppDimensions.smallPadding8,
      ),
      child: SizedBox(
        height: AppDimensions.appBarHeight,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            leftButton,
            Text(title, style: Theme.of(context).textTheme.displaySmall),
            rightButton
          ],
        ),
      ),
    );
  }
}

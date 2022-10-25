import 'package:breaking_bad/utils/app_sizes/app_dimensions.dart';
import 'package:breaking_bad/utils/colors.dart';
import 'package:flutter/material.dart';

class DashboardTitleWidget extends StatelessWidget {
  const DashboardTitleWidget({
    required this.title,
    Key? key,
  }) : super(key: key);
  final String title;
  @override
  Widget build(BuildContext context) {
    return Container(
        height: AppDimensions.smallContainerHeight50,
        padding: const EdgeInsets.symmetric(
          horizontal: AppDimensions.defaultPadding,
        ),
        width: double.infinity,
        color: backgroundColor,
        child: Align(
            alignment: Alignment.centerLeft,
            child:
                Text(title, style: Theme.of(context).textTheme.displayMedium)));
  }
}

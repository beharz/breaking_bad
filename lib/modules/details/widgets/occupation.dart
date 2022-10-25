import 'package:breaking_bad/utils/app_sizes/app_dimensions.dart';
import 'package:breaking_bad/utils/colors.dart';
import 'package:flutter/material.dart';

class OccupationWidget extends StatelessWidget {
  final String occupation;
  const OccupationWidget({required this.occupation, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: AppDimensions.smallPadding),
      child: Chip(
          backgroundColor: greyPrimaryColor,
          label: Text(occupation,
              style: Theme.of(context)
                  .textTheme
                  .headlineSmall!
                  .copyWith(fontWeight: FontWeight.w400))),
    );
  }
}

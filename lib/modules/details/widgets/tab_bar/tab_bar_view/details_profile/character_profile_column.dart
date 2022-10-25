import 'package:breaking_bad/modules/details/widgets/tab_bar/tab_bar_view/details_profile/profile_info.dart';
import 'package:flutter/material.dart';

class CharacterProfileColumnWidget extends StatelessWidget {
  const CharacterProfileColumnWidget(
      {required this.firstTitle,
      required this.secondTitle,
      required this.thirdTitle,
      required this.firstValue,
      required this.secondValue,
      required this.thirdValue,
      Key? key})
      : super(key: key);

  final String firstTitle;
  final String secondTitle;
  final String thirdTitle;
  final String firstValue;
  final String secondValue;
  final String thirdValue;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ProfileInfoWidget(title: firstTitle, subtitle: firstValue),
          ProfileInfoWidget(title: secondTitle, subtitle: secondValue),
          ProfileInfoWidget(title: thirdTitle, subtitle: thirdValue),
        ],
      ),
    );
  }
}

import 'package:breaking_bad/modules/details/widgets/tab_bar/tab_bar_view/details_profile/character_profile_column.dart';
import 'package:breaking_bad/modules/details/providers/details_provider.dart';
import 'package:breaking_bad/utils/app_sizes/app_dimensions.dart';
import 'package:breaking_bad/utils/app_sizes/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DetailsProfileWidget extends StatelessWidget {
  const DetailsProfileWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
          left: AppDimensions.defaultPadding,
          right: AppDimensions.defaultPadding),
      child: Row(
        children: [
          CharacterProfileColumnWidget(
            firstTitle: AppStrings.name,
            secondTitle: AppStrings.nickName,
            thirdTitle: AppStrings.status,
            firstValue: context.watch<DetailsProvider>().character.name!,
            secondValue: context.watch<DetailsProvider>().character.nickname!,
            thirdValue: context.watch<DetailsProvider>().character.status!,
          ),
          CharacterProfileColumnWidget(
            firstTitle: AppStrings.actor,
            secondTitle: AppStrings.birthday,
            thirdTitle: AppStrings.categories,
            firstValue: context.watch<DetailsProvider>().character.portrayed!,
            secondValue: context.watch<DetailsProvider>().character.birthday!,
            thirdValue: context.watch<DetailsProvider>().character.category!,
          ),
        ],
      ),
    );
  }
}

import 'package:breaking_bad/modules/dashboard/enums/character_category.dart';
import 'package:breaking_bad/modules/dashboard/providers/dashboard_provider.dart';
import 'package:breaking_bad/utils/app_sizes/app_strings.dart';
import 'package:breaking_bad/utils/images.dart';
import 'package:breaking_bad/widgets/character_card/character_card.dart';
import 'package:breaking_bad/widgets/no_results.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TabListViewWidget extends StatelessWidget {
  const TabListViewWidget({
    required this.characterCategory,
    Key? key,
  }) : super(key: key);

  final CharacterCategory characterCategory;

  @override
  Widget build(BuildContext context) {
    return context
            .watch<DashboardProvider>()
            .charactersToShow(characterCategory)
            .isEmpty
        ? const NoResults(
            image: noResults,
            text: AppStrings.noCharactersFound,
            subText: AppStrings.findYourCharacterByNameOrNickname)
        : ListView.builder(
            itemCount: context
                .watch<DashboardProvider>()
                .charactersToShow(characterCategory)
                .length,
            itemBuilder: ((context, index) {
              return CharacterCardWidget(
                  character: context
                      .watch<DashboardProvider>()
                      .charactersToShow(characterCategory)[index]);
            }),
          );
  }
}

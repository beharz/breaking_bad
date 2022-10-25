import 'package:breaking_bad/modules/home/providers/home_provider.dart';
import 'package:breaking_bad/widgets/app_bar/back_button.dart';
import 'package:breaking_bad/widgets/character_card/character_card.dart';
import 'package:breaking_bad/modules/search/providers/search_provider.dart';
import 'package:breaking_bad/utils/app_sizes/app_dimensions.dart';
import 'package:breaking_bad/modules/home/enums/nav_screen.dart';
import 'package:breaking_bad/utils/app_sizes/app_strings.dart';
import 'package:breaking_bad/widgets/no_results.dart';
import 'package:breaking_bad/widgets/search_bar/search_bar.dart';
import 'package:breaking_bad/widgets/app_bar/app_bar.dart';
import 'package:breaking_bad/utils/images.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        AppBarWidget(
          leftButton: BackButtonWidget(
            onPressed: () => context.read<HomeProvider>().changeScreen(0),
          ),
          title: AppStrings.search,
          rightButton: Tooltip(
            message: AppStrings.searchForAnyCharacter,
            textStyle: Theme.of(context).textTheme.headlineLarge,
            child: const Padding(
              padding: EdgeInsets.only(
                left: AppDimensions.smallPadding12,
                right: AppDimensions.smallPadding12,
              ),
              child: Icon(
                size: AppDimensions.smallIconSize,
                Icons.info_outline,
                color: Colors.white,
              ),
            ),
          ),
        ),
        const SearchBarWidget(
          currentNavScreen: NavScreen.search,
        ),
        Expanded(
          child: context.watch<SearchProvider>().searchedCharacters.isEmpty
              ? NoResults(
                  image: noResults,
                  text: context
                          .watch<SearchProvider>()
                          .textEditingController
                          .text
                          .isEmpty
                      ? AppStrings.findYourCharacterByNameOrNickname
                      : AppStrings.noCharactersFound,
                  subText: context
                          .watch<SearchProvider>()
                          .textEditingController
                          .text
                          .isEmpty
                      ? ''
                      : AppStrings.findYourCharacterByNameOrNickname,
                )
              : ListView.builder(
                  itemCount:
                      context.watch<SearchProvider>().searchedCharacters.length,
                  itemBuilder: ((context, index) {
                    return CharacterCardWidget(
                      character: context
                          .watch<SearchProvider>()
                          .searchedCharacters[index],
                    );
                  }),
                ),
        ),
      ],
    );
  }
}

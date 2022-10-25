import 'package:breaking_bad/modules/favorite/widgets/popup_menu/popup_menu_button.dart';
import 'package:breaking_bad/modules/favorite/providers/favorite_provider.dart';
import 'package:breaking_bad/modules/home/providers/home_provider.dart';
import 'package:breaking_bad/widgets/app_bar/back_button.dart';
import 'package:breaking_bad/widgets/character_card/character_card.dart';
import 'package:breaking_bad/utils/app_sizes/app_strings.dart';
import 'package:breaking_bad/widgets/no_results.dart';
import 'package:breaking_bad/widgets/app_bar/app_bar.dart';
import 'package:breaking_bad/utils/images.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        AppBarWidget(
          leftButton: BackButtonWidget(
            onPressed: () => context.read<HomeProvider>().changeScreen(0),
          ),
          title: AppStrings.favoriteList,
          rightButton: const PopupMenuButtonWidget(),
        ),
        Expanded(
          child: (context.watch<FavoriteProvider>().favoriteCharacters.isEmpty)
              ? const NoResults(
                  image: emptyList,
                  text: AppStrings.thereIsNoCharacterYet,
                  subText: AppStrings.findYourCharacterByNameOrNickname)
              : ListView.builder(
                  itemCount: context
                      .watch<FavoriteProvider>()
                      .sortedFavoriteCharacters
                      .length,
                  itemBuilder: ((context, index) {
                    return CharacterCardWidget(
                        character: context
                            .watch<FavoriteProvider>()
                            .sortedFavoriteCharacters[index]);
                  })),
        ),
      ],
    );
  }
}

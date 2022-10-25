import 'package:breaking_bad/modules/favorite/enums/favorite_sort.dart';
import 'package:breaking_bad/modules/favorite/providers/favorite_provider.dart';
import 'package:breaking_bad/modules/favorite/widgets/popup_menu/popup_menu_item.dart';
import 'package:breaking_bad/utils/app_sizes/app_dimensions.dart';
import 'package:breaking_bad/utils/app_sizes/app_strings.dart';
import 'package:breaking_bad/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PopupMenuButtonWidget extends StatelessWidget {
  const PopupMenuButtonWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
        color: backgroundColor,
        icon: const Icon(
          size: AppDimensions.smallIconSize,
          Icons.sort,
          color: Colors.white,
        ),
        itemBuilder: (BuildContext context) => <PopupMenuEntry>[
              popupMenuItem(
                  context,
                  AppStrings.sortByName,
                  context.read<FavoriteProvider>().sortCharactersByName,
                  FavoriteSortType.name),
              popupMenuItem(
                  context,
                  AppStrings.sortByScore,
                  context.read<FavoriteProvider>().sortCharactersByScore,
                  FavoriteSortType.score),
              popupMenuItem(
                  context,
                  AppStrings.sortByModifyDate,
                  context.read<FavoriteProvider>().sortCharactersByModifyDate,
                  FavoriteSortType.modifyDate),
            ]);
  }
}

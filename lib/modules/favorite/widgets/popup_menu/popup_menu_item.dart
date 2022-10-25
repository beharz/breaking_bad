import 'package:breaking_bad/modules/favorite/providers/favorite_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

PopupMenuItem popupMenuItem(BuildContext context, String text,
    VoidCallback sortCharacter, Enum currentFavoriteSortType) {
  return PopupMenuItem(
    onTap: sortCharacter,
    child: Text(text,
        style: Theme.of(context).textTheme.displaySmall!.copyWith(
            fontWeight: currentFavoriteSortType ==
                    context.read<FavoriteProvider>().favoriteSortType
                ? FontWeight.w800
                : FontWeight.w300)),
  );
}

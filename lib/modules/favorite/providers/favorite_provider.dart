import 'package:breaking_bad/modules/dashboard/models/character.dart';
import 'package:breaking_bad/modules/dashboard/providers/dashboard_provider.dart';
import 'package:breaking_bad/modules/favorite/enums/favorite_sort.dart';
import 'package:breaking_bad/modules/favorite/services/favorite_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FavoriteProvider extends ChangeNotifier {
  FavoriteService favoriteService = FavoriteService();
  List<Character> _favoriteCharacters = [];
  List<Character> _sortedFavoriteCharacters = [];
  FavoriteSortType _favoriteSortType = FavoriteSortType.modifyDate;

  List<Character> get favoriteCharacters => _favoriteCharacters;
  List<Character> get sortedFavoriteCharacters => _sortedFavoriteCharacters;
  FavoriteSortType get favoriteSortType => _favoriteSortType;

  set favoriteCharacters(List<Character> value) {
    _favoriteCharacters = value;
    notifyListeners();
  }

  set sortedFavoriteCharacters(List<Character> value) {
    _sortedFavoriteCharacters = value;
    notifyListeners();
  }

  set favoriteSortType(FavoriteSortType favoriteSort) {
    _favoriteSortType = favoriteSort;
    notifyListeners();
  }

  void addOrDeleteFavoritecharacter(
      BuildContext context, Character character) async {
    if (favoriteCharacters.contains(character)) {
      favoriteService.deleteFavoritecharacter(character.charId!);
      favoriteCharacters.remove(character);
    } else {
      favoriteService.addFavoritecharacter(character.charId!);
      favoriteCharacters.add(character);
    }
    if (favoriteCharacters.isNotEmpty) {
      switch (favoriteSortType) {
        case FavoriteSortType.name:
          sortCharactersByName();
          break;
        case FavoriteSortType.score:
          sortCharactersByScore();
          break;
        case FavoriteSortType.modifyDate:
          sortCharactersByModifyDate();
          break;
        default:
          sortCharactersByModifyDate();
          break;
      }
    }
    notifyListeners();
  }

  void getFavoriteCharacters(BuildContext context) {
    favoriteService
        .retriveFavoritecharacter()
        .then((_) => context
                .read<DashboardProvider>()
                .allCharacters
                .forEach((character) {
              for (int i = 0; i < favoriteService.characterIdList.length; i++) {
                if (favoriteService.characterIdList[i]
                    .contains(character.charId.toString())) {
                  favoriteCharacters.add(character);
                  return;
                }
              }
            }))
        .then((_) => sortCharactersByModifyDate());
  }

  void sortCharactersByName() {
    sortedFavoriteCharacters = [];
    sortedFavoriteCharacters.addAll(favoriteCharacters);
    sortedFavoriteCharacters.sort(
      (a, b) => a.name!.toLowerCase().compareTo(b.name!.toLowerCase()),
    );
    favoriteSortType = FavoriteSortType.name;
    notifyListeners();
  }

  void sortCharactersByScore() {
    sortedFavoriteCharacters = [];
    sortedFavoriteCharacters.addAll(favoriteCharacters);
    sortedFavoriteCharacters.sort(
      (a, b) => b.score!.compareTo(a.score!),
    );
    favoriteSortType = FavoriteSortType.score;
    notifyListeners();
  }

  void sortCharactersByModifyDate() {
    List<Character> reverseList = [];
    sortedFavoriteCharacters = [];
    reverseList.addAll(favoriteCharacters);
    sortedFavoriteCharacters.addAll(reverseList.reversed);
    favoriteSortType = FavoriteSortType.modifyDate;
    notifyListeners();
  }
}

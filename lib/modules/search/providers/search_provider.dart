import 'package:breaking_bad/modules/dashboard/models/character.dart';
import 'package:flutter/material.dart';

class SearchProvider extends ChangeNotifier {
  List<Character> _searchedCharacters = [];
  final TextEditingController _textEditingController = TextEditingController();

  List<Character> get searchedCharacters => _searchedCharacters;
  TextEditingController get textEditingController => _textEditingController;

  set searchedCharacters(List<Character> value) {
    _searchedCharacters = value;
    notifyListeners();
  }

  void searchCharactersByNameOrNickName(
      List<Character> allCharacters, String value) {
    if (value.isEmpty) {
      searchedCharacters.clear();
    } else {
      searchedCharacters.clear();
      searchedCharacters.addAll(allCharacters);
      searchedCharacters.retainWhere((character) {
        return compareTexts(character.name! + character.nickname!, value);
      });
    }
    notifyListeners();
  }

  bool compareTexts(String characterNameAndNickName, String searchText) {
    return characterNameAndNickName
        .toLowerCase()
        .contains(searchText.toLowerCase());
  }

  clearSearchText() {
    textEditingController.clear();
    searchedCharacters.clear();
    notifyListeners();
  }
}

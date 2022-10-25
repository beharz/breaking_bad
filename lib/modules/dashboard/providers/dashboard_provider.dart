import 'package:breaking_bad/modules/dashboard/enums/character_category.dart';
import 'package:breaking_bad/modules/dashboard/models/character.dart';
import 'package:breaking_bad/modules/dashboard/services/dashboard_service.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'dart:math';

class DashboardProvider extends ChangeNotifier {
  List<Character> _allCharacters = [];
  final TextEditingController _textEditingController = TextEditingController();
  bool _isSearching = false;
  String _searchText = '';
  List<Character> _topCharacters = [];
  late TabController tabController;
  final List<Character> _tabBarListAll = [];
  final List<Character> _tabBarListBoth = [];
  final List<Character> _tabBarListBreakingBad = [];
  final List<Character> _tabBarListBetterCallSaul = [];
  final List<Character> _charactersControllerList = [];

  List<Character> get allCharacters => _allCharacters;
  List<Character> get topCharacters => _topCharacters;
  TextEditingController get textEditingController => _textEditingController;

  set allCharacters(List<Character> value) {
    _allCharacters = value;
    notifyListeners();
  }

  set topCharacters(List<Character> value) {
    _topCharacters = value;
    notifyListeners();
  }

  Future getAllCharacters() async {
    allCharacters = await DashboardService().fetchAllCharacters();
  }

  List<Character> sortCharactersController(
      CharacterCategory characterCategory, List<Character> list) {
    switch (characterCategory) {
      case CharacterCategory.all:
        _tabBarListAll.clear();
        _tabBarListAll.addAll(list);
        return _tabBarListAll;
      case CharacterCategory.both:
        _tabBarListBoth.clear();
        _tabBarListBoth.addAll(list);
        return _tabBarListBoth;
      case CharacterCategory.breakingBad:
        _tabBarListBreakingBad.clear();
        _tabBarListBreakingBad.addAll(list);
        return _tabBarListBreakingBad;
      case CharacterCategory.betterCallSaul:
        _tabBarListBetterCallSaul.clear();
        _tabBarListBetterCallSaul.addAll(list);
        return _tabBarListBetterCallSaul;
    }
  }

  List<Character> sortCharactersByCategory(
      CharacterCategory characterCategory) {
    _charactersControllerList.clear();
    _charactersControllerList.addAll(allCharacters);
    _charactersControllerList.retainWhere((element) =>
        element.category!.contains(characterCategory.getSortString()));
    return sortCharactersController(
        characterCategory, _charactersControllerList);
  }

  List<Character> sortCharactersBySearch(CharacterCategory characterCategory) {
    List<Character> sortedCharacters = sortCharactersByCategory(
            characterCategory)
        .where((character) =>
            compareTexts(character.name! + character.nickname!, _searchText))
        .toList();

    return sortCharactersController(characterCategory, sortedCharacters);
  }

  void searchOnChanged(String value) {
    if (value.isEmpty) {
      _isSearching = false;
      notifyListeners();
    } else {
      _isSearching = true;
      _searchText = value;
      notifyListeners();
    }
  }

  bool compareTexts(String characterNameAndNickName, String searchText) {
    return characterNameAndNickName
        .toLowerCase()
        .contains(searchText.toLowerCase());
  }

  clearSearchText() {
    textEditingController.clear();
    _isSearching = false;
    notifyListeners();
  }

  List<Character> charactersToShow(CharacterCategory characterCategory) {
    if (_isSearching) {
      return sortCharactersBySearch(characterCategory);
    } else {
      return sortCharactersByCategory(characterCategory);
    }
  }

  void getTopCharacters() {
    // The API does not provide us with top characters. We will temporarily generate them randomly.
    Random rng = Random();
    Character character;
    int randomCharId = 0;
    while (topCharacters.length < 5) {
      try {
        randomCharId = rng.nextInt(allCharacters.last.charId!);
        character = allCharacters
            .where((element) => element.charId == randomCharId)
            .first;
        if (!topCharacters.contains(character)) {
          topCharacters.add(character);
        } else {
          if (kDebugMode) {
            print(
                "Character with id: $randomCharId is already in the topCharacters list.");
          }
        }
      } catch (e) {
        if (kDebugMode) {
          print("Character with id: $randomCharId does not exist.");
        }
      }
    }
    notifyListeners();
  }
}

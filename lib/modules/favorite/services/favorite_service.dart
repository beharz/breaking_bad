import 'package:shared_preferences/shared_preferences.dart';
import 'package:breaking_bad/utils/app_sizes/app_strings.dart';

class FavoriteService {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  List<String> _characterIdList = [];

  List<String> get characterIdList => _characterIdList;

  set characterIdList(List<String> value) {
    _characterIdList = value;
  }

  Future<List<String>> retriveFavoritecharacter() async {
    SharedPreferences prefs = await _prefs;
    characterIdList = prefs.getStringList(AppStrings.characterIdList) ?? [];
    return characterIdList;
  }

  void addFavoritecharacter(int value) async {
    SharedPreferences prefs = await _prefs;
    characterIdList.add(value.toString());
    prefs.setStringList(AppStrings.characterIdList, characterIdList);
  }

  void deleteFavoritecharacter(int value) async {
    SharedPreferences prefs = await _prefs;
    characterIdList.remove(value.toString());
    prefs.setStringList(AppStrings.characterIdList, characterIdList);
  }
}

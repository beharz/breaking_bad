import 'package:breaking_bad/modules/dashboard/models/character.dart';
import 'package:breaking_bad/modules/details/models/episode.dart';
import 'package:breaking_bad/modules/details/models/quote.dart';
import 'package:breaking_bad/modules/details/services/details_service.dart';
import 'package:flutter/material.dart';

class DetailsProvider extends ChangeNotifier {
  List<Episode> _allEpisodes = [];
  List<Episode> _sortedEpisodes = [];
  List<Quote> _allQuotes = [];
  List<Quote> _sortedQuotes = [];
  String _occupationImage = '';
  bool _occupationImageLoading = true;

  Character _character = Character(
      appearance: [],
      betterCallSaulAppearance: [],
      birthday: '',
      category: '',
      charId: 0,
      img: '',
      name: '',
      nickname: '',
      occupation: [],
      portrayed: '',
      status: '');

  List<Episode> get allEpisodes => _allEpisodes;
  List<Quote> get allQuotes => _allQuotes;
  List<Episode> get sortedEpisodes => _sortedEpisodes;
  List<Quote> get sortedQuotes => _sortedQuotes;
  Character get character => _character;
  String get occupationImage => _occupationImage;
  bool get occupationImageLoading => _occupationImageLoading;

  set allEpisodes(List<Episode> value) {
    _allEpisodes = value;
    notifyListeners();
  }

  set sortedEpisodes(List<Episode> value) {
    _sortedEpisodes = value;
  }

  set sortedQuotes(List<Quote> value) {
    _sortedQuotes = value;
  }

  set allQuotes(List<Quote> value) {
    _allQuotes = value;
    notifyListeners();
  }

  set character(Character value) {
    _character = value;
    notifyListeners();
  }

  set occupationImage(String value) {
    _occupationImage = value;
    notifyListeners();
  }

  set occupationImageLoading(bool value) {
    _occupationImageLoading = value;
    notifyListeners();
  }

  Future getAllEpisodes(String characterName) async {
    allEpisodes = await DetailsService().fetchAllEpisodes();
    allEpisodes
        .retainWhere((element) => element.characters!.contains(characterName));
  }

  Future getAllQuotes(String characterName) async {
    allQuotes = await DetailsService().fetchAllQuotes();
    allQuotes.retainWhere((element) => element.author!.contains(characterName));
  }

  Future getOccupationImage() async {
    occupationImage = '';
    occupationImage = await DetailsService()
        .fetchOccupationImage(character.occupation![0])
        .onError((_, __) {
      occupationImageLoading = false;
      return '';
    });
    occupationImageLoading = false;
    notifyListeners();
  }

  prepareDetailsScreenInfo(Character value) {
    character = value;
    getAllEpisodes(character.name!);
    getAllQuotes(character.name!);
    getOccupationImage();
  }
}

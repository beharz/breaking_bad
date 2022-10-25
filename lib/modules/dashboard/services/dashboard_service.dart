import 'package:breaking_bad/modules/dashboard/models/character.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'dart:convert';
import 'dart:math';

class DashboardService {
  Future<List<Character>> fetchAllCharacters() async {
    Uri uri = Uri(
      scheme: "https",
      host: "breakingbadapi.com",
      path: "api/characters",
    );
    Response response = await http.get(uri);
    List<Character> characters = [];
    if (response.statusCode == 200) {
      characters = (json.decode(response.body) as List)
          .map((data) => Character.fromJson(data))
          .toList();
      for (var character in characters) {
        character.score = generateRandomScore();
      }
      return characters;
    }
    return [];
  }

  double generateRandomScore() {
    Random rng = Random();
    double randomNum = double.parse((rng.nextDouble() * 10).toStringAsFixed(1));
    return randomNum;
  }
}

import 'package:breaking_bad/modules/details/models/episode.dart';
import 'package:breaking_bad/modules/details/models/quote.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'dart:convert';

class DetailsService {
  Future<List<Episode>> fetchAllEpisodes() async {
    Uri uri = Uri(
      scheme: "https",
      host: "breakingbadapi.com",
      path: "api/episodes",
    );
    Response response = await http.get(uri);
    List<Episode> episodes = [];
    if (response.statusCode == 200) {
      episodes = (json.decode(response.body) as List)
          .map((data) => Episode.fromJson(data))
          .toList();
      return episodes;
    }
    return [];
  }

  Future<List<Quote>> fetchAllQuotes() async {
    Uri uri = Uri(
      scheme: "https",
      host: "breakingbadapi.com",
      path: "api/quotes",
    );
    Response response = await http.get(uri);
    List<Quote> quotes = [];
    if (response.statusCode == 200) {
      quotes = (json.decode(response.body) as List)
          .map((data) => Quote.fromJson(data))
          .toList();
      return quotes;
    }
    return [];
  }

  Future<String> fetchOccupationImage(String occupation) async {
    Map<String, dynamic> responseBody = {};
    String image;
    Uri uri = Uri(
        scheme: "https",
        host: "api.pexels.com",
        path: "v1/search",
        queryParameters: {
          'query': occupation,
          'per_page': '1',
          'page': '1',
          'size': 'small',
          'orientation': 'landscape'
        });
    Response response = await http.get(
      uri,
      headers: {
        'authorization':
            '563492ad6f91700001000001eea4a4e057da46ed9cd576df18b1ee5b'
      },
    );
    if (response.statusCode == 200) {
      responseBody = json.decode(response.body);
      if (responseBody['photos']!.isEmpty) {
        return '';
      }
      image = responseBody['photos']!.first['src']['landscape'];
      return image;
    }
    return '';
  }
}

class Episode {
  int? episodeId;
  String? title;
  String? season;
  String? airDate;
  List<String>? characters;
  String? episode;
  String? series;

  Episode(
      {this.episodeId,
      this.title,
      this.season,
      this.airDate,
      this.characters,
      this.episode,
      this.series});

  Episode.fromJson(Map<String, dynamic> json) {
    episodeId = json['episode_id'];
    title = json['title'];
    season = json['season'];
    airDate = json['air_date'];
    characters = json['characters'].cast<String>();
    episode = json['episode'];
    series = json['series'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['episode_id'] = this.episodeId;
    data['title'] = this.title;
    data['season'] = this.season;
    data['air_date'] = this.airDate;
    data['characters'] = this.characters;
    data['episode'] = this.episode;
    data['series'] = this.series;
    return data;
  }
}

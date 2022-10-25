import 'package:breaking_bad/modules/details/widgets/tab_bar/tab_bar_view/details_episodes.dart';
import 'package:breaking_bad/modules/details/widgets/tab_bar/tab_bar_view/details_profile/details_profile.dart';
import 'package:breaking_bad/modules/details/widgets/tab_bar/tab_bar_view/details_quotes.dart';
import 'package:flutter/material.dart';

enum DetailsCategory { profile, episodes, quotes }

extension DetailsCategoryExtension on DetailsCategory {
  String getDetailsTitle() {
    switch (this) {
      case DetailsCategory.profile:
        return 'Profile';
      case DetailsCategory.episodes:
        return 'Episodes';
      case DetailsCategory.quotes:
        return 'Quotes';
      default:
        return 'null';
    }
  }

  Widget getDetailsWidget() {
    switch (this) {
      case DetailsCategory.profile:
        return const DetailsProfileWidget();
      case DetailsCategory.episodes:
        return const DetailsEpisodesWidget();
      case DetailsCategory.quotes:
        return const DetailsQuotesWidget();
      default:
        return const Text('null');
    }
  }
}

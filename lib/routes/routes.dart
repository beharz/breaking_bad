import 'package:breaking_bad/modules/dashboard/screens/dashboard_screen.dart';
import 'package:breaking_bad/modules/details/screens/details_screen.dart';
import 'package:breaking_bad/modules/favorite/screens/favorite_screen.dart';
import 'package:breaking_bad/modules/home/screens/home_screen.dart';
import 'package:breaking_bad/modules/search/screens/search_screen.dart';
import 'package:breaking_bad/screens/splash_screen.dart';
import 'package:breaking_bad/utils/app_sizes/app_strings.dart';
import 'package:flutter/material.dart';

const String splashScreen = 'splashScreen';
const String dashboard = 'dashboard';
const String home = 'home';
const String search = 'search';
const String favorite = 'favorite';
const String details = 'details';

Route<dynamic> controller(RouteSettings settings) {
  switch (settings.name) {
    case splashScreen:
      return MaterialPageRoute(builder: (_) => const SplashScreen());
    case dashboard:
      return MaterialPageRoute(builder: (_) => const DashboardScreen());
    case home:
      return MaterialPageRoute(builder: (_) => const HomeScreen());
    case search:
      return MaterialPageRoute(builder: (_) => const SearchScreen());
    case favorite:
      return MaterialPageRoute(builder: (_) => const FavoriteScreen());
    case details:
      final args = settings.arguments as DetailsScreenArguments;
      return MaterialPageRoute(
          builder: (context) => DetailsScreen(heroKey: args.heroKey));
    default:
      throw (AppStrings.thisRouteDoesNotExist);
  }
}

class DetailsScreenArguments {
  final UniqueKey heroKey;
  DetailsScreenArguments({required this.heroKey});
}

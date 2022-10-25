import 'package:breaking_bad/modules/dashboard/providers/dashboard_provider.dart';
import 'package:breaking_bad/modules/favorite/providers/favorite_provider.dart';
import 'package:breaking_bad/routes/routes.dart' as route;
import 'package:breaking_bad/utils/colors.dart';
import 'package:breaking_bad/utils/images.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  getCharacters() async {
    await context.read<DashboardProvider>().getAllCharacters().then((value) {
      context.read<FavoriteProvider>().getFavoriteCharacters(context);
      context.read<DashboardProvider>().getTopCharacters();
    });
    _navigateToHome();
  }

  @override
  void initState() {
    getCharacters();
    super.initState();
  }

  _navigateToHome() {
    Navigator.pushReplacementNamed(context, route.home);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Center(
        child: Image.asset(logo),
      ),
    );
  }
}

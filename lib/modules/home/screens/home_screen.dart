import 'package:breaking_bad/modules/home/widgets/bottom_nav_bar/bottom_nav_bar.dart';
import 'package:breaking_bad/modules/dashboard/screens/dashboard_screen.dart';
import 'package:breaking_bad/modules/favorite/screens/favorite_screen.dart';
import 'package:breaking_bad/modules/home/providers/home_provider.dart';
import 'package:breaking_bad/modules/search/screens/search_screen.dart';
import 'package:breaking_bad/utils/colors.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List pages = const [
    DashboardScreen(),
    SearchScreen(),
    FavoriteScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => context.read<HomeProvider>().onBackPressed(context),
      child: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Container(
          color: backgroundColor,
          child: SafeArea(
            bottom: false,
            child: Scaffold(
              backgroundColor: backgroundColor,
              body: PageView.builder(
                onPageChanged: (value) {
                  context.read<HomeProvider>().swipeScreen(value);
                  FocusScope.of(context).unfocus();
                },
                itemBuilder: (context, index) {
                  return pages[index];
                },
                itemCount: pages.length,
                controller: context.watch<HomeProvider>().pageController,
              ),
              bottomNavigationBar: const BottomNavBar(),
            ),
          ),
        ),
      ),
    );
  }
}

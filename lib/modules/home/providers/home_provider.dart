import 'package:breaking_bad/utils/app_sizes/app_strings.dart';
import 'package:breaking_bad/utils/colors.dart';
import 'package:flutter/material.dart';

class HomeProvider extends ChangeNotifier {
  int _selectedNavigationItemIndex = 0;
  PageController _pageController = PageController();

  PageController get pageController => _pageController;
  int get selectedNavigationItemIndex => _selectedNavigationItemIndex;

  set pageController(PageController value) {
    _pageController = value;
    notifyListeners();
  }

  set selectedNavigationItemIndex(int value) {
    _selectedNavigationItemIndex = value;
    notifyListeners();
  }

  changeScreen(int screenIndex) {
    selectedNavigationItemIndex = screenIndex;
    pageController.jumpToPage(selectedNavigationItemIndex);
    notifyListeners();
  }

  swipeScreen(int screenIndex) {
    selectedNavigationItemIndex = screenIndex;
    pageController.animateToPage(selectedNavigationItemIndex,
        duration: const Duration(milliseconds: 200), curve: Curves.linear);
    notifyListeners();
  }

  Future<bool> onBackPressed(BuildContext context) async {
    if (selectedNavigationItemIndex != 0) {
      changeScreen(0);
      return false;
    }
    return await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: backgroundColor,
        title: const Text(AppStrings.doyouReallyWantToExitTheApp),
        actions: <Widget>[
          TextButton(
            child: Text(AppStrings.no,
                style: Theme.of(context).textTheme.displaySmall),
            onPressed: () => Navigator.pop(context, false),
          ),
          TextButton(
            child: Text(AppStrings.yes,
                style: Theme.of(context).textTheme.displaySmall),
            onPressed: () => Navigator.pop(context, true),
          ),
        ],
      ),
    );
  }
}

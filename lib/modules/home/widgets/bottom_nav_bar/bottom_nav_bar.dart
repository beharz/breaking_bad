import 'package:breaking_bad/modules/home/widgets/bottom_nav_bar/bottom_nav_bar_item.dart';
import 'package:breaking_bad/modules/home/providers/home_provider.dart';
import 'package:breaking_bad/utils/app_sizes/app_strings.dart';
import 'package:breaking_bad/utils/colors.dart';
import 'package:breaking_bad/utils/icons.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          border: Border(top: BorderSide(color: selectedColor, width: 1))),
      child: BottomNavigationBar(
        currentIndex: context.watch<HomeProvider>().selectedNavigationItemIndex,
        backgroundColor: backgroundColor,
        selectedItemColor: selectedColor,
        unselectedItemColor: greyPrimaryColor,
        onTap: (value) {
          context.read<HomeProvider>().changeScreen(value);
          FocusScope.of(context).unfocus();
        },
        items: [
          buildBottomNavBarItem(context,
              icon: home_nav, label: AppStrings.home, index: 0),
          buildBottomNavBarItem(context,
              icon: search_nav, label: AppStrings.search, index: 1),
          buildBottomNavBarItem(context,
              icon: favorite_nav, label: AppStrings.favoriteList, index: 2),
        ],
      ),
    );
  }
}

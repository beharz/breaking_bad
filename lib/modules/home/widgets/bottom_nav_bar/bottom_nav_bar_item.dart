import 'package:breaking_bad/modules/home/providers/home_provider.dart';
import 'package:breaking_bad/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

BottomNavigationBarItem buildBottomNavBarItem(
  BuildContext context, {
  required int index,
  required String icon,
  required String label,
}) {
  return BottomNavigationBarItem(
    icon: SvgPicture.asset(
      icon,
      color: context.watch<HomeProvider>().selectedNavigationItemIndex == index
          ? selectedColor
          : greyPrimaryColor,
    ),
    label: label,
  );
}

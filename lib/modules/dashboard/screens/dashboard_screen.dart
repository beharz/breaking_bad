import 'package:breaking_bad/modules/dashboard/widgets/top_characters/top_characters_list.dart';
import 'package:breaking_bad/modules/dashboard/widgets/tab_bar/tab_bar.dart';
import 'package:breaking_bad/modules/dashboard/widgets/dashboard_title.dart';
import 'package:breaking_bad/modules/home/enums/nav_screen.dart';
import 'package:breaking_bad/utils/app_sizes/app_dimensions.dart';
import 'package:breaking_bad/utils/colors.dart';
import 'package:breaking_bad/widgets/search_bar/search_bar.dart';
import 'package:breaking_bad/utils/app_sizes/app_strings.dart';
import 'package:flutter/material.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return NestedScrollView(
      headerSliverBuilder: (context, innerBoxIsScrolled) {
        return [
          SliverAppBar(
            backgroundColor: backgroundColor,
            expandedHeight: AppDimensions.defaultExpandedHeight,
            flexibleSpace: SingleChildScrollView(
              physics: const NeverScrollableScrollPhysics(),
              child: Column(
                children: const [
                  DashboardTitleWidget(
                      title: AppStrings.whichCharacterAreyouInterestedIn),
                  SearchBarWidget(
                    currentNavScreen: NavScreen.dashboard,
                  ),
                  TopCharactersListWidget(),
                ],
              ),
            ),
          ),
        ];
      },
      body: const TabBarWidget(),
    );
  }
}

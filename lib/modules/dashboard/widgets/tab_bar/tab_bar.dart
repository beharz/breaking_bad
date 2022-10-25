import 'package:breaking_bad/modules/dashboard/providers/dashboard_provider.dart';
import 'package:breaking_bad/modules/dashboard/widgets/dashboard_title.dart';
import 'package:breaking_bad/modules/dashboard/widgets/tab_bar/tab_list_view.dart';
import 'package:breaking_bad/modules/dashboard/enums/character_category.dart';
import 'package:breaking_bad/utils/app_sizes/app_dimensions.dart';
import 'package:breaking_bad/utils/app_sizes/app_strings.dart';
import 'package:breaking_bad/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TabBarWidget extends StatefulWidget {
  const TabBarWidget({Key? key}) : super(key: key);

  @override
  State<TabBarWidget> createState() => _TabBarWidgetState();
}

class _TabBarWidgetState extends State<TabBarWidget>
    with TickerProviderStateMixin {
  @override
  void initState() {
    context.read<DashboardProvider>().tabController =
        TabController(length: CharacterCategory.values.length, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const DashboardTitleWidget(title: AppStrings.categories),
        Container(
          color: backgroundColor,
          height: AppDimensions.largeSizedBoxHeight,
          width: double.infinity,
          child: TabBar(
            isScrollable: true,
            padding: const EdgeInsets.only(left: AppDimensions.smallPadding5),
            indicator: const UnderlineTabIndicator(
              insets:
                  EdgeInsets.symmetric(horizontal: AppDimensions.mediumPadding),
              borderSide: BorderSide(
                  width: AppDimensions.defaultBorderSideWidth,
                  color: tabBarIndicatorColor),
            ),
            labelStyle: Theme.of(context).textTheme.headlineLarge!.copyWith(
                  fontWeight: FontWeight.w600,
                ),
            unselectedLabelStyle: Theme.of(context).textTheme.headlineLarge,
            controller: context.watch<DashboardProvider>().tabController,
            tabs: CharacterCategory.values
                .map((category) => Text(category.getCategoryTitle()))
                .toList(),
          ),
        ),
        Container(
          color: backgroundColor,
          height: AppDimensions.smallSizedBoxHeight15,
        ),
        Expanded(
          child: TabBarView(
            controller: context.watch<DashboardProvider>().tabController,
            children: CharacterCategory.values
                .map((element) => TabListViewWidget(characterCategory: element))
                .toList(),
          ),
        ),
      ],
    );
  }
}

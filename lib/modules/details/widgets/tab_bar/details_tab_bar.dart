import 'package:breaking_bad/modules/details/enums/details_category.dart';
import 'package:breaking_bad/utils/app_sizes/app_dimensions.dart';
import 'package:breaking_bad/utils/colors.dart';
import 'package:flutter/material.dart';

class DetailsTabBarWidget extends StatefulWidget {
  const DetailsTabBarWidget({Key? key}) : super(key: key);

  @override
  State<DetailsTabBarWidget> createState() => _DetailsTabBarWidgetState();
}

class _DetailsTabBarWidgetState extends State<DetailsTabBarWidget>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    TabController tabController = TabController(length: 3, vsync: this);
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: AppDimensions.largeSizedBoxHeight,
            child: TabBar(
              isScrollable: true,
              padding: const EdgeInsets.only(left: AppDimensions.smallPadding5),
              indicator: const UnderlineTabIndicator(
                insets: EdgeInsets.symmetric(
                    horizontal: AppDimensions.mediumPadding),
                borderSide: BorderSide(
                    width: AppDimensions.defaultBorderSideWidth,
                    color: tabBarIndicatorColor),
              ),
              labelStyle: Theme.of(context).textTheme.headlineLarge!.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
              unselectedLabelStyle: Theme.of(context).textTheme.headlineLarge,
              controller: tabController,
              tabs: DetailsCategory.values
                  .map((category) => Text(category.getDetailsTitle()))
                  .toList(),
            ),
          ),
          const SizedBox(
            height: AppDimensions.smallSizedBoxHeight15,
          ),
          Expanded(
            child: TabBarView(
              controller: tabController,
              children: DetailsCategory.values
                  .map((category) => category.getDetailsWidget())
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }
}

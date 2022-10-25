import 'package:breaking_bad/modules/dashboard/providers/dashboard_provider.dart';
import 'package:breaking_bad/modules/home/enums/nav_screen.dart';
import 'package:breaking_bad/modules/search/providers/search_provider.dart';
import 'package:breaking_bad/utils/app_sizes/app_dimensions.dart';
import 'package:breaking_bad/utils/app_sizes/app_strings.dart';
import 'package:breaking_bad/utils/colors.dart';
import 'package:breaking_bad/widgets/search_bar/search_suffix_icon.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SearchBarWidget extends StatelessWidget {
  const SearchBarWidget({
    required this.currentNavScreen,
    Key? key,
  }) : super(key: key);
  final NavScreen currentNavScreen;

  @override
  Widget build(BuildContext context) {
    TextEditingController textEditingController =
        currentNavScreen == NavScreen.search
            ? context.watch<SearchProvider>().textEditingController
            : context.watch<DashboardProvider>().textEditingController;

    return Padding(
        padding: const EdgeInsets.only(
          left: AppDimensions.defaultPadding,
          top: AppDimensions.smallPadding,
          right: AppDimensions.defaultPadding,
          bottom: AppDimensions.defaultPadding,
        ),
        child: TextFormField(
          controller: textEditingController,
          style: const TextStyle(color: whiteColor),
          decoration: InputDecoration(
            hintText: AppStrings.search,
            hintStyle: Theme.of(context)
                .textTheme
                .headlineLarge!
                .copyWith(color: greyPrimaryColor),
            prefix: const SizedBox(
              width: AppDimensions.smallSizedBoxWidth,
            ),
            suffixIcon: SearchSuffixIconWidget(
              textEditingController: textEditingController,
              cleanTextCallback: currentNavScreen == NavScreen.search
                  ? context.read<SearchProvider>().clearSearchText
                  : context.read<DashboardProvider>().clearSearchText,
            ),
            filled: true,
            fillColor: tabBarIndicatorColor,
            border: const UnderlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.all(
                  Radius.circular(AppDimensions.mediumPadding)),
            ),
          ),
          onChanged: ((searchString) => currentNavScreen == NavScreen.search
              ? context.read<SearchProvider>().searchCharactersByNameOrNickName(
                  context.read<DashboardProvider>().allCharacters, searchString)
              : context
                  .read<DashboardProvider>()
                  .searchOnChanged(searchString)),
        ));
  }
}

import 'package:breaking_bad/modules/details/providers/details_provider.dart';
import 'package:breaking_bad/utils/app_sizes/app_dimensions.dart';
import 'package:breaking_bad/utils/app_sizes/app_strings.dart';
import 'package:breaking_bad/widgets/no_results.dart';
import 'package:breaking_bad/utils/colors.dart';
import 'package:breaking_bad/utils/images.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

class DetailsQuotesWidget extends StatelessWidget {
  const DetailsQuotesWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
          left: AppDimensions.defaultPadding,
          right: AppDimensions.defaultPadding),
      child: context.watch<DetailsProvider>().allQuotes.isEmpty
          ? const NoResults(
              image: emptyList,
              text: AppStrings.sorryHeSheDoesntHaveAnyQuote,
            )
          : ListView.builder(
              itemCount: context.watch<DetailsProvider>().allQuotes.length,
              itemBuilder: ((context, index) {
                return Container(
                  decoration: const BoxDecoration(
                      border: Border(
                          bottom: BorderSide(
                              color: greyPrimaryColor,
                              width: AppDimensions.smallBorderSideWidth))),
                  margin:
                      const EdgeInsets.only(bottom: AppDimensions.smallPadding),
                  padding:
                      const EdgeInsets.only(bottom: AppDimensions.smallPadding),
                  child: Text(
                      context.watch<DetailsProvider>().allQuotes[index].quote ??
                          AppStrings.unknown,
                      style: Theme.of(context).textTheme.headlineLarge),
                );
              })),
    );
  }
}

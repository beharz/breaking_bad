import 'package:breaking_bad/modules/details/providers/details_provider.dart';
import 'package:breaking_bad/utils/app_sizes/app_dimensions.dart';
import 'package:breaking_bad/utils/app_sizes/app_strings.dart';
import 'package:breaking_bad/widgets/no_results.dart';
import 'package:breaking_bad/utils/colors.dart';
import 'package:breaking_bad/utils/images.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DetailsEpisodesWidget extends StatelessWidget {
  const DetailsEpisodesWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
          left: AppDimensions.defaultPadding,
          right: AppDimensions.defaultPadding),
      child: context.watch<DetailsProvider>().allEpisodes.isEmpty
          ? const NoResults(
              image: emptyList,
              text: AppStrings.sorryWeCantFindAnyEpisode,
            )
          : ListView.builder(
              itemCount: context.watch<DetailsProvider>().allEpisodes.length,
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
                  child: Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Flexible(
                            child: Text(
                                context
                                    .watch<DetailsProvider>()
                                    .allEpisodes[index]
                                    .title!,
                                style:
                                    Theme.of(context).textTheme.displayMedium),
                          ),
                          Flexible(
                            child: FittedBox(
                              fit: BoxFit.cover,
                              child: Text(
                                context
                                    .watch<DetailsProvider>()
                                    .allEpisodes[index]
                                    .series!,
                                style: Theme.of(context).textTheme.displaySmall,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: AppDimensions.smallSizedBoxHeight10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            context
                                .watch<DetailsProvider>()
                                .allEpisodes[index]
                                .airDate!,
                            style: Theme.of(context)
                                .textTheme
                                .headlineSmall!
                                .copyWith(fontWeight: FontWeight.w400),
                          ),
                          Text(
                            '${AppStrings.season} ${context.watch<DetailsProvider>().allEpisodes[index].season ?? AppStrings.unknown} ${AppStrings.ep} ${context.watch<DetailsProvider>().allEpisodes[index].episode ?? AppStrings.unknown}',
                            style: Theme.of(context)
                                .textTheme
                                .headlineSmall!
                                .copyWith(fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              })),
    );
  }
}

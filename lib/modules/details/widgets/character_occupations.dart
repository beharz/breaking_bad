import 'package:breaking_bad/widgets/character_card/card_icons/score_icon.dart';
import 'package:breaking_bad/modules/details/providers/details_provider.dart';
import 'package:breaking_bad/modules/details/widgets/occupation.dart';
import 'package:breaking_bad/utils/app_sizes/app_dimensions.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

class CharacterOccupationsWidget extends StatelessWidget {
  const CharacterOccupationsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppDimensions.sizedBoxHeight55,
      width: double.maxFinite,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: AppDimensions.defaultPadding),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ScoreIconWidget(
                    score: context.read<DetailsProvider>().character.score!)
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: context
                    .read<DetailsProvider>()
                    .character
                    .occupation!
                    .length,
                itemBuilder: ((context, index) {
                  return OccupationWidget(
                    occupation: context
                        .read<DetailsProvider>()
                        .character
                        .occupation![index],
                  );
                })),
          )
        ],
      ),
    );
  }
}

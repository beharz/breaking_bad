import 'package:breaking_bad/modules/details/providers/details_provider.dart';
import 'package:breaking_bad/widgets/character_card/card_icons/score_icon.dart';
import 'package:breaking_bad/widgets/character_card/card_subtitle.dart';
import 'package:breaking_bad/widgets/character_card/card_icons/favorite_icon.dart';
import 'package:breaking_bad/modules/dashboard/models/character.dart';
import 'package:breaking_bad/widgets/character_card/card_title.dart';
import 'package:breaking_bad/utils/app_sizes/app_dimensions.dart';
import 'package:breaking_bad/utils/app_sizes/app_strings.dart';
import 'package:breaking_bad/routes/routes.dart' as route;
import 'package:breaking_bad/utils/images.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CharacterCardWidget extends StatelessWidget {
  const CharacterCardWidget({
    required this.character,
    Key? key,
  }) : super(key: key);
  final Character character;

  @override
  Widget build(BuildContext context) {
    final UniqueKey heroKey = UniqueKey();
    return InkWell(
      onTap: (() {
        FocusScope.of(context).unfocus();
        context.read<DetailsProvider>().prepareDetailsScreenInfo(character);
        Navigator.pushNamed(context, route.details,
                arguments: route.DetailsScreenArguments(heroKey: heroKey))
            .then((_) =>
                context.read<DetailsProvider>().occupationImageLoading = true);
      }),
      child: Container(
        padding: const EdgeInsets.symmetric(
            horizontal: AppDimensions.defaultPadding,
            vertical: AppDimensions.smallPadding),
        height: AppDimensions.defaultContainerHeight,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Hero(
              tag: heroKey,
              child: Container(
                width: AppDimensions.smallContainerWidth,
                height: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    AppDimensions.defaultPadding,
                  ),
                  image: const DecorationImage(
                      image: AssetImage(unknownAvatar), fit: BoxFit.cover),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(
                    AppDimensions.defaultPadding,
                  ),
                  child: ColorFiltered(
                    colorFilter: ColorFilter.mode(
                      character.status == 'Deceased'
                          ? Colors.grey
                          : Colors.transparent,
                      BlendMode.saturation,
                    ),
                    child: Image.network(
                      character.img!,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) =>
                          const SizedBox(),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: AppDimensions.defaultSizedBoxWidth,
            ),
            Expanded(
              flex: 4,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CardTitleWidget(title: AppStrings.name),
                  CardSubtitleWidget(
                      subtitle: '${character.name!} (${character.nickname!})'),
                  const Spacer(),
                  const CardTitleWidget(title: AppStrings.birthday),
                  CardSubtitleWidget(subtitle: character.birthday!),
                  const Spacer(),
                  const CardTitleWidget(title: AppStrings.actor),
                  CardSubtitleWidget(subtitle: character.portrayed!),
                ],
              ),
            ),
            const Spacer(),
            Column(
              children: [
                FavoriteIconWidget(character: character),
                const SizedBox(
                  height: AppDimensions.smallSizedBoxHeight,
                ),
                ScoreIconWidget(score: character.score ?? 0),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

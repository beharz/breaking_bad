import 'package:breaking_bad/modules/dashboard/widgets/top_characters/top_characters_number.dart';
import 'package:breaking_bad/modules/details/providers/details_provider.dart';
import 'package:breaking_bad/modules/dashboard/models/character.dart';
import 'package:breaking_bad/utils/app_sizes/app_dimensions.dart';
import 'package:breaking_bad/routes/routes.dart' as route;
import 'package:breaking_bad/utils/images.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TopCharactersWidget extends StatelessWidget {
  final Character character;
  final int index;
  const TopCharactersWidget({
    Key? key,
    required this.character,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final UniqueKey heroKey = UniqueKey();
    return SizedBox(
      width: AppDimensions.containerWidth120,
      child: InkWell(
        onTap: () {
          FocusScope.of(context).unfocus();
          context.read<DetailsProvider>().prepareDetailsScreenInfo(character);
          Navigator.pushNamed(context, route.details,
                  arguments: route.DetailsScreenArguments(heroKey: heroKey))
              .then((_) => context
                  .read<DetailsProvider>()
                  .occupationImageLoading = true);
        },
        child: Stack(
          alignment: AlignmentDirectional.center,
          children: [
            Hero(
              tag: heroKey,
              child: Container(
                width: AppDimensions.smallContainerWidth,
                height: AppDimensions.containerHeight200,
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
            TopCharacterNumberWidget(index: index),
          ],
        ),
      ),
    );
  }
}

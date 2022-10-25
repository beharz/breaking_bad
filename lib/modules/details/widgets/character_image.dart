import 'package:breaking_bad/modules/details/providers/details_provider.dart';
import 'package:breaking_bad/modules/details/widgets/occupation_image.dart';
import 'package:breaking_bad/utils/app_sizes/app_dimensions.dart';
import 'package:breaking_bad/utils/app_sizes/app_strings.dart';
import 'package:breaking_bad/utils/images.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CharacterImageWidget extends StatelessWidget {
  const CharacterImageWidget({required this.heroKey, Key? key})
      : super(key: key);

  final UniqueKey heroKey;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double height = size.height;
    double width = size.width;
    return SizedBox(
      height: height * AppDimensions.characterDetailsRatio035,
      width: double.infinity,
      child: Stack(
        children: [
          const OccupationImageWidget(),
          Positioned(
            bottom: AppDimensions.positionedValue2,
            left: AppDimensions.positionedValue20,
            child: Row(
              children: [
                Hero(
                  tag: heroKey,
                  child: Container(
                    height: height * AppDimensions.characterDetailsRatio020,
                    width: width * AppDimensions.characterDetailsRatio025,
                    decoration: BoxDecoration(
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black,
                          spreadRadius: AppDimensions.spreadRadius,
                          blurRadius: AppDimensions.blurRadius,
                        ),
                      ],
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
                          context.watch<DetailsProvider>().character.status ==
                                  'Deceased'
                              ? Colors.grey
                              : Colors.transparent,
                          BlendMode.saturation,
                        ),
                        child: Image.network(
                          context.watch<DetailsProvider>().character.img!,
                          fit: BoxFit.cover,
                          errorBuilder: (context, _, __) => const SizedBox(),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: AppDimensions.defaultSizedBoxWidth,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: AppDimensions.sizedBoxHeight60,
                    ),
                    SizedBox(
                      width: width * AppDimensions.characterDetailsRatio06,
                      child: Text(
                        context.watch<DetailsProvider>().character.name ??
                            AppStrings.unknown,
                        style: Theme.of(context).textTheme.displayMedium,
                        maxLines: 2,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

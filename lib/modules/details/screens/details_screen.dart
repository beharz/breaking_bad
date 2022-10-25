import 'package:breaking_bad/modules/details/providers/details_provider.dart';
import 'package:breaking_bad/modules/details/widgets/character_image.dart';
import 'package:breaking_bad/modules/details/widgets/character_occupations.dart';
import 'package:breaking_bad/modules/details/widgets/tab_bar/details_tab_bar.dart';
import 'package:breaking_bad/utils/app_sizes/app_strings.dart';
import 'package:breaking_bad/utils/colors.dart';
import 'package:breaking_bad/widgets/app_bar/app_bar.dart';
import 'package:breaking_bad/widgets/app_bar/back_button.dart';
import 'package:breaking_bad/widgets/character_card/card_icons/favorite_icon.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({required this.heroKey, Key? key}) : super(key: key);
  final UniqueKey heroKey;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            AppBarWidget(
              leftButton: BackButtonWidget(
                onPressed: () {
                  Navigator.pop(context);
                  context.read<DetailsProvider>().occupationImageLoading = true;
                },
              ),
              title: AppStrings.details,
              rightButton: FavoriteIconWidget(
                  character: context.watch<DetailsProvider>().character),
            ),
            CharacterImageWidget(
              heroKey: heroKey,
            ),
            const CharacterOccupationsWidget(),
            const DetailsTabBarWidget(),
          ],
        ),
      ),
    );
  }
}

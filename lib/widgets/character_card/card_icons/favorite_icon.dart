import 'package:breaking_bad/modules/dashboard/models/character.dart';
import 'package:breaking_bad/modules/favorite/providers/favorite_provider.dart';
import 'package:breaking_bad/utils/app_sizes/app_dimensions.dart';
import 'package:breaking_bad/utils/icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class FavoriteIconWidget extends StatefulWidget {
  const FavoriteIconWidget({required this.character, Key? key})
      : super(key: key);
  final Character character;
  @override
  State<FavoriteIconWidget> createState() => _FavoriteIconWidgetState();
}

class _FavoriteIconWidgetState extends State<FavoriteIconWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: AppDimensions.smallPadding12,
        right: AppDimensions.smallPadding12,
      ),
      child: InkWell(
        onTap: () => setState(() {
          context
              .read<FavoriteProvider>()
              .addOrDeleteFavoritecharacter(context, widget.character);
        }),
        child: context
                .watch<FavoriteProvider>()
                .favoriteCharacters
                .contains(widget.character)
            ? SvgPicture.asset(favorite)
            : const Icon(
                Icons.bookmark,
                color: Colors.white,
              ),
      ),
    );
  }
}

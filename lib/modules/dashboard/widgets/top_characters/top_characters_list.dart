import 'package:breaking_bad/modules/dashboard/widgets/top_characters/top_characters.dart';
import 'package:breaking_bad/modules/dashboard/providers/dashboard_provider.dart';
import 'package:breaking_bad/utils/app_sizes/app_dimensions.dart';
import 'package:breaking_bad/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TopCharactersListWidget extends StatelessWidget {
  const TopCharactersListWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppDimensions.defaultContainerHeight,
      color: backgroundColor,
      width: double.infinity,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: context.read<DashboardProvider>().topCharacters.length,
          itemBuilder: ((context, index) {
            return TopCharactersWidget(
              character:
                  context.watch<DashboardProvider>().topCharacters[index],
              index: index + 1,
            );
          })),
    );
  }
}

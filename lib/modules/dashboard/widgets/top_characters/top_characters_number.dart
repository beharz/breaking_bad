import 'package:breaking_bad/utils/app_sizes/app_dimensions.dart';
import 'package:breaking_bad/utils/colors.dart';
import 'package:flutter/material.dart';

class TopCharacterNumberWidget extends StatelessWidget {
  const TopCharacterNumberWidget({
    Key? key,
    required this.index,
  }) : super(key: key);

  final int index;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: AppDimensions.positionedValue1,
      bottom: AppDimensions.positionedValueNegative10,
      child: Stack(
        children: [
          Text(
            '$index',
            style: Theme.of(context).textTheme.displayLarge!.copyWith(
                  fontFamily: 'Montserrat',
                  foreground: Paint()
                    ..style = PaintingStyle.stroke
                    ..strokeWidth = 2
                    ..color = selectedColor,
                ),
          ),
          Text(
            '$index',
            style: Theme.of(context).textTheme.displayLarge!.copyWith(
                  fontFamily: 'Montserrat',
                  color: greyNumberColor,
                ),
          ),
        ],
      ),
    );
  }
}

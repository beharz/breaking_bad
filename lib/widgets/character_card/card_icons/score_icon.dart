import 'package:flutter/material.dart';

class ScoreIconWidget extends StatelessWidget {
  const ScoreIconWidget({required this.score, Key? key}) : super(key: key);
  final double score;

  Color getColorValue(double score) {
    int value = score.round();

    if (score == 0.0) return Colors.red[900]!;

    if (value <= 5) {
      return Colors.red[600 - value * 100]!;
    } else {
      return Colors.blue[value * 100 - 500]!;
    }
  }

  @override
  Widget build(BuildContext context) {
    late final Color scoreColor;
    scoreColor = getColorValue(score);
    return Column(
      children: [
        Icon(
          Icons.star,
          color: scoreColor,
        ),
        Text(
          '$score',
          style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                fontWeight: FontWeight.w300,
                color: scoreColor,
              ),
        ),
      ],
    );
  }
}

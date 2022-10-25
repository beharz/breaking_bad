import 'package:breaking_bad/utils/app_sizes/app_dimensions.dart';
import 'package:flutter/material.dart';

class BackButtonWidget extends StatelessWidget {
  const BackButtonWidget({required this.onPressed, Key? key}) : super(key: key);
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      icon: const Icon(
        Icons.chevron_left,
        size: AppDimensions.defaultIconSize,
        color: Colors.white,
      ),
    );
  }
}

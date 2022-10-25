import 'package:flutter/material.dart';

class SearchSuffixIconWidget extends StatelessWidget {
  final TextEditingController textEditingController;
  final VoidCallback cleanTextCallback;
  const SearchSuffixIconWidget({
    required this.textEditingController,
    required this.cleanTextCallback,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return textEditingController.text.isEmpty
        ? const Icon(
            Icons.search,
          )
        : InkWell(
            onTap: cleanTextCallback,
            child: const Icon(
              Icons.clear,
            ),
          );
  }
}

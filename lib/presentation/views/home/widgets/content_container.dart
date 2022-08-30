import 'package:flutter/material.dart';

class ContentContainer extends StatelessWidget {
  const ContentContainer({Key? key, required this.content}) : super(key: key);

  final Widget content;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.secondary,
        borderRadius: BorderRadius.circular(15),
      ),
      height: 200,
      padding: const EdgeInsets.all(12),
      child: content,
    );
  }
}

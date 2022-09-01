import 'package:flutter/material.dart';

class CustomScrollableSheet extends StatelessWidget {
  const CustomScrollableSheet({
    Key? key,
    required this.content,
  }) : super(key: key);

  final Widget content;

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      maxChildSize: 0.9,
      builder: (_, scrollController) {
        return Container(
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.background,
            borderRadius: const BorderRadius.vertical(
              top: Radius.circular(25),
            ),
          ),
          padding: const EdgeInsets.all(12),
          child: SingleChildScrollView(
            controller: scrollController,
            child: content,
          ),
        );
      },
    );
  }
}

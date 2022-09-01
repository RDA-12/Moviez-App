import 'package:flutter/material.dart';

import '../../widgets/vertical_space.dart';

class ContentHolder extends StatelessWidget {
  const ContentHolder({
    Key? key,
    required this.title,
    required this.content,
  }) : super(key: key);

  final String title;
  final Widget content;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title),
        const VerticalSpace(height: 5),
        content,
      ],
    );
  }
}

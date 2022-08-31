import 'package:flutter/material.dart';

import '../../widgets/vertical_space.dart';

class InfoCard extends StatelessWidget {
  const InfoCard({
    Key? key,
    required this.title,
    required this.data,
    required this.icon,
  }) : super(key: key);

  final String title, data;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(icon),
              const VerticalSpace(height: 16),
              Text(
                title,
                style: Theme.of(context).textTheme.caption,
              ),
              Text(data),
            ],
          ),
        ),
      ),
    );
  }
}

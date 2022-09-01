import 'package:flutter/material.dart';

import 'info_card.dart';

class MovieDataList extends StatelessWidget {
  const MovieDataList({
    Key? key,
    required this.runtime,
    required this.releaseYear,
    required this.contentRating,
  }) : super(key: key);

  final String runtime;
  final String releaseYear;
  final String contentRating;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          InfoCard(
            title: "duration",
            data: runtime,
            icon: Icons.restore,
          ),
          InfoCard(
            title: "release year",
            data: releaseYear,
            icon: Icons.calendar_month_rounded,
          ),
          InfoCard(
            title: "accessibility",
            data: contentRating,
            icon: Icons.lock_person_rounded,
          ),
        ],
      ),
    );
  }
}

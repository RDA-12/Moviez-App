import 'package:flutter/material.dart';

import '../../../../domain/entity/movie.dart';
import '../../widgets/vertical_space.dart';
import 'custom_network_image.dart';

class MovieList extends StatelessWidget {
  const MovieList({
    Key? key,
    required this.title,
    required this.movies,
  }) : super(key: key);

  final String title;
  final List<Movie> movies;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
              child: Text(title),
            ),
            if (movies.length > 5)
              Material(
                color: Colors.transparent,
                type: MaterialType.button,
                child: InkWell(
                  onTap: () {},
                  child: const Text("See All"),
                ),
              )
          ],
        ),
        const VerticalSpace(height: 12),
        Expanded(
          child: ListView.builder(
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemCount: movies.length > 5 ? 5 : movies.length,
            itemBuilder: (_, index) {
              return Card(
                child: CustomNetworkImage(
                  imageUrl: movies[index].image,
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

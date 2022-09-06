import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../../../domain/entity/news.dart';
import '../../../routes/routes.gr.dart';
import '../../widgets/custom_network_image.dart';
import '../../widgets/interactive_card.dart';
import '../../widgets/vertical_space.dart';

class NewsList extends StatelessWidget {
  const NewsList({super.key, required this.news});

  final List<News> news;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: news.length,
      itemBuilder: (_, i) {
        return InteractiveCard(
          color: Theme.of(context).colorScheme.secondary,
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: CustomNetworkImage(
                    imageUrl: news[i].imageUrl,
                  ),
                ),
                const VerticalSpace(height: 8),
                Text(
                  news[i].title,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const VerticalSpace(height: 5),
                Text(
                  news[i].description,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.caption,
                ),
              ],
            ),
          ),
          onTap: () {
            context.router.push(
              NewsDetailRoute(url: news[i].url),
            );
          },
        );
      },
    );
  }
}

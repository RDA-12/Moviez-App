import 'package:flutter/material.dart';

import '../../widgets/custom_network_image.dart';
import '../../widgets/interactive_card.dart';

class TrailerThumbnail extends StatelessWidget {
  const TrailerThumbnail({
    Key? key,
    required this.youtubeId,
    required this.onTap,
  }) : super(key: key);

  final String youtubeId;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 16 / 9,
      child: Stack(
        children: [
          Positioned.fill(
            child: InteractiveCard(
              onTap: onTap,
              child: CustomNetworkImage(
                fit: BoxFit.fill,
                imageUrl: getThumbnail(
                  youtubeId,
                ),
              ),
            ),
          ),
          Align(
            child: IconButton(
              icon: const Icon(Icons.play_circle_fill_rounded),
              onPressed: onTap,
              iconSize: 32,
              color: Theme.of(context).colorScheme.primary,
            ),
          )
        ],
      ),
    );
  }

  String getThumbnail(String id) {
    return "https://img.youtube.com/vi/$id/0.jpg";
  }
}

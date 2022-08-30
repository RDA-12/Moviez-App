import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CustomNetworkImage extends StatelessWidget {
  const CustomNetworkImage({
    Key? key,
    required this.imageUrl,
  }) : super(key: key);

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      progressIndicatorBuilder: (_, __, ___) => Container(
        color: Colors.grey,
      ),
      errorWidget: (_, __, ___) => const Center(
        child: Icon(Icons.error_outline),
      ),
      fit: BoxFit.cover,
    );
  }
}

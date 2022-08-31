import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CustomNetworkImage extends StatelessWidget {
  const CustomNetworkImage({
    Key? key,
    required this.imageUrl,
    this.fit = BoxFit.cover,
  }) : super(key: key);

  final String imageUrl;
  final BoxFit fit;

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
      fit: fit,
      alignment: Alignment.topCenter,
    );
  }
}

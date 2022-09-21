import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../widgets/custom_network_image.dart';

class Avatar extends StatelessWidget {
  const Avatar({
    super.key,
    required this.profileImgUrl,
    required this.onTap,
    this.data,
  });

  final String profileImgUrl;
  final Uint8List? data;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox.square(
        dimension: 72,
        child: ClipOval(
          child: data != null
              ? Image.memory(
                  data!,
                  fit: BoxFit.cover,
                )
              : profileImgUrl != ""
                  ? CustomNetworkImage(imageUrl: profileImgUrl)
                  : DecoratedBox(
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.primary,
                      ),
                      child: Icon(
                        Icons.person,
                        color: Theme.of(context).colorScheme.onPrimary,
                      ),
                    ),
        ),
      ),
    );
  }
}

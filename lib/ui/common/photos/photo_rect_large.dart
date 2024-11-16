import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class PhotoRectLarge extends StatelessWidget {
  final String? imageUrl;
  final double? height;
  const PhotoRectLarge({super.key, this.imageUrl, this.height});

  @override
  Widget build(
    BuildContext context,
  ) {
    if (imageUrl == null || imageUrl!.isEmpty) {
      return ClipRRect(
        borderRadius: BorderRadius.circular(5),
        child: Container(
          width: double.infinity,
          color: Theme.of(context).colorScheme.tertiary.withOpacity(0.1),
          child: const Icon(
            Icons.image_outlined,
            size: 60,
          ),
        ),
      );
    } else {
      return ClipRRect(
        borderRadius: BorderRadius.circular(5),
        child: CachedNetworkImage(
          fit: BoxFit.cover,
          imageUrl: imageUrl!,
          height: height,
          progressIndicatorBuilder: (context, url, downloadProgress) =>
              SizedBox(
            width: 40,
            height: 40,
            child: CircularProgressIndicator(value: downloadProgress.progress),
          ),
          errorWidget: (context, url, error) => const Icon(Icons.error_outline),
        ),
      );
    }
  }
}

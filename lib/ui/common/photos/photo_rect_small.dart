import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:local_roots_2/ui/common/photos/photo_rect_large.dart';
import 'package:shimmer/shimmer.dart';

class PhotoRectSmall extends StatelessWidget {
  final String? imageUrl;
  const PhotoRectSmall({super.key, this.imageUrl});

  @override
  Widget build(BuildContext context) {
    if (imageUrl == null || imageUrl!.isEmpty) {
      return ClipRRect(
        borderRadius: BorderRadius.circular(5),
        child: Container(
          width: double.infinity,
          color: Theme.of(context).colorScheme.tertiary.withOpacity(0.1),
          child: const Icon(
            Icons.image_outlined,
            size: 30,
          ),
        ),
      );
    } else {
      return ClipRRect(
        borderRadius: BorderRadius.circular(5),
        child: CachedNetworkImage(
          fit: BoxFit.cover,
          imageUrl: imageUrl!,
          progressIndicatorBuilder: (context, url, downloadProgress) =>
              Shimmer.fromColors(
            baseColor: Theme.of(context).colorScheme.surface,
            highlightColor: adjustColorBrightness(
                Theme.of(context).colorScheme.surface, 0.6),
            child: Container(
              height: double.infinity,
              width: double.infinity,
              color: Theme.of(context).colorScheme.surfaceContainer,
            ),
          ),
          errorWidget: (context, url, error) => const Icon(Icons.error_outline),
        ),
      );
    }
  }
}

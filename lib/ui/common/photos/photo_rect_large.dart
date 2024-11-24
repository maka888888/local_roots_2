import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

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
          // progressIndicatorBuilder: (context, url, downloadProgress) => Center(
          //   child: SizedBox(
          //     width: 40,
          //     height: 40,
          //     child:
          //         CircularProgressIndicator(value: downloadProgress.progress),
          //   ),
          // ),
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

Color adjustColorBrightness(Color color, double amount) {
  int r = color.red;
  int g = color.green;
  int b = color.blue;

  if (amount > 0) {
    r += ((255 - r) * amount).toInt();
    g += ((255 - g) * amount).toInt();
    b += ((255 - b) * amount).toInt();
  } else {
    r += (r * amount).toInt();
    g += (g * amount).toInt();
    b += (b * amount).toInt();
  }

  return Color.fromRGBO(r, g, b, 1);
}

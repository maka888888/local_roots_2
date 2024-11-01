import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class PhotoOvalLarge extends StatelessWidget {
  final String? photoUrl;
  const PhotoOvalLarge({super.key, required this.photoUrl});

  @override
  Widget build(BuildContext context) {
    if (photoUrl == null || photoUrl == '') {
      return const CircleAvatar(
        radius: 36,
        child: Icon(Icons.nature_people_outlined, size: 60),
      );
    } else {
      return ClipOval(
        child: CachedNetworkImage(
          height: 200,
          width: 200,
          fit: BoxFit.cover,
          imageUrl: photoUrl!,
          progressIndicatorBuilder: (context, url, downloadProgress) =>
              CircularProgressIndicator(value: downloadProgress.progress),
          errorWidget: (context, url, error) => const Icon(Icons.error_outline),
        ),
      );

    }
  }
}

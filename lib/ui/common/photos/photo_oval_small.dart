import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class PhotoOvalSmall extends StatelessWidget {
  final String? photoUrl;
  const PhotoOvalSmall({super.key, required this.photoUrl});

  @override
  Widget build(BuildContext context) {
    if (photoUrl == null || photoUrl == '') {
      return const CircleAvatar(
        radius: 24,
        child: Icon(Icons.nature_people_outlined, size: 24),
      );
    } else {
      return ClipOval(
        child: CachedNetworkImage(
          height: 48,
          width: 48,
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

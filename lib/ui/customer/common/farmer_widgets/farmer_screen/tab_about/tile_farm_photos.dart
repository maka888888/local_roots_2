import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:local_roots_2/models/farmer_model.dart';
import 'package:swipe_image_gallery/swipe_image_gallery.dart';

class CustomerFarmerTilePhotos extends StatelessWidget {
  final FarmerModel farmer;
  const CustomerFarmerTilePhotos({super.key, required this.farmer});

  @override
  Widget build(BuildContext context) {
    void showGallery(int photoIndex) {
      List<Image> images = [];
      for (String imageUrl in farmer.farmPhotos) {
        images.add(
          Image.network(
            imageUrl,
            fit: BoxFit.contain,
            loadingBuilder: (context, child, loadingProgress) {
              if (loadingProgress == null) {
                return child;
              } else {
                return const Center(
                  child: SizedBox(
                    width: 40,
                    height: 40,
                    child: CircularProgressIndicator(),
                  ),
                );
              }
            },
          ),
        );
      }

      StreamController<Widget> overlayController =
          StreamController<Widget>.broadcast();

      SwipeImageGallery(
        context: context,
        children: images,
        hideStatusBar: false,
        initialIndex: photoIndex,
        overlayController: overlayController,
        initialOverlay: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.close,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ).show();
    }

    return Column(
      children: [
        ListTile(
          title: Text(AppLocalizations.of(context)!.farmPhotos),
          subtitle: GridView.builder(
              itemCount: farmer.farmPhotos.length,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                crossAxisSpacing: 2.0,
                mainAxisSpacing: 2.0,
              ),
              itemBuilder: (BuildContext context, int index) {
                return InkWell(
                  onTap: () {
                    showGallery(index);
                  },
                  child: Image.network(
                    farmer.farmPhotos[index],
                  ),
                );
              }),
        )
      ],
    );
  }
}

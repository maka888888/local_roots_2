import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:local_roots_2/models/offer_model.dart';
import 'package:local_roots_2/ui/common/photos/photo_rect_large.dart';
import 'package:local_roots_2/ui/farmer/offers/offer/screens/edit_main_screen.dart';

class FarmerOfferTilePhoto extends StatelessWidget {
  final OfferModel offer;
  const FarmerOfferTilePhoto({super.key, required this.offer});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          PhotoRectLarge(imageUrl: offer.mainPhotoLarge, height: 300),
          const SizedBox(height: 20),
          OutlinedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => FarmerOfferEditMainPhoto(
                    offer: offer,
                  ),
                ),
              );
            },
            child: Text(AppLocalizations.of(context)!.edit),
          ),
        ],
      ),
    );
  }
}

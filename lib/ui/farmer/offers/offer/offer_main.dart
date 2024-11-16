import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:local_roots_2/models/offer_model.dart';
import 'package:local_roots_2/ui/farmer/offers/offer/tile_description.dart';
import 'package:local_roots_2/ui/farmer/offers/offer/tile_name.dart';
import 'package:local_roots_2/ui/farmer/offers/offer/tile_photo.dart';
import 'package:local_roots_2/ui/farmer/offers/offer/tile_price.dart';
import 'package:local_roots_2/ui/farmer/offers/offer/tile_status.dart';
import 'package:local_roots_2/ui/farmer/offers/offer/tile_unit.dart';

class FarmerOffer extends ConsumerWidget {
  final OfferModel offer;
  const FarmerOffer({super.key, required this.offer});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.offer),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(10),
          child: Container(
            color: Theme.of(context).colorScheme.errorContainer,
            width: double.infinity,
            height: 20,
            child: Align(
              alignment: Alignment.center,
              child: Text(
                AppLocalizations.of(context)!.offerIsNotApprovedByAdmin,
                style: TextStyle(color: Theme.of(context).colorScheme.error),
              ),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20),
            FarmerOfferTilePhoto(offer: offer),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: FarmerOfferTileStatus(offer: offer),
            ),
            const Divider(),
            FarmerOfferTileName(offer: offer),
            const Divider(),
            FarmerOfferTileDescription(offer: offer),
            const Divider(),
            FarmerOfferTileUnit(offer: offer),
            const Divider(),
            FarmerOfferTileCurrency(offer: offer),
            const Divider(),
          ],
        ),
      ),
    );
  }
}

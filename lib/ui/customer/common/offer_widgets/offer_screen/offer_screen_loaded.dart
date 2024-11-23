import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:local_roots_2/models/offer_model.dart';
import 'package:local_roots_2/ui/customer/common/offer_widgets/offer_screen/tile_description.dart';
import 'package:local_roots_2/ui/customer/common/offer_widgets/offer_screen/tile_farmer.dart';
import 'package:local_roots_2/ui/customer/common/offer_widgets/offer_screen/tile_name.dart';
import 'package:local_roots_2/ui/customer/common/offer_widgets/offer_screen/tile_photo.dart';
import 'package:local_roots_2/ui/customer/common/offer_widgets/offer_screen/tile_price.dart';

class CustomerOfferLoaded extends ConsumerWidget {
  final OfferModel offer;
  const CustomerOfferLoaded({super.key, required this.offer});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.offer),
      ),
      body: ListView(
        children: [
          Center(
            child: CustomerOfferTilePhoto(offer: offer),
          ),
          const SizedBox(height: 20),
          CustomerOfferTileFarmer(offer: offer),
          const Divider(),
          CustomerOfferTileName(offer: offer),
          const Divider(),
          CustomerOfferTileDescription(offer: offer),

          const Divider(),
          CustomerOfferTilePrice(offer: offer),
          const SizedBox(height: 20),
          // FarmerOfferTileName(offer: offer),
          // const Divider(),
          // FarmerOfferTileDescription(offer: offer),
          // const Divider(),
          // FarmerOfferTileUnit(offer: offer),
          // const Divider(),
          // FarmerOfferTileCurrency(offer: offer),
          // const Divider(),
        ],
      ),
    );
  }
}

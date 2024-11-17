import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:local_roots_2/models/offer_model.dart';
import 'package:local_roots_2/ui/admin/common/offer_widgets/offer_screen/tile_description.dart';
import 'package:local_roots_2/ui/admin/common/offer_widgets/offer_screen/tile_name.dart';
import 'package:local_roots_2/ui/admin/common/offer_widgets/offer_screen/tile_photo.dart';
import 'package:local_roots_2/ui/admin/common/offer_widgets/offer_screen/tile_price.dart';
import 'package:local_roots_2/ui/admin/common/offer_widgets/offer_screen/tile_status.dart';
import 'package:local_roots_2/ui/admin/common/offer_widgets/offer_screen/tile_unit.dart';

class AdminOffer extends ConsumerWidget {
  final OfferModel offer;
  const AdminOffer({super.key, required this.offer});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.offer),
        // bottom: PreferredSize(
        //   preferredSize: const Size.fromHeight(10),
        //   child: Container(
        //     color: Theme.of(context).colorScheme.errorContainer,
        //     width: double.infinity,
        //     height: 20,
        //     child: Align(
        //       alignment: Alignment.center,
        //       child: Text(
        //         AppLocalizations.of(context)!.offerIsNotApprovedByAdmin,
        //         style: TextStyle(color: Theme.of(context).colorScheme.error),
        //       ),
        //     ),
        //   ),
        // ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20),
            AdminOfferTilePhoto(offer: offer),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: AdminOfferTileStatus(offer: offer),
            ),
            const Divider(),
            AdminOfferTileName(offer: offer),
            const Divider(),
            AdminOfferTileDescription(offer: offer),
            const Divider(),
            AdminOfferTileUnit(offer: offer),
            const Divider(),
            AdminOfferTileCurrency(offer: offer),
            const Divider(),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:local_roots_2/models/offer_model.dart';
import 'package:local_roots_2/ui/farmer/offers/offer/screens/edit_description.dart';

class FarmerOfferTileDescription extends StatelessWidget {
  final OfferModel offer;
  const FarmerOfferTileDescription({super.key, required this.offer});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          title: Text(AppLocalizations.of(context)!.description),
          subtitle: Text(offer.description ?? ''),
          onTap: () async {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => FarmerOfferEditDescription(offer: offer),
              ),
            );
          },
          trailing: const Icon(Icons.edit_outlined),
        )
      ],
    );
  }
}

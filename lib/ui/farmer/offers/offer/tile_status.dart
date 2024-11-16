import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:local_roots_2/models/offer_model.dart';

import '../../../../providers/farmer/offer/offer_services.dart';

class FarmerOfferTileStatus extends StatelessWidget {
  final OfferModel offer;
  const FarmerOfferTileStatus({super.key, required this.offer});

  @override
  Widget build(BuildContext context) {
    return FormBuilderSwitch(
      name: 'offerIsActive',
      initialValue: offer.isActive,
      title: Text('${AppLocalizations.of(context)!.offerIsActive}?',
          style: Theme.of(context).textTheme.bodyLarge),
      decoration: const InputDecoration(
        border: InputBorder.none,
      ),
      onChanged: (value) async {
        offer.isActive = value!;
        await ServicesFarmerOffer().updateOffer(offer);
      },
    );
  }
}

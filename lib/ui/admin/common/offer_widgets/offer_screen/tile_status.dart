import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:local_roots_2/models/offer_model.dart';
import 'package:local_roots_2/providers/admin/offers/offer_services.dart';

class AdminOfferTileStatus extends StatelessWidget {
  final OfferModel offer;
  const AdminOfferTileStatus({super.key, required this.offer});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FormBuilderSwitch(
          name: 'offerIsActive',
          initialValue: offer.isActive,
          title: Text('${AppLocalizations.of(context)!.offerIsActive}?',
              style: Theme.of(context).textTheme.bodyLarge),
          decoration: const InputDecoration(
            border: InputBorder.none,
          ),
          onChanged: (value) async {
            offer.isActive = value!;
            await ServicesAdminOffer().updateOffer(offer);
          },
        ),
        FormBuilderSwitch(
          name: 'offerIsApproved',
          initialValue: offer.isApproved,
          title: Text('${AppLocalizations.of(context)!.offerIsApproved}?',
              style: Theme.of(context).textTheme.bodyLarge),
          decoration: const InputDecoration(
            border: InputBorder.none,
          ),
          onChanged: (value) async {
            offer.isApproved = value!;
            await ServicesAdminOffer().updateOffer(offer);
          },
        ),
      ],
    );
  }
}

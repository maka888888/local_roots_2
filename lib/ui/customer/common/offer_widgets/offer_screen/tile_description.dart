import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:local_roots_2/models/offer_model.dart';

class CustomerOfferTileDescription extends StatelessWidget {
  final OfferModel offer;
  const CustomerOfferTileDescription({super.key, required this.offer});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(AppLocalizations.of(context)!.description),
      subtitle: Text(offer.description ?? ''),
    );
  }
}

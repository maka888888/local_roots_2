import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:local_roots_2/models/offer_model.dart';
import 'package:local_roots_2/ui/farmer/offers/offer/screens/edit_unit.dart';

class AdminOfferTileUnit extends StatelessWidget {
  final OfferModel offer;
  const AdminOfferTileUnit({super.key, required this.offer});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          title: Text(AppLocalizations.of(context)!.unitSpecification),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Text(
                      AppLocalizations.of(context)!.unitHeight,
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Text(
                      '${offer.heightCm} cm',
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Text(
                      AppLocalizations.of(context)!.unitWidth,
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Text(
                      '${offer.widthCm} cm',
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Text(
                      AppLocalizations.of(context)!.unitDepth,
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Text(
                      '${offer.lengthCm} cm',
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Text(
                      AppLocalizations.of(context)!.unitWeight,
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Text(
                      '${offer.weightG} g',
                    ),
                  ),
                ],
              ),
            ],
          ),
          onTap: () async {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => FarmerOfferEditUnit(offer: offer),
              ),
            );
          },
          trailing: const Icon(Icons.edit_outlined),
        )
      ],
    );
  }
}

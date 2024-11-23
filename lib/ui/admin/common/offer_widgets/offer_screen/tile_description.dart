import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:local_roots_2/models/offer_model.dart';
import 'package:local_roots_2/ui/admin/common/offer_widgets/offer_screen/screens/edit_description.dart';

class AdminOfferTileDescription extends StatelessWidget {
  final OfferModel offer;
  const AdminOfferTileDescription({super.key, required this.offer});

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
                builder: (context) => AdminOfferEditDescription(offer: offer),
              ),
            );
          },
          trailing: const Icon(Icons.edit_outlined),
        )
      ],
    );
  }
}
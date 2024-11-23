import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:local_roots_2/models/currency_model.dart';
import 'package:local_roots_2/models/offer_model.dart';
import 'package:local_roots_2/ui/farmer/offers/offer/screens/edit_price.dart';

import '../../../../constants/lists/currencies.dart';

class FarmerOfferTileCurrency extends StatelessWidget {
  final OfferModel offer;
  const FarmerOfferTileCurrency({super.key, required this.offer});

  @override
  Widget build(BuildContext context) {
    List<CurrencyModel> currencies = generateCurrenciesList(context);

    String currencyName = currencies
        .firstWhere((element) => element.id == offer.currency)
        .nameTranslated;

    return Column(
      children: [
        ListTile(
          title: Text(AppLocalizations.of(context)!.price),
          subtitle: Text(
            '${offer.price} $currencyName',
          ),
          onTap: () async {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => FarmerOfferEditPrice(offer: offer),
              ),
            );
          },
          trailing: const Icon(Icons.edit_outlined),
        )
      ],
    );
  }
}
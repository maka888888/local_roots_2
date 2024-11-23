import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:local_roots_2/models/currency_model.dart';
import 'package:local_roots_2/models/offer_model.dart';
import 'package:local_roots_2/models/unit_model.dart';

import '../../../../../constants/lists/currencies.dart';
import '../../../../../constants/lists/units.dart';

class CustomerOfferTilePrice extends StatelessWidget {
  final OfferModel offer;
  const CustomerOfferTilePrice({super.key, required this.offer});

  @override
  Widget build(BuildContext context) {
    List<UnitModel> units = generateUnitsList(context);
    String unitName =
        units.firstWhere((element) => element.id == offer.unit).nameTranslated;

    List<CurrencyModel> currencies = generateCurrenciesList(context);
    String currencyName = currencies
        .firstWhere((element) => element.id == offer.currency)
        .nameTranslated;

    return ListTile(
      title: Text(AppLocalizations.of(context)!.price),
      subtitle: Text('${offer.price} $currencyName / $unitName'),
    );
  }
}

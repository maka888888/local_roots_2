import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:local_roots_2/models/currency_model.dart';

List<CurrencyModel> generateCurrenciesList(BuildContext context) {
  List<CurrencyModel> currenciesList = [];

  currenciesList.add(
    CurrencyModel(
      id: 'eur',
      nameTranslated: AppLocalizations.of(context)!.eur,
    ),
  );

  return currenciesList;
}

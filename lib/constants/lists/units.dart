import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../models/unit_model.dart';

List<UnitModel> generateUnitsList(BuildContext context) {
  List<UnitModel> offerUnitsList = [];

  offerUnitsList.add(
    UnitModel(
      id: 'kg',
      nameTranslated: AppLocalizations.of(context)!.kg,
    ),
  );

  offerUnitsList.add(
    UnitModel(
      id: 'ltr',
      nameTranslated: AppLocalizations.of(context)!.ltr,
    ),
  );

  offerUnitsList.add(
    UnitModel(
      id: 'pcs',
      nameTranslated: AppLocalizations.of(context)!.pcs,
    ),
  );

  offerUnitsList.add(
    UnitModel(
      id: 'pkg',
      nameTranslated: AppLocalizations.of(context)!.pkg,
    ),
  );

  return offerUnitsList;
}

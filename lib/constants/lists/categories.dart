import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../models/category_model.dart';

List<CategoryModel> generateCategoriesList(BuildContext context) {
  List<CategoryModel> offerCategoriesList = [];

  offerCategoriesList.add(
    CategoryModel(
      id: 'fruitsAndVegetables',
      index: 0,
      nameTranslated: AppLocalizations.of(context)!.fruitsAndVegetables,
      iconData: Icons.nature_outlined,
    ),
  );

  offerCategoriesList.add(
    CategoryModel(
      id: 'meatAndEggs',
      index: 1,
      nameTranslated: AppLocalizations.of(context)!.meatAndEggs,
      iconData: Icons.kebab_dining_outlined,
    ),
  );

  offerCategoriesList.add(
    CategoryModel(
      id: 'fishAndSeaProducts',
      index: 2,
      nameTranslated: AppLocalizations.of(context)!.fishAndSeaProducts,
      iconData: Icons.sailing_outlined,
    ),
  );

  offerCategoriesList.add(
    CategoryModel(
      id: 'mushrooms',
      index: 3,
      nameTranslated: AppLocalizations.of(context)!.mushrooms,
      iconData: Icons.forest_outlined,
    ),
  );

  offerCategoriesList.add(
    CategoryModel(
      id: 'dairy',
      index: 4,
      nameTranslated: AppLocalizations.of(context)!.dairy,
      iconData: Icons.local_cafe_outlined,
    ),
  );

  offerCategoriesList.add(
    CategoryModel(
      id: 'bakery',
      index: 5,
      nameTranslated: AppLocalizations.of(context)!.bakery,
      iconData: Icons.bakery_dining_outlined,
    ),
  );

  offerCategoriesList.add(
    CategoryModel(
      id: 'jamsAndHoney',
      index: 6,
      nameTranslated: AppLocalizations.of(context)!.honey,
      iconData: Icons.hive_outlined,
    ),
  );

  offerCategoriesList.add(
    CategoryModel(
      id: 'jams',
      index: 7,
      nameTranslated: AppLocalizations.of(context)!.jams,
      iconData: Icons.yard_outlined,
    ),
  );

  offerCategoriesList.add(
    CategoryModel(
      id: 'beverages',
      index: 8,
      nameTranslated: AppLocalizations.of(context)!.beverages,
      iconData: Icons.local_drink_outlined,
    ),
  );

  offerCategoriesList.add(
    CategoryModel(
      id: 'teas',
      index: 7,
      nameTranslated: AppLocalizations.of(context)!.teas,
      iconData: Icons.local_cafe_outlined,
    ),
  );

  offerCategoriesList.add(
    CategoryModel(
      id: 'nuts',
      index: 10,
      nameTranslated: AppLocalizations.of(context)!.nuts,
      iconData: Icons.spa,
    ),
  );

  offerCategoriesList.add(
    CategoryModel(
      id: 'seeds',
      index: 11,
      nameTranslated: AppLocalizations.of(context)!.seedsAndPlants,
      iconData: Icons.spa_outlined,
    ),
  );

  offerCategoriesList.add(
    CategoryModel(
      id: 'spices',
      index: 12,
      nameTranslated: AppLocalizations.of(context)!.spices,
      iconData: Icons.local_dining_outlined,
    ),
  );

  offerCategoriesList.add(
    CategoryModel(
      id: 'special',
      index: 13,
      nameTranslated: AppLocalizations.of(context)!.special,
      iconData: Icons.verified_outlined,
    ),
  );

  return offerCategoriesList;
}

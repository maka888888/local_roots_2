import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:local_roots_2/constants/lists/categories.dart';
import 'package:local_roots_2/models/category_model.dart';
import 'package:local_roots_2/models/farmer_model.dart';

class CustomerFarmerTileCategories extends StatelessWidget {
  final FarmerModel farmer;
  const CustomerFarmerTileCategories({super.key, required this.farmer});

  @override
  Widget build(BuildContext context) {
    List<CategoryModel> categories = generateCategoriesList(context);
    List<CategoryModel> selectedCategories = categories
        .where((element) => farmer.categories.contains(element.id))
        .toList();

    return Column(
      children: [
        ListTile(
          title: Text(AppLocalizations.of(context)!.categories),
          subtitle: ListView.builder(
              itemCount: selectedCategories.length,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (BuildContext context, int index) {
                return Row(
                  children: [
                    Icon(selectedCategories[index].iconData, size: 14),
                    const SizedBox(width: 10),
                    Text(selectedCategories[index].nameTranslated),
                  ],
                );
              }),
        )
      ],
    );
  }
}

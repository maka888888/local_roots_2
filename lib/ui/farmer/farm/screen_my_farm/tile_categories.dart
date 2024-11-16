import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:local_roots_2/constants/lists/categories.dart';
import 'package:local_roots_2/models/app_user_model.dart';
import 'package:local_roots_2/models/category_model.dart';
import 'package:local_roots_2/models/farmer_model.dart';
import 'package:local_roots_2/ui/farmer/farm/screen_my_farm/screens/edit_categories.dart';

class FarmerFarmMyFarmTileCategories extends StatelessWidget {
  final AppUserModel appUser;
  const FarmerFarmMyFarmTileCategories({super.key, required this.appUser});

  @override
  Widget build(BuildContext context) {
    FarmerModel farmer = appUser.farmer!;

    List<CategoryModel> categories = generateCategoriesList(context);
    List<CategoryModel> selectedCategories = categories
        .where((element) => farmer.categories.contains(element.id))
        .toList();

    return Column(
      children: [
        ListTile(
          leading: const Icon(Icons.category_outlined),
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
          onTap: () async {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    FarmerFarmMyFarmEditCategories(appUser: appUser),
              ),
            );
          },
          trailing: const Icon(Icons.edit_outlined),
        )
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:local_roots_2/constants/lists/categories.dart';
import 'package:local_roots_2/models/category_model.dart';
import 'package:local_roots_2/models/offer_model.dart';
import 'package:local_roots_2/ui/farmer/offers/offer/screens/edit_name.dart';

class FarmerOfferTileName extends StatelessWidget {
  final OfferModel offer;
  const FarmerOfferTileName({super.key, required this.offer});

  @override
  Widget build(BuildContext context) {
    List<CategoryModel> categories = generateCategoriesList(context);

    String categoryName = categories
        .firstWhere((element) => element.id == offer.category)
        .nameTranslated;

    return Column(
      children: [
        ListTile(
          title: Text(offer.name),
          subtitle: Text(categoryName),
          onTap: () async {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => FarmerOfferEditName(offer: offer),
              ),
            );
          },
          trailing: const Icon(Icons.edit_outlined),
        )
      ],
    );
  }
}

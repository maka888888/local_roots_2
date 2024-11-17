import 'package:flutter/material.dart';
import 'package:local_roots_2/constants/lists/categories.dart';
import 'package:local_roots_2/models/category_model.dart';
import 'package:local_roots_2/models/offer_model.dart';
import 'package:local_roots_2/ui/admin/common/offer_widgets/offer_screen/screens/edit_name.dart';

class AdminOfferTileName extends StatelessWidget {
  final OfferModel offer;
  const AdminOfferTileName({super.key, required this.offer});

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
                builder: (context) => AdminOfferEditName(offer: offer),
              ),
            );
          },
          trailing: const Icon(Icons.edit_outlined),
        )
      ],
    );
  }
}

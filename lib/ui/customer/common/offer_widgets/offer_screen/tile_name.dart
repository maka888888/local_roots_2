import 'package:flutter/material.dart';
import 'package:local_roots_2/constants/lists/categories.dart';
import 'package:local_roots_2/models/category_model.dart';
import 'package:local_roots_2/models/offer_model.dart';

class CustomerOfferTileName extends StatelessWidget {
  final OfferModel offer;
  const CustomerOfferTileName({super.key, required this.offer});

  @override
  Widget build(BuildContext context) {
    List<CategoryModel> categories = generateCategoriesList(context);
    String categoryName = categories
        .firstWhere((element) => element.id == offer.category)
        .nameTranslated;

    return ListTile(
      title: Text(offer.name),
      subtitle: Text(categoryName),
    );
  }
}

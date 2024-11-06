import 'package:flutter/material.dart';
import 'package:local_roots_2/models/category_model.dart';

import '../../../../constants/lists/categories.dart';
import 'categories_card.dart';

class CustomerOffersCategoriesMain extends StatelessWidget {
  const CustomerOffersCategoriesMain({super.key});

  @override
  Widget build(BuildContext context) {
    List<CategoryModel> categories = generateCategoriesList(context);

    return SizedBox(
      height: 100,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          itemCount: categories.length,
          itemBuilder: (context, index) {
            return CustomerOffersCategoriesCard(category: categories[index]);
          }),
    );
  }
}

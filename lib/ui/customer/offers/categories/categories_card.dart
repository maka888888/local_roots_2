import 'package:flutter/material.dart';
import 'package:local_roots_2/models/category_model.dart';

import 'category_screen/category_screen_main.dart';

class CustomerOffersCategoriesCard extends StatelessWidget {
  final CategoryModel category;
  const CustomerOffersCategoriesCard({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  CustomerCategoryScreen(category: category.id),
            ),
          );
        },
        child: SizedBox(
          width: 100,
          height: 100,
          child: GridTile(
            header: SizedBox(
              height: 50,
              child: Center(
                child: Icon(category.iconData, size: 30),
              ),
            ),
            footer: SizedBox(
              height: 50,
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: Center(
                  child: Text(
                    category.nameTranslated,
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
            child: const SizedBox.shrink(),
          ),
        ),
      ),
    );
  }
}

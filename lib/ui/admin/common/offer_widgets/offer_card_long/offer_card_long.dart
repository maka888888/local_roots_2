import 'package:flutter/material.dart';
import 'package:local_roots_2/constants/lists/categories.dart';
import 'package:local_roots_2/models/category_model.dart';
import 'package:local_roots_2/models/offer_model.dart';
import 'package:local_roots_2/ui/common/photos/photo_rect_small.dart';

class AdminOfferCardLong extends StatelessWidget {
  final OfferModel offer;
  const AdminOfferCardLong({super.key, required this.offer});

  @override
  Widget build(BuildContext context) {
    Color? listTileColor;

    List<CategoryModel> categories = generateCategoriesList(context);

    String categoryName = categories
        .firstWhere((element) => element.id == offer.category)
        .nameTranslated;

    if (!offer.isActive) {
      listTileColor = Theme.of(context).colorScheme.surfaceDim;
    }

    if (!offer.isApproved) {
      listTileColor = Theme.of(context).colorScheme.errorContainer;
    }

    return ListTile(
      tileColor: listTileColor,
      leading: SizedBox(
        height: 50,
        width: 50,
        child: PhotoRectSmall(imageUrl: offer.mainPhotoSmall),
      ),
      title: Text(offer.name),
      subtitle: Text(categoryName),
      trailing: const Icon(Icons.arrow_forward_ios),
      onTap: () {
        // Navigator.push(
        //   context,
        //   MaterialPageRoute(
        //     builder: (context) => FarmerOffer(offer: offer),
        //   ),
        // );
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:local_roots_2/constants/lists/categories.dart';
import 'package:local_roots_2/models/category_model.dart';
import 'package:local_roots_2/models/offer_model.dart';
import 'package:local_roots_2/ui/common/photos/photo_rect_small.dart';

import '../offer_screen/offer_screen_main.dart';

class CustomerOfferFarmerCardLong extends StatelessWidget {
  final OfferModel offer;
  const CustomerOfferFarmerCardLong({super.key, required this.offer});

  @override
  Widget build(BuildContext context) {
    List<CategoryModel> categories = generateCategoriesList(context);

    return ListTile(
      leading: SizedBox(
        height: 50,
        width: 50,
        child: PhotoRectSmall(imageUrl: offer.mainPhotoSmall),
      ),
      title: Text(offer.name),
      subtitle: Text(offer.farmerShort.name),
      trailing: const Icon(Icons.arrow_forward_ios),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CustomerOffer(offerId: offer.id),
          ),
        );
      },
    );
  }
}

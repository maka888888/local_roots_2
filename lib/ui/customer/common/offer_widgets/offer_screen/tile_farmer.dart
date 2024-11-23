import 'package:flutter/material.dart';
import 'package:local_roots_2/models/offer_model.dart';
import 'package:local_roots_2/ui/common/photos/photo_oval_small.dart';

class CustomerOfferTileFarmer extends StatelessWidget {
  final OfferModel offer;
  const CustomerOfferTileFarmer({super.key, required this.offer});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: PhotoOvalSmall(photoUrl: offer.farmerShort.smallPhoto),
      title: Text(offer.farmerShort.name),
      subtitle: Text(offer.farmerShort.city),
    );
  }
}

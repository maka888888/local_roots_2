import 'package:flutter/material.dart';
import 'package:local_roots_2/models/offer_model.dart';
import 'package:local_roots_2/ui/common/photos/photo_rect_large.dart';

class CustomerOfferTilePhoto extends StatelessWidget {
  final OfferModel offer;
  const CustomerOfferTilePhoto({super.key, required this.offer});

  @override
  Widget build(BuildContext context) {
    return PhotoRectLarge(imageUrl: offer.mainPhotoLarge, height: 300);
  }
}

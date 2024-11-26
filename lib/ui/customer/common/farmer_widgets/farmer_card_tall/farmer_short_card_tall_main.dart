import 'package:flutter/material.dart';
import 'package:local_roots_2/models/farmer_short_model.dart';
import 'package:local_roots_2/ui/common/photos/photo_oval_large.dart';

import '../farmer_screen/farmer_screen_main.dart';
import 'farmer_like_icon.dart';

class CustomerFarmerShortCardTall extends StatelessWidget {
  final FarmerShortModel farmerShort;
  const CustomerFarmerShortCardTall({super.key, required this.farmerShort});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Card.outlined(
          child: InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CustomerFarmer(
                    farmerId: farmerShort.appUserId,
                  ),
                ),
              );
            },
            child: SizedBox(
              width: 120,
              //height: 210,
              child: Column(
                children: [
                  const SizedBox(height: 10),
                  SizedBox(
                    width: 100,
                    height: 100,
                    child: PhotoOvalLarge(photoUrl: farmerShort.smallPhoto),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    farmerShort.name,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.labelLarge,
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    farmerShort.city,
                    style: Theme.of(context).textTheme.bodyMedium,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ),
        ),
        Positioned(
          top: 8,
          right: 8,
          child: CustomerFarmerCardLikeButton(
              farmerAppUserId: farmerShort.appUserId),
        ),
      ],
    );
  }
}

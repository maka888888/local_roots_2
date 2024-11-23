import 'package:flutter/material.dart';
import 'package:local_roots_2/models/farmer_model.dart';
import 'package:local_roots_2/ui/common/photos/photo_oval_large.dart';

import '../farmer_screen/farmer_screen_main.dart';

class CustomerFarmerCardTall extends StatelessWidget {
  final FarmerModel farmer;
  const CustomerFarmerCardTall({super.key, required this.farmer});

  @override
  Widget build(BuildContext context) {
    return Card.outlined(
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CustomerFarmer(
                farmerId: farmer.appUserId,
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
                child: PhotoOvalLarge(photoUrl: farmer.largePhoto),
              ),
              const SizedBox(height: 10),
              Text(
                farmer.name,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.labelLarge,
                textAlign: TextAlign.center,
              ),
              Text(
                farmer.city,
                style: Theme.of(context).textTheme.bodyMedium,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

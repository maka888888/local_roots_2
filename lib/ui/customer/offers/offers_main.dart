import 'package:flutter/material.dart';
import 'package:local_roots_2/ui/customer/offers/tile_become_customer/tile_become_customer_main.dart';
import 'package:local_roots_2/ui/customer/offers/tile_become_farmer/tile_become_farmer_main.dart';

class CustomerOffers extends StatelessWidget {
  const CustomerOffers({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        CustomerTileBecomeCustomer(),
        CustomerTileBecomeFarmer(),
      ],
    );
  }
}

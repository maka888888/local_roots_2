import 'package:flutter/material.dart';
import 'package:local_roots_2/models/sales_location_model.dart';

import '../sales_location_screen/sales_location_main.dart';

class FarmerSalesLocationCardLong extends StatelessWidget {
  final SalesLocationModel salesLocation;
  const FarmerSalesLocationCardLong({super.key, required this.salesLocation});

  @override
  Widget build(BuildContext context) {
    Color? listTileColor;

    if (!salesLocation.isActive) {
      listTileColor = Theme.of(context).colorScheme.surfaceDim;
    }

    return ListTile(
      tileColor: listTileColor,
      leading: const Icon(Icons.storefront_outlined),
      title: Text(salesLocation.name),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>
                FarmerSalesLocation(salesLocationId: salesLocation.id),
          ),
        );
      },
      trailing: const Icon(Icons.arrow_forward_ios),
    );
  }
}

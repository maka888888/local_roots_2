import 'package:flutter/material.dart';
import 'package:local_roots_2/models/sales_location_model.dart';

import 'edit_screen/edit_hours.dart';

class FarmerSalesLocationTileName extends StatelessWidget {
  final SalesLocationModel salesLocation;
  const FarmerSalesLocationTileName({super.key, required this.salesLocation});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(salesLocation.name),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(salesLocation.street),
          Text(salesLocation.city),
        ],
      ),
      trailing: const Icon(Icons.edit_outlined),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>
                FarmerSalesLocationEditName(salesLocation: salesLocation),
          ),
        );
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:local_roots_2/models/sales_location_model.dart';

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
    );
  }
}

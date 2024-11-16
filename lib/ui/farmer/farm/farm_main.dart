import 'package:flutter/material.dart';
import 'package:local_roots_2/ui/farmer/farm/tile_delivery_methods.dart';
import 'package:local_roots_2/ui/farmer/farm/tile_farm.dart';
import 'package:local_roots_2/ui/farmer/farm/tile_sales_locations.dart';

class FarmerFarmMain extends StatelessWidget {
  const FarmerFarmMain({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        FarmerFarmTileMyFarm(),
        FarmerFarmTileDeliveryMethods(),
        FarmerFarmTileSalesLocations(),
      ],
    );
  }
}

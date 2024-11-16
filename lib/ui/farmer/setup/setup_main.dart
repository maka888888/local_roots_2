import 'package:flutter/material.dart';
import 'package:local_roots_2/ui/farmer/setup/tile_admin.dart';
import 'package:local_roots_2/ui/farmer/setup/tile_customer.dart';
import 'package:local_roots_2/ui/farmer/setup/tile_logout.dart';

class FarmerSetupMain extends StatelessWidget {
  const FarmerSetupMain({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        FarmerSetupTileLogout(),
        FarmerSetupTileAdmin(),
        FarmerSetupTileCustomer(),
      ],
    );
  }
}

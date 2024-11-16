import 'package:flutter/material.dart';
import 'package:local_roots_2/ui/customer/setup/tile_customer_profile.dart';
import 'package:local_roots_2/ui/customer/setup/tile_delete_customer.dart';
import 'package:local_roots_2/ui/customer/setup/tile_logout.dart';
import 'package:local_roots_2/ui/customer/setup/tile_profile_admin.dart';
import 'package:local_roots_2/ui/customer/setup/tile_profile_farmer.dart';

class CustomerSetupMain extends StatelessWidget {
  const CustomerSetupMain({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        CustomerSetupTileLogout(),
        CustomerSetupTileDeleteCustomer(),
        CustomerSetupTileCustomerProfile(),
        CustomerSetupTileAdmin(),
        CustomerSetupTileFarmer(),
      ],
    );
  }
}

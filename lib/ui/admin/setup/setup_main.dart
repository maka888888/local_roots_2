import 'package:flutter/material.dart';
import 'package:local_roots_2/ui/admin/setup/tile_logout.dart';
import 'package:local_roots_2/ui/admin/setup/tile_profile_customer.dart';

class AdminSetupMain extends StatelessWidget {
  const AdminSetupMain({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        AdminSetupTileLogout(),
        AdminSetupTileCustomer(),
      ],
    );
  }
}

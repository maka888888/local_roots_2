import 'package:flutter/material.dart';
import 'package:local_roots_2/ui/admin/setup/tile_farmer.dart';
import 'package:local_roots_2/ui/admin/setup/tile_logout.dart';
import 'package:local_roots_2/ui/admin/setup/tile_profile_customer.dart';

import '../../common/app_name/app_name_main.dart';

class AdminSetupMain extends StatelessWidget {
  const AdminSetupMain({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const AppNameMain(),
      ),
      body: ListView(
        children: const [
          AdminSetupTileLogout(),
          Divider(),
          AdminSetupTileCustomer(),
          Divider(),
          AdminSetupTileFarmer(),
        ],
      ),
    );
  }
}

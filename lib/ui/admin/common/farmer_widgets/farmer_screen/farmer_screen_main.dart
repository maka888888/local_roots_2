import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:local_roots_2/models/app_user_model.dart';
import 'package:local_roots_2/models/farmer_model.dart';
import 'package:local_roots_2/ui/admin/common/farmer_widgets/farmer_screen/tab_about/my_farm_main.dart';
import 'package:local_roots_2/ui/admin/common/farmer_widgets/farmer_screen/tab_offers/offers_main.dart';

class AdminFarmer extends StatelessWidget {
  final AppUserModel appUser;

  const AdminFarmer({super.key, required this.appUser});

  @override
  Widget build(BuildContext context) {
    FarmerModel farmer = appUser.farmer!;

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text(farmer.name),
          bottom: TabBar(
            tabs: [
              Tab(text: AppLocalizations.of(context)!.offers),
              Tab(text: AppLocalizations.of(context)!.about),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            AdminFarmerTabOffers(farmer: farmer),
            AdminFarmMyFarm(appUser: appUser),
          ],
        ),
      ),
    );
  }
}

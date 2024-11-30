import 'package:flutter/material.dart';
import 'package:local_roots_2/models/app_user_model.dart';

import '../../common/farmer_widgets/farmer_card_long/farmer_card_long_main.dart';

class AdminUsersTabFarmers extends StatelessWidget {
  final List<AppUserModel> appUsers;
  const AdminUsersTabFarmers({super.key, required this.appUsers});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (BuildContext context, int index) {
        return AdminFarmerCardLong(appUser: appUsers[index]);
      },
      separatorBuilder: (BuildContext context, int index) {
        return const Divider();
      },
      itemCount: appUsers.length,
    );
  }
}

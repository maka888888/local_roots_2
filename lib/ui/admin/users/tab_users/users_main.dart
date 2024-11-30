import 'package:flutter/material.dart';
import 'package:local_roots_2/models/app_user_model.dart';

import '../../common/app_user_widgets/app_user_tile/app_user_tile.dart';

class AdminUsersTabUsers extends StatelessWidget {
  final List<AppUserModel> appUsers;
  const AdminUsersTabUsers({super.key, required this.appUsers});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (BuildContext context, int index) {
        return AdminAppUserTile(appUser: appUsers[index]);
      },
      separatorBuilder: (BuildContext context, int index) {
        return const Divider();
      },
      itemCount: appUsers.length,
    );
  }
}

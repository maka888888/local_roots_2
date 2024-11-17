import 'package:flutter/material.dart';
import 'package:local_roots_2/models/app_user_model.dart';
import 'package:local_roots_2/models/farmer_model.dart';
import 'package:local_roots_2/ui/common/photos/photo_oval_small.dart';

import '../farmer_screen/farmer_screen_main.dart';

class AdminFarmerCardLong extends StatelessWidget {
  final AppUserModel appUser;
  const AdminFarmerCardLong({super.key, required this.appUser});

  @override
  Widget build(BuildContext context) {
    FarmerModel farmer = appUser.farmer!;
    return ListTile(
      leading: PhotoOvalSmall(photoUrl: farmer.smallPhoto),
      title: Text(farmer.name),
      subtitle: Text(farmer.city),
      trailing: const Icon(Icons.arrow_forward_ios),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return AdminFarmer(appUser: appUser);
            },
          ),
        );
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:local_roots_2/models/app_user_model.dart';
import 'package:local_roots_2/models/farmer_model.dart';
import 'package:local_roots_2/ui/admin/common/farmer_widgets/farmer_screen/tab_about/screens/edit_name.dart';

class AdminFarmMyFarmTileName extends StatelessWidget {
  final AppUserModel appUser;
  const AdminFarmMyFarmTileName({super.key, required this.appUser});

  @override
  Widget build(BuildContext context) {
    FarmerModel farmer = appUser.farmer!;

    return Column(
      children: [
        ListTile(
          leading: const Icon(Icons.nature_people_outlined),
          title: Text(farmer.name),
          subtitle: Text(farmer.description),
          onTap: () async {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => AdminFarmMyFarmEditName(appUser: appUser),
              ),
            );
          },
          trailing: const Icon(Icons.edit_outlined),
        )
      ],
    );
  }
}

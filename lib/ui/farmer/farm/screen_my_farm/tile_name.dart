import 'package:flutter/material.dart';
import 'package:local_roots_2/models/app_user_model.dart';
import 'package:local_roots_2/models/farmer_model.dart';
import 'package:local_roots_2/ui/farmer/farm/screen_my_farm/screens/edit_name.dart';

class FarmerFarmMyFarmTileName extends StatelessWidget {
  final AppUserModel appUser;
  const FarmerFarmMyFarmTileName({super.key, required this.appUser});

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
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    FarmerFarmMyFarmEditName(appUser: appUser),
              ),
            );
          },
          trailing: const Icon(Icons.edit_outlined),
        )
      ],
    );
  }
}

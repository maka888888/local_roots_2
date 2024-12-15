import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:jiffy/jiffy.dart';
import 'package:local_roots_2/models/app_user_model.dart';
import 'package:local_roots_2/models/farmer_model.dart';
import 'package:local_roots_2/ui/farmer/farm/screen_my_farm/screens/edit_experience.dart';

class FarmerFarmMyFarmTileExperience extends StatelessWidget {
  final AppUserModel appUser;
  const FarmerFarmMyFarmTileExperience({super.key, required this.appUser});

  @override
  Widget build(BuildContext context) {
    FarmerModel farmer = appUser.farmer!;

    return Column(
      children: [
        ListTile(
          leading: const Icon(Icons.calendar_month_outlined),
          title: Text(AppLocalizations.of(context)!.experience),
          subtitle: Text(Jiffy.parseFromDateTime(farmer.inBusinessSince).yM),
          onTap: () async {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    FarmerFarmMyFarmEditExperience(appUser: appUser),
              ),
            );
          },
          trailing: const Icon(Icons.edit_outlined),
        )
      ],
    );
  }
}

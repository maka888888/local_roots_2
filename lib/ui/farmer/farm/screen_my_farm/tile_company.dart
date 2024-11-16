import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:local_roots_2/models/app_user_model.dart';
import 'package:local_roots_2/ui/farmer/farm/screen_my_farm/screens/edit_company.dart';

class FarmerFarmMyFarmTileCompany extends StatelessWidget {
  final AppUserModel appUser;
  const FarmerFarmMyFarmTileCompany({super.key, required this.appUser});

  @override
  Widget build(BuildContext context) {
    String? vatId;

    if (appUser.farmer!.vatId.isNotEmpty) {
      vatId = appUser.farmer!.vatId;
    }

    return Column(
      children: [
        ListTile(
          leading: const Icon(Icons.business_center_outlined),
          title: Text(AppLocalizations.of(context)!.companyID),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(appUser.farmer!.companyId),
              vatId == null ? const SizedBox.shrink() : Text(vatId),
            ],
          ),
          onTap: () async {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    FarmerFarmMyFarmEditCompany(appUser: appUser),
              ),
            );
          },
          trailing: const Icon(Icons.edit_outlined),
        )
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:local_roots_2/models/app_user_model.dart';
import 'package:local_roots_2/ui/admin/common/farmer_widgets/farmer_screen/tab_about/screens/edit_address.dart';

class AdminFarmMyFarmTileAddress extends StatelessWidget {
  final AppUserModel appUser;
  const AdminFarmMyFarmTileAddress({super.key, required this.appUser});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: const Icon(Icons.location_on_outlined),
          title: Text(AppLocalizations.of(context)!.address),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(appUser.farmer!.street),
              Text(appUser.farmer!.city),
              Text(appUser.farmer!.country),
            ],
          ),
          onTap: () async {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => AdminFarmMyFarmEditAddress(
                  appUser: appUser,
                ),
              ),
            );
          },
          trailing: const Icon(Icons.edit_outlined),
        )
      ],
    );
  }
}

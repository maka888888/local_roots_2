import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:local_roots_2/models/farmer_model.dart';
import 'package:local_roots_2/ui/admin/common/farmer_widgets/farmer_screen/tab_about/screens/edit_main_photo.dart';
import 'package:local_roots_2/ui/common/photos/photo_oval_large.dart';

import '../../../../../../models/app_user_model.dart';

class AdminFarmMyFarmTilePhoto extends StatelessWidget {
  final AppUserModel appUser;
  const AdminFarmMyFarmTilePhoto({super.key, required this.appUser});

  @override
  Widget build(BuildContext context) {
    FarmerModel farmer = appUser.farmer!;

    return Center(
      child: Column(
        children: [
          PhotoOvalLarge(photoUrl: farmer.largePhoto),
          const SizedBox(height: 20),
          OutlinedButton(
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => AdminFarmMyFarmEditMainPhoto(
                    appUser: appUser,
                  ),
                ),
              );
            },
            child: Text(AppLocalizations.of(context)!.edit),
          ),
        ],
      ),
    );
  }
}

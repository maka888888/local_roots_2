import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:local_roots_2/models/app_user_model.dart';
import 'package:local_roots_2/models/farmer_model.dart';
import 'package:local_roots_2/ui/admin/common/farmer_widgets/farmer_screen/tab_about/screens/edit_photos.dart';

class AdminFarmMyFarmTilePhotos extends StatelessWidget {
  final AppUserModel appUser;
  const AdminFarmMyFarmTilePhotos({super.key, required this.appUser});

  @override
  Widget build(BuildContext context) {
    FarmerModel farmer = appUser.farmer!;

    return Column(
      children: [
        ListTile(
          leading: const Icon(Icons.photo_album_outlined),
          title: Text(AppLocalizations.of(context)!.farmPhotos),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GridView.builder(
                  itemCount: farmer.farmPhotos.length,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                    crossAxisSpacing: 2.0,
                    mainAxisSpacing: 2.0,
                  ),
                  itemBuilder: (BuildContext context, int index) {
                    return Image.network(farmer.farmPhotos[index]);
                  }),
            ],
          ),
          onTap: () async {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    AdminFarmMyFarmEditPhotos(appUser: appUser),
              ),
            );
          },
          trailing: const Icon(Icons.edit_outlined),
        )
      ],
    );
  }
}

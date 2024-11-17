import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:local_roots_2/models/app_user_model.dart';
import 'package:local_roots_2/models/farmer_model.dart';
import 'package:local_roots_2/ui/admin/common/farmer_widgets/farmer_screen/tab_about/screens/edit_certificates.dart';

class AdminFarmMyFarmTileCertificates extends StatelessWidget {
  final AppUserModel appUser;
  const AdminFarmMyFarmTileCertificates({super.key, required this.appUser});

  @override
  Widget build(BuildContext context) {
    FarmerModel farmer = appUser.farmer!;

    return Column(
      children: [
        ListTile(
          leading: const Icon(Icons.workspace_premium_outlined),
          title: Text(AppLocalizations.of(context)!.farmCertificates),
          subtitle: GridView.builder(
              itemCount: farmer.certificatesPhotos.length,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                crossAxisSpacing: 1.0,
                mainAxisSpacing: 1.0,
              ),
              itemBuilder: (BuildContext context, int index) {
                return Image.network(farmer.certificatesPhotos[index]);
              }),
          onTap: () async {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    AdminFarmMyFarmEditCertificates(appUser: appUser),
              ),
            );
          },
          trailing: const Icon(Icons.edit_outlined),
        )
      ],
    );
  }
}

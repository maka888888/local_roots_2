import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:local_roots_2/models/app_user_model.dart';
import 'package:local_roots_2/providers/common/app_user/app_user.dart';
import 'package:local_roots_2/ui/farmer/farm/screen_my_farm/tile_address.dart';
import 'package:local_roots_2/ui/farmer/farm/screen_my_farm/tile_categories.dart';
import 'package:local_roots_2/ui/farmer/farm/screen_my_farm/tile_certificates.dart';
import 'package:local_roots_2/ui/farmer/farm/screen_my_farm/tile_company.dart';
import 'package:local_roots_2/ui/farmer/farm/screen_my_farm/tile_contacts.dart';
import 'package:local_roots_2/ui/farmer/farm/screen_my_farm/tile_experience.dart';
import 'package:local_roots_2/ui/farmer/farm/screen_my_farm/tile_main_photo.dart';
import 'package:local_roots_2/ui/farmer/farm/screen_my_farm/tile_name.dart';
import 'package:local_roots_2/ui/farmer/farm/screen_my_farm/tile_photos.dart';
import 'package:local_roots_2/ui/farmer/farm/screen_my_farm/tile_status.dart';

class FarmerFarmMyFarm extends ConsumerWidget {
  const FarmerFarmMyFarm({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    AppUserModel appUser = ref.watch(refAppUserProvider).value!;

    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.myFarm),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20),
            FarmerFarmMyFarmTilePhoto(appUser: appUser),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: FarmerFarmMyFarmTileStatus(appUser: appUser),
            ),
            const Divider(),
            FarmerFarmMyFarmTileName(appUser: appUser),
            const Divider(),
            FarmerFarmMyFarmTileCompany(appUser: appUser),
            const Divider(),
            FarmerFarmMyFarmTileContacts(appUser: appUser),
            const Divider(),
            FarmerFarmMyFarmTileAddress(appUser: appUser),
            const Divider(),
            FarmerFarmMyFarmTilePhotos(appUser: appUser),
            const Divider(),
            FarmerFarmMyFarmTileCategories(appUser: appUser),
            const Divider(),
            FarmerFarmMyFarmTileCertificates(appUser: appUser),
            const Divider(),
            FarmerFarmMyFarmTileExperience(appUser: appUser),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}

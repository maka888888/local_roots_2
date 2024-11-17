import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:local_roots_2/models/app_user_model.dart';
import 'package:local_roots_2/ui/admin/common/farmer_widgets/farmer_screen/tab_about/tile_address.dart';
import 'package:local_roots_2/ui/admin/common/farmer_widgets/farmer_screen/tab_about/tile_categories.dart';
import 'package:local_roots_2/ui/admin/common/farmer_widgets/farmer_screen/tab_about/tile_certificates.dart';
import 'package:local_roots_2/ui/admin/common/farmer_widgets/farmer_screen/tab_about/tile_company.dart';
import 'package:local_roots_2/ui/admin/common/farmer_widgets/farmer_screen/tab_about/tile_contacts.dart';
import 'package:local_roots_2/ui/admin/common/farmer_widgets/farmer_screen/tab_about/tile_experience.dart';
import 'package:local_roots_2/ui/admin/common/farmer_widgets/farmer_screen/tab_about/tile_main_photo.dart';
import 'package:local_roots_2/ui/admin/common/farmer_widgets/farmer_screen/tab_about/tile_name.dart';
import 'package:local_roots_2/ui/admin/common/farmer_widgets/farmer_screen/tab_about/tile_photos.dart';
import 'package:local_roots_2/ui/admin/common/farmer_widgets/farmer_screen/tab_about/tile_status.dart';

class AdminFarmMyFarm extends ConsumerWidget {
  final AppUserModel appUser;
  const AdminFarmMyFarm({super.key, required this.appUser});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(height: 20),
          AdminFarmMyFarmTilePhoto(appUser: appUser),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: AdminFarmMyFarmTileStatus(appUser: appUser),
          ),
          const Divider(),
          AdminFarmMyFarmTileName(appUser: appUser),
          const Divider(),
          AdminFarmMyFarmTileCompany(appUser: appUser),
          const Divider(),
          AdminFarmMyFarmTileContacts(appUser: appUser),
          const Divider(),
          AdminFarmMyFarmTileAddress(appUser: appUser),
          const Divider(),
          AdminFarmMyFarmTilePhotos(appUser: appUser),
          const Divider(),
          AdminFarmMyFarmTileCategories(appUser: appUser),
          const Divider(),
          AdminFarmMyFarmTileCertificates(appUser: appUser),
          const Divider(),
          AdminFarmMyFarmTileExperience(appUser: appUser),
          const SizedBox(height: 40),
        ],
      ),
    );
  }
}

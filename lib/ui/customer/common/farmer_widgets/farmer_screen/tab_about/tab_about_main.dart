import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:local_roots_2/models/farmer_model.dart';
import 'package:local_roots_2/ui/common/photos/photo_oval_large.dart';
import 'package:local_roots_2/ui/customer/common/farmer_widgets/farmer_screen/tab_about/tile_categories.dart';
import 'package:local_roots_2/ui/customer/common/farmer_widgets/farmer_screen/tab_about/tile_certificates.dart';
import 'package:local_roots_2/ui/customer/common/farmer_widgets/farmer_screen/tab_about/tile_company.dart';
import 'package:local_roots_2/ui/customer/common/farmer_widgets/farmer_screen/tab_about/tile_contacts.dart';
import 'package:local_roots_2/ui/customer/common/farmer_widgets/farmer_screen/tab_about/tile_experience.dart';
import 'package:local_roots_2/ui/customer/common/farmer_widgets/farmer_screen/tab_about/tile_farm_photos.dart';

class CustomerFarmerTabAbout extends ConsumerWidget {
  final FarmerModel farmer;
  const CustomerFarmerTabAbout({super.key, required this.farmer});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListView(
      children: [
        const SizedBox(height: 20),
        Center(
          child: SizedBox(
            height: 200,
            width: 200,
            child: PhotoOvalLarge(photoUrl: farmer.largePhoto),
          ),
        ),
        const SizedBox(height: 20),
        ListTile(
          title: Text(farmer.name),
          subtitle: Text(farmer.description ?? ''),
        ),
        const Divider(),
        CustomerFarmerTileCategories(farmer: farmer),
        const Divider(),
        CustomerFarmerTileContacts(farmer: farmer),
        const Divider(),
        CustomerFarmerTileCertificates(farmer: farmer),
        const Divider(),
        CustomerFarmerTileCompany(farmer: farmer),
        const Divider(),
        CustomerFarmerTileExperience(farmer: farmer),
        const Divider(),
        CustomerFarmerTilePhotos(farmer: farmer),
        const SizedBox(height: 40),
      ],
    );
  }
}

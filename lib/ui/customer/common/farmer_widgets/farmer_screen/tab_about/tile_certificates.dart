import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:local_roots_2/models/farmer_model.dart';

class CustomerFarmerTileCertificates extends StatelessWidget {
  final FarmerModel farmer;
  const CustomerFarmerTileCertificates({super.key, required this.farmer});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
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
        )
      ],
    );
  }
}

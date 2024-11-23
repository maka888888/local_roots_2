import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:local_roots_2/models/farmer_model.dart';

class CustomerFarmerTilePhotos extends StatelessWidget {
  final FarmerModel farmer;
  const CustomerFarmerTilePhotos({super.key, required this.farmer});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          title: Text(AppLocalizations.of(context)!.farmPhotos),
          subtitle: GridView.builder(
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
        )
      ],
    );
  }
}

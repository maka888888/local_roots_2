import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:local_roots_2/models/farmer_model.dart';

class CustomerFarmerTileExperience extends StatelessWidget {
  final FarmerModel farmer;
  const CustomerFarmerTileExperience({super.key, required this.farmer});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          title: Text(AppLocalizations.of(context)!.experience),
          subtitle: Text(
              '${farmer.yearsExperience} ${AppLocalizations.of(context)!.years}'),
        )
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:local_roots_2/models/farmer_model.dart';

class CustomerFarmerTileContacts extends StatelessWidget {
  final FarmerModel farmer;
  const CustomerFarmerTileContacts({super.key, required this.farmer});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          title: Text(AppLocalizations.of(context)!.contacts),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(farmer.phone),
              Text(farmer.email),
            ],
          ),
        )
      ],
    );
  }
}

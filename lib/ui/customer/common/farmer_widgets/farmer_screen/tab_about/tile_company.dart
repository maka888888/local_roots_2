import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:local_roots_2/models/farmer_model.dart';

class CustomerFarmerTileCompany extends StatelessWidget {
  final FarmerModel farmer;
  const CustomerFarmerTileCompany({super.key, required this.farmer});

  @override
  Widget build(BuildContext context) {
    String? vatId;

    if (farmer.vatId.isNotEmpty) {
      vatId = farmer.vatId;
    }

    return ListTile(
      title: Text(AppLocalizations.of(context)!.companyID),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(farmer.companyId),
          vatId == null ? const SizedBox.shrink() : Text(vatId),
        ],
      ),
    );
  }
}

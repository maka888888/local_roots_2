import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:local_roots_2/models/sales_location_model.dart';

import '../../../../../providers/farmer/sales_location/sales_location_service.dart';

class FarmerSalesLocationTileStatus extends StatelessWidget {
  final SalesLocationModel salesLocation;
  const FarmerSalesLocationTileStatus({super.key, required this.salesLocation});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: FormBuilderSwitch(
        name: 'isActive',
        initialValue: salesLocation.isActive,
        title: Text('${AppLocalizations.of(context)!.salesLocationIsActive}?',
            style: Theme.of(context).textTheme.bodyLarge),
        decoration: const InputDecoration(
          border: InputBorder.none,
        ),
        onChanged: (value) async {
          salesLocation.isActive = value!;
          await ServicesFarmerSalesLocation()
              .updateSalesLocation(salesLocation);
        },
      ),
    );
  }
}

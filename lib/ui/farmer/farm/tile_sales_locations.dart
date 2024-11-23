import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:local_roots_2/ui/farmer/farm/screen_sales_locations/screen_locations_main.dart';

class FarmerFarmTileSalesLocations extends ConsumerWidget {
  const FarmerFarmTileSalesLocations({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        ListTile(
          leading: const Icon(Icons.storefront_outlined),
          title: Text(AppLocalizations.of(context)!.salesLocations),
          subtitle: Text(AppLocalizations.of(context)!.viewEditSalesLocations),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const FarmerSalesLocations(),
              ),
            );
          },
          trailing: const Icon(Icons.arrow_forward_ios),
        ),
        const Divider(),
      ],
    );
  }
}

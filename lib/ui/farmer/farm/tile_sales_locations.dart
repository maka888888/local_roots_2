import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FarmerFarmTileSalesLocations extends ConsumerWidget {
  const FarmerFarmTileSalesLocations({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        ListTile(
          enabled: false,
          leading: const Icon(Icons.storefront_outlined),
          title: Text(AppLocalizations.of(context)!.salesLocations),
          subtitle: Text(AppLocalizations.of(context)!.viewEditSalesLocations),
          onTap: () async {},
          trailing: const Icon(Icons.arrow_forward_ios),
        ),
        const Divider(),
      ],
    );
  }
}

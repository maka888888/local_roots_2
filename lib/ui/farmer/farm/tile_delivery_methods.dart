import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'delivery_methods/delivery_methods_main.dart';

class FarmerFarmTileDeliveryMethods extends ConsumerWidget {
  const FarmerFarmTileDeliveryMethods({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        ListTile(
          leading: const Icon(Icons.padding_outlined),
          title: Text(AppLocalizations.of(context)!.deliveryMethods),
          subtitle: Text(AppLocalizations.of(context)!.viewEditDeliveryMethods),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const FarmerSalesDelivery(),
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

import 'package:badges/badges.dart' as badges;
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FarmerSalesDelivery extends ConsumerWidget {
  const FarmerSalesDelivery({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.deliveryMethods),
      ),
      body: ListView(
        children: [
          ListTile(
            leading: const Icon(Icons.directions_car_filled_outlined),
            title:
                Text(AppLocalizations.of(context)!.personalDeliveryToCustomer),
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.local_shipping_outlined),
            title: badges.Badge(
              badgeContent: Text(
                AppLocalizations.of(context)!.recommended,
                style: TextStyle(
                    color: Theme.of(context).colorScheme.onPrimary,
                    fontSize: 12),
              ),
              badgeStyle: badges.BadgeStyle(
                badgeColor: Theme.of(context).colorScheme.primary,
                shape: badges.BadgeShape.square,
                padding: const EdgeInsets.all(3),
                borderRadius: BorderRadius.circular(3),
              ),
              child: Text(
                AppLocalizations.of(context)!.deliveryDepo,
              ),
            ),
          ),
          const Divider(),
        ],
      ),
    );
  }
}

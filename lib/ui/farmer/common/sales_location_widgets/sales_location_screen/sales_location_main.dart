import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:local_roots_2/providers/farmer/sales_location/sales_location_stream.dart';
import 'package:local_roots_2/ui/farmer/common/sales_location_widgets/sales_location_screen/tile_hours.dart';
import 'package:local_roots_2/ui/farmer/common/sales_location_widgets/sales_location_screen/tile_name.dart';
import 'package:local_roots_2/ui/farmer/common/sales_location_widgets/sales_location_screen/tile_payments.dart';
import 'package:local_roots_2/ui/farmer/common/sales_location_widgets/sales_location_screen/tile_status.dart';

class FarmerSalesLocation extends ConsumerWidget {
  final String salesLocationId;
  const FarmerSalesLocation({super.key, required this.salesLocationId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final salesLocation =
        ref.watch(refFarmerSalesLocationStreamProvider(salesLocationId));

    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.salesLocation),
      ),
      body: salesLocation.when(
        data: (salesLocation) {
          if (salesLocation == null) {
            return const Center(
              child: Text('Sales location not found'),
            );
          } else {
            return ListView(
              children: [
                const SizedBox(height: 20),
                FarmerSalesLocationTileName(salesLocation: salesLocation),
                const Divider(),
                FarmerSalesLocationTileStatus(salesLocation: salesLocation),
                const Divider(),
                FarmerSalesLocationTileHours(salesLocation: salesLocation),
                const Divider(),
                FarmerSalesLocationTilePayments(salesLocation: salesLocation),
              ],
            );
          }
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stackTrace) => Center(
          child: Text('Error: $error'),
        ),
      ),
    );
  }
}

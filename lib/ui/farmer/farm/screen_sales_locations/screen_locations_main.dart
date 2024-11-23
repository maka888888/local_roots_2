import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:local_roots_2/providers/farmer/sales_location/sales_locations_stream.dart';

import '../../common/sales_location_widgets/sales_location_card_long/sales_location_card_long_main.dart';
import '../../common/sales_location_widgets/sales_location_new/sales_location_main.dart';

class FarmerSalesLocations extends ConsumerWidget {
  const FarmerSalesLocations({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final salesLocations = ref.watch(refFarmerSalesLocationsStreamProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.salesLocations),
      ),
      body: salesLocations.when(
        data: (data) {
          if (data.isEmpty) {
            return Center(
              child:
                  Text(AppLocalizations.of(context)!.noSalesLocationsAtMoment),
            );
          }

          return ListView.separated(
            itemCount: data.length,
            itemBuilder: (context, index) {
              return FarmerSalesLocationCardLong(salesLocation: data[index]);
            },
            separatorBuilder: (context, index) {
              return const Divider();
            },
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stackTrace) => Center(
          child: Text('Error: $error'),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return const FarmerSalesLocationNew();
              },
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

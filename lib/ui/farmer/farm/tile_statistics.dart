import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:local_roots_2/ui/farmer/farm/screen_statistics/statistics_main.dart';

class FarmerFarmTileStatistics extends ConsumerWidget {
  const FarmerFarmTileStatistics({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        ListTile(
          leading: const Icon(Icons.auto_graph_outlined),
          title: Text(AppLocalizations.of(context)!.statistics),
          onTap: () async {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const FarmerSalesStatistics(),
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

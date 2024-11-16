import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:local_roots_2/ui/farmer/farm/screen_my_farm/my_farm_main.dart';

class FarmerFarmTileMyFarm extends ConsumerWidget {
  const FarmerFarmTileMyFarm({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        ListTile(
          leading: const Icon(Icons.nature_people_outlined),
          title: Text(AppLocalizations.of(context)!.myFarm),
          subtitle: Text(AppLocalizations.of(context)!.viewEditMyFarm),
          onTap: () async {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const FarmerFarmMyFarm(),
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

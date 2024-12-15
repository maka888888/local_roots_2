import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../providers/common/app_user/app_user.dart';
import '../../common/farmer_widgets/farmer_candidate/farmer_candidate_main.dart';

class CustomerTileBecomeFarmer extends ConsumerWidget {
  const CustomerTileBecomeFarmer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appUser = ref.watch(refAppUserProvider).valueOrNull;

    if (appUser != null) {
      return const SizedBox();
    } else {
      return Card.outlined(
        child: ListTile(
          leading: const Icon(Icons.nature_people_outlined),
          title: Text(AppLocalizations.of(context)!.becomeFarmer),
          subtitle: Text(AppLocalizations.of(context)!.withFarmerProfile),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return const CustomerFarmerCandidateMain();
                },
              ),
            );
          },
        ),
      );
    }
  }
}

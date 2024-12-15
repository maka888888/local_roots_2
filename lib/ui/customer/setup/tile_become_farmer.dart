import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:local_roots_2/models/app_user_model.dart';
import 'package:local_roots_2/providers/common/app_user/app_user.dart';

import '../common/farmer_widgets/farmer_candidate/farmer_candidate_main.dart';

class CustomerSetupTileBecomeFarmer extends ConsumerWidget {
  const CustomerSetupTileBecomeFarmer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    AppUserModel? appUserModel = ref.watch(refAppUserProvider).valueOrNull;

    if (appUserModel == null || appUserModel.isFarmer) {
      return const SizedBox();
    } else {
      return ListTile(
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
      );
    }
  }
}

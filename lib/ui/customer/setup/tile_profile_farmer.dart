import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:local_roots_2/models/app_user_model.dart';
import 'package:local_roots_2/providers/common/app_user/app_user.dart';
import 'package:local_roots_2/utils/profiles_switch.dart';

class CustomerSetupTileFarmer extends ConsumerWidget {
  const CustomerSetupTileFarmer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    AppUserModel? appUserModel = ref.watch(refAppUserProvider).valueOrNull;

    // print('appUserModel: ${appUserModel!.farmer}');

    if (appUserModel == null || !appUserModel.isFarmer) {
      return const SizedBox();
    } else {
      return Card(
        child: ListTile(
            leading: const Icon(Icons.nature_people_outlined),
            title: Text(AppLocalizations.of(context)!.farmerProfile),
            subtitle: Text(AppLocalizations.of(context)!.switchToFarmerProfile),
            onTap: () async {
              //await ServicesAuth().signOut();
              await ProfileChanger().changeProfileToFarmer(context, ref);
            }),
      );
    }
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:local_roots_2/models/app_user_model.dart';
import 'package:local_roots_2/providers/common/app_user/app_user.dart';
import 'package:local_roots_2/utils/profiles_switch.dart';

class FarmerSetupTileCustomer extends ConsumerWidget {
  const FarmerSetupTileCustomer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    AppUserModel? appUserModel = ref.watch(refAppUserProvider).valueOrNull;

    if (appUserModel == null || !appUserModel.isCustomer) {
      return const SizedBox();
    } else {
      return Column(
        children: [
          ListTile(
            leading: const Icon(Icons.person_outlined),
            title: Text(AppLocalizations.of(context)!.customer),
            subtitle: Text(AppLocalizations.of(context)!.switchToCustomerMode),
            onTap: () async {
              await ProfileChanger().changeProfileToAdmin(context, ref);
            },
            trailing: const Icon(Icons.arrow_forward_ios),
          ),
          const Divider(),
        ],
      );
    }
  }
}

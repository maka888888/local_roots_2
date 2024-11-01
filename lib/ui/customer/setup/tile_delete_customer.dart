import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:local_roots_2/models/app_user_model.dart';
import 'package:local_roots_2/providers/common/app_user/app_user.dart';

import '../../../providers/common/app_user/app_user_services.dart';
import '../../../providers/common/auth/auth_services.dart';

class CustomerSetupTileDeleteCustomer extends ConsumerWidget {
  const CustomerSetupTileDeleteCustomer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    AppUserModel? appUser = ref.watch(refAppUserProvider).valueOrNull;

    Future<void> delete() async {
      return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(AppLocalizations.of(context)!.warning),
            content: Text(
                AppLocalizations.of(context)!.deleteCustomerProfileWarning),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text(
                  AppLocalizations.of(context)!.cancel.toUpperCase(),
                ),
              ),
              TextButton(
                onPressed: () async {
                  appUser!.customer = null;
                  appUser.isCustomer = false;

                  await ServiceAppUser().updateAppUser(appUser);
                  //await FirebaseAuth.instance.currentUser!.delete();
                  await ServicesAuth().signOut();
                },
                child: Text(
                  AppLocalizations.of(context)!.delete.toUpperCase(),
                  style: TextStyle(color: Theme.of(context).colorScheme.error),
                ),
              ),
            ],
          );
        },
      );
    }

    if (appUser == null) {
      return const SizedBox();
    } else {
      return Card(
        child: ListTile(
            leading: const Icon(Icons.person_remove_outlined),
            title: Text(AppLocalizations.of(context)!.deleteCustomerProfile),
            subtitle: Text(AppLocalizations.of(context)!
                .youMayDeleteAllDataRelatedWithYou),
            onTap: () async {
              await delete();
            }),
      );
    }
  }
}

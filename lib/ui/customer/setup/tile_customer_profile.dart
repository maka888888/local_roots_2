import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:local_roots_2/models/app_user_model.dart';
import 'package:local_roots_2/ui/customer/setup/view_customer_profile/customer_profile_main.dart';

import '../../../providers/common/app_user/app_user.dart';

class CustomerSetupTileCustomerProfile extends ConsumerWidget {
  const CustomerSetupTileCustomerProfile({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    AppUserModel? appUser = ref.watch(refAppUserProvider).valueOrNull;

    if (appUser == null || appUser.customer == null) {
      return const SizedBox();
    } else {
      return ListTile(
        leading: const Icon(Icons.person_outlined),
        title: Text(AppLocalizations.of(context)!.customerProfile),
        subtitle: Text(AppLocalizations.of(context)!.editCustomerProfile),
        onTap: () async {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return const CustomerSetupCustomerProfile();
              },
            ),
          );
        },
        trailing: const Icon(Icons.arrow_forward_ios),
      );
    }
  }
}

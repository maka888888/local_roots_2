import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../providers/common/app_user/app_user.dart';
import '../../../common/login_screen/login_screen_main.dart';

class CustomerTileBecomeCustomer extends ConsumerWidget {
  const CustomerTileBecomeCustomer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appUser = ref.watch(refAppUserProvider).valueOrNull;

    if (appUser != null) {
      return const SizedBox();
    } else {
      return Card.outlined(
        child: ListTile(
          leading: const Icon(Icons.person_add_outlined),
          title: Text(AppLocalizations.of(context)!.createCustomerProfile),
          subtitle: Text(AppLocalizations.of(context)!.withCustomerProfile),
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const LoginScreenMain(),
                ));
          },
        ),
      );
    }
  }
}

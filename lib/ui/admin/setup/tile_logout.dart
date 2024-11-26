import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:local_roots_2/providers/common/auth/auth.dart';

import '../../../providers/common/auth/auth_services.dart';

class AdminSetupTileLogout extends ConsumerWidget {
  const AdminSetupTileLogout({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    User? user = ref.watch(refAuthProvider);

    if (user == null) {
      return const SizedBox();
    } else {
      return ListTile(
        leading: const Icon(Icons.logout),
        title: Text(AppLocalizations.of(context)!.logout),
        subtitle: Text(
            '${AppLocalizations.of(context)!.youAreLoggedWithEmail}: ${user.email!}'),
        onTap: () async {
          await ServicesAuth().signOut();
        },
        trailing: const Icon(Icons.arrow_forward_ios),
      );
    }
  }
}

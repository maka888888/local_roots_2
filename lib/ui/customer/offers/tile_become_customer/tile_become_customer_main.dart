import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../common/login_screen/login_screen_main.dart';

class CustomerTileBecomeCustomer extends StatelessWidget {
  const CustomerTileBecomeCustomer({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
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

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:local_roots_2/models/app_user_model.dart';

import '../app_user_screen/app_user_main.dart';

class AdminAppUserTile extends StatelessWidget {
  final AppUserModel appUser;
  const AdminAppUserTile({super.key, required this.appUser});

  @override
  Widget build(BuildContext context) {
    Widget roles = Wrap(
      spacing: 4,
      children: [
        appUser.isAdmin
            ? Chip(
                visualDensity: VisualDensity.compact,
                avatar: const Icon(Icons.admin_panel_settings_outlined),
                label: Text(AppLocalizations.of(context)!.administrator),
              )
            : const SizedBox(),
        appUser.isCustomer
            ? Chip(
                visualDensity: VisualDensity.compact,
                avatar: const Icon(Icons.person_outline),
                label: Text(AppLocalizations.of(context)!.customer),
                backgroundColor: appUser.customer == null
                    ? Theme.of(context).colorScheme.surfaceDim
                    : null,
              )
            : const SizedBox(),
        appUser.isFarmer
            ? Chip(
                visualDensity: VisualDensity.compact,
                avatar: const Icon(Icons.nature_people_outlined),
                label: Text(AppLocalizations.of(context)!.farmer),
                // backgroundColor: appUser.farmer == null
                //     ? Theme.of(context).colorScheme.surfaceDim
                //     : null,
              )
            : const SizedBox(),
        appUser.isDistributor
            ? Chip(
                visualDensity: VisualDensity.compact,
                avatar: const Icon(Icons.storefront_outlined),
                label: Text(AppLocalizations.of(context)!.distributor),
              )
            : const SizedBox(),
      ],
    );

    return ListTile(
      title: Text(appUser.email),
      subtitle: roles,
      trailing: const Icon(Icons.arrow_forward_ios),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return AdminAppUserScreen(appUser: appUser);
            },
          ),
        );
      },
    );
  }
}

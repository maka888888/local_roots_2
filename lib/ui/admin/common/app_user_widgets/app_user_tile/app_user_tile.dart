import 'package:flutter/material.dart';
import 'package:local_roots_2/models/app_user_model.dart';

import '../app_user_screen/app_user_main.dart';

class AdminAppUserTile extends StatelessWidget {
  final AppUserModel appUser;
  const AdminAppUserTile({super.key, required this.appUser});

  @override
  Widget build(BuildContext context) {
    Widget roles = Row(
      children: [
        appUser.isAdmin
            ? const Icon(Icons.admin_panel_settings_outlined)
            // Chip(
            //         visualDensity: VisualDensity.compact,
            //         avatar: const Icon(Icons.admin_panel_settings_outlined),
            //         label: Text(AppLocalizations.of(context)!.administrator),
            //       )
            : const SizedBox(),
        appUser.isCustomer
            ? const Icon(Icons.person_outline)

            // Chip(
            //         visualDensity: VisualDensity.compact,
            //         avatar: const Icon(Icons.person_outline),
            //         label: Text(AppLocalizations.of(context)!.customer),
            //         backgroundColor: appUser.customer == null
            //             ? Theme.of(context).colorScheme.surfaceDim
            //             : null,
            //       )
            : const SizedBox(),
        appUser.isFarmer
            ? const Icon(Icons.nature_people_outlined)
            // Chip(
            //         visualDensity: VisualDensity.compact,
            //         avatar: const Icon(Icons.nature_people_outlined),
            //         label: Text(AppLocalizations.of(context)!.farmer),
            //         // backgroundColor: appUser.farmer == null
            //         //     ? Theme.of(context).colorScheme.surfaceDim
            //         //     : null,
            //       )
            : const SizedBox(),
        appUser.isDistributor
            ? const Icon(Icons.storefront_outlined)
            // Chip(
            //         visualDensity: VisualDensity.compact,
            //         avatar: const Icon(Icons.storefront_outlined),
            //         label: Text(AppLocalizations.of(context)!.distributor),
            //       )
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

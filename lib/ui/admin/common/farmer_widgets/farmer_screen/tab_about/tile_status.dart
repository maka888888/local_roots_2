import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:local_roots_2/models/app_user_model.dart';

import '../../../../../../providers/admin/farmers/farmer_services.dart';
import '../../../../../../providers/common/app_user/app_user_services.dart';

class AdminFarmMyFarmTileStatus extends StatelessWidget {
  final AppUserModel appUser;
  const AdminFarmMyFarmTileStatus({super.key, required this.appUser});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FormBuilderSwitch(
          name: 'farmIsActive',
          initialValue: appUser.farmer!.isActive,
          title: Text('${AppLocalizations.of(context)!.farmIsActive}?',
              style: Theme.of(context).textTheme.bodyLarge),
          decoration: const InputDecoration(
            border: InputBorder.none,
          ),
          onChanged: (value) async {
            appUser.farmer!.isActive = value!;
            await ServiceAppUser().updateAppUser(appUser);
          },
        ),
        const SizedBox(height: 10),
        FormBuilderSwitch(
          name: 'farmIsApproved',
          initialValue: appUser.farmer!.isApproved,
          title: Text('${AppLocalizations.of(context)!.farmerIsApproved}?',
              style: Theme.of(context).textTheme.bodyLarge),
          decoration: const InputDecoration(
            border: InputBorder.none,
          ),
          onChanged: (value) async {
            appUser.farmer!.isApproved = value!;
            //await ServiceAppUser().updateAppUser(appUser);

            await ServicesAdminFarmer().changeFarmerStatus(appUser, value);
          },
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:local_roots_2/models/app_user_model.dart';

import '../../../../providers/common/app_user/app_user_services.dart';

class FarmerFarmMyFarmTileStatus extends StatelessWidget {
  final AppUserModel appUser;
  const FarmerFarmMyFarmTileStatus({super.key, required this.appUser});

  @override
  Widget build(BuildContext context) {
    return FormBuilderSwitch(
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
    );
  }
}

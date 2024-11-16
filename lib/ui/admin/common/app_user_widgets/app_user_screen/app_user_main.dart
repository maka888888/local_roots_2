import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:jiffy/jiffy.dart';
import 'package:local_roots_2/models/app_user_model.dart';

import '../../../../../providers/admin/app_users/app_users_services.dart';
import '../../customer_widgets/customer_profile_create/onboarding_main.dart';
import '../../customer_widgets/customer_tile/customer_tile_main.dart';
import '../../farmer_widgets/farmer_card_long/farmer_card_long_main.dart';
import '../../farmer_widgets/farmer_onboarding/farmer_onboarding_main.dart';

class AdminAppUserScreen extends StatelessWidget {
  final AppUserModel appUser;
  const AdminAppUserScreen({super.key, required this.appUser});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.appUser),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20),
            ListTile(
              title: Text(AppLocalizations.of(context)!.email),
              subtitle: Text(appUser.email),
            ),
            const Divider(),
            ListTile(
              title: Text(AppLocalizations.of(context)!.createdAt),
              subtitle:
                  Text(Jiffy.parseFromDateTime(appUser.createdAt).yMMMMEEEEdjm),
            ),
            const Divider(),
            ListTile(
              title: Text(AppLocalizations.of(context)!.lastLogin),
              subtitle:
                  Text(Jiffy.parseFromDateTime(appUser.lastLogin).yMMMMEEEEdjm),
            ),
            const Divider(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: FormBuilderSwitch(
                name: 'userIsAppCustomer',
                title:
                    Text('${AppLocalizations.of(context)!.userIsAppCustomer}?'),
                initialValue: appUser.isCustomer,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                ),
                onChanged: (value) async {
                  appUser.isCustomer = value as bool;
                  await ServiceAdminAppUser().updateAppUser(appUser);
                },
              ),
            ),
            appUser.customer == null
                ? OutlinedButton(
                    child:
                        Text(AppLocalizations.of(context)!.createUserProfile),
                    onPressed: () async {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return AdminCustomerOnboardingMain(
                              appUser: appUser,
                            );
                          },
                        ),
                      );
                    })
                : FarmerCustomerTile(customer: appUser.customer!),
            const Divider(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: FormBuilderSwitch(
                name: 'userIsFarmer',
                title: Text('${AppLocalizations.of(context)!.userIsFarmer}?'),
                initialValue: appUser.isFarmer,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                ),
                onChanged: (value) async {
                  appUser.isFarmer = value as bool;
                  await ServiceAdminAppUser().updateAppUser(appUser);
                },
              ),
            ),
            appUser.farmer == null
                ? OutlinedButton(
                    child:
                        Text(AppLocalizations.of(context)!.createFarmerProfile),
                    onPressed: () async {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return AdminFarmerOnboarding(
                              appUser: appUser,
                            );
                          },
                        ),
                      );
                    })
                : AdminFarmerCardLong(farmer: appUser.farmer!),
            const Divider(),
          ],
        ),
      ),
    );
  }
}

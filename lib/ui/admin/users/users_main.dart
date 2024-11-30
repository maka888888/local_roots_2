import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:local_roots_2/models/app_user_model.dart';
import 'package:local_roots_2/models/customer_model.dart';
import 'package:local_roots_2/providers/admin/app_users/app_users_stream.dart';
import 'package:local_roots_2/ui/admin/users/tab_customers/customers_main.dart';
import 'package:local_roots_2/ui/admin/users/tab_farmers/farmers_main.dart';
import 'package:local_roots_2/ui/admin/users/tab_users/users_main.dart';
import 'package:local_roots_2/ui/common/loading_widget/loading_widget.dart';

import '../../common/app_name/app_name_main.dart';

class AdminUsersMain extends ConsumerWidget {
  const AdminUsersMain({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appUsers = ref.watch(refAdminAppUsersStreamProvider);

    return appUsers.when(
      data: (appUsers) {
        List<CustomerModel> customers = [];
        List<AppUserModel> farmers = [];

        for (var appUser in appUsers) {
          if (appUser.customer != null) {
            customers.add(appUser.customer!);
          }

          if (appUser.farmer != null) {
            farmers.add(appUser);
          }
        }

        return DefaultTabController(
          length: 3,
          child: Scaffold(
            appBar: AppBar(
              title: const AppNameMain(),
              bottom: TabBar(
                tabs: [
                  Tab(
                      text:
                          '${AppLocalizations.of(context)!.customers} (${customers.length})'),
                  Tab(
                      text:
                          '${AppLocalizations.of(context)!.farmers} (${farmers.length})'),
                  Tab(
                      text:
                          '${AppLocalizations.of(context)!.users} (${appUsers.length})'),
                ],
              ),
            ),
            body: TabBarView(
              children: [
                AdminUsersTabCustomers(customers: customers),
                AdminUsersTabFarmers(appUsers: farmers),
                AdminUsersTabUsers(appUsers: appUsers),
              ],
            ),
          ),
        );
      },
      error: (err, stack) {
        return Scaffold(
          appBar: AppBar(
            title: const AppNameMain(),
          ),
          body: Center(
            child: Text('Error: $err'),
          ),
        );
      },
      loading: () {
        return Scaffold(
          appBar: AppBar(
            title: const AppNameMain(),
          ),
          body: const LoadingWidgetMain(),
        );
      },
    );
  }
}

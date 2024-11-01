import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:local_roots_2/providers/common/app_user/app_user.dart';

import '../../../common/error_widget/error_widget.dart';
import '../../../common/loading_widget/loading_widget.dart';
import 'customer_profile_data.dart';

class CustomerSetupCustomerProfile extends ConsumerWidget {
  const CustomerSetupCustomerProfile({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final customer = ref.watch(refAppUserProvider);
    print('CustomerSetupCustomerProfile: customer: $customer');

    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.customerProfile),
      ),
      body: customer.when(
        data: (appUser) =>
            CustomerSetupCustomerProfileData(customer: appUser!.customer!),
        error: (err, stack) => ErrorWidgetMain(errorText: err.toString()),
        loading: () => const LoadingWidgetMain(),
      ),
    );
  }
}

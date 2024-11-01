import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:local_roots_2/models/app_user_model.dart';
import 'package:local_roots_2/providers/customer/new_customer/new_customer.dart';
import 'package:local_roots_2/ui/admin/common/customer_widgets/customer_profile_create/step_address.dart';
import 'package:local_roots_2/ui/admin/common/customer_widgets/customer_profile_create/step_name.dart';
import 'package:local_roots_2/ui/admin/common/customer_widgets/customer_profile_create/step_photo.dart';
import 'package:local_roots_2/ui/admin/common/customer_widgets/customer_profile_create/step_rules.dart';

import '../../../../customer/onboarding/onboarding_main.dart';

class AdminCustomerOnboardingMain extends ConsumerWidget {
  final AppUserModel appUser;
  const AdminCustomerOnboardingMain({super.key, required this.appUser});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final customer = ref.watch(refCustomerNewProvider(true));

    switch (customer.onboardingStep) {
      case CustomerOnboardingStep.name:
        return const AdminCustomerOnboardingStepName(progress: 0.25);
      case CustomerOnboardingStep.photo:
        return const AdminCustomerOnboardingStepPhoto(progress: 0.5);
      case CustomerOnboardingStep.address:
        return const AdminCustomerOnboardingStepAddress(progress: 0.75);
      case CustomerOnboardingStep.rules:
        return AdminCustomerOnboardingStepRules(progress: 1, appUser: appUser);
      default:
        return const Placeholder();
    }
  }
}

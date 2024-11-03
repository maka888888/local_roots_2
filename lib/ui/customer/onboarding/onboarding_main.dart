import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:local_roots_2/providers/customer/new_customer/new_customer.dart';
import 'package:local_roots_2/ui/customer/onboarding/step_address.dart';
import 'package:local_roots_2/ui/customer/onboarding/step_name.dart';
import 'package:local_roots_2/ui/customer/onboarding/step_photo.dart';
import 'package:local_roots_2/ui/customer/onboarding/step_rules.dart';

enum CustomerOnboardingStep { name, photo, address, rules }

class CustomerOnboardingMain extends ConsumerWidget {
  const CustomerOnboardingMain({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final customer = ref.watch(refCustomerNewProvider);

    switch (customer.onboardingStep) {
      case CustomerOnboardingStep.name:
        return const CustomerOnboardingStepName(progress: 0.25);
      case CustomerOnboardingStep.photo:
        return const CustomerOnboardingStepPhoto(progress: 0.5);
      case CustomerOnboardingStep.address:
        return const CustomerOnboardingStepAddress(progress: 0.75);
      case CustomerOnboardingStep.rules:
        return const CustomerOnboardingStepRules(progress: 1);
      default:
        return const Placeholder();
    }
  }
}

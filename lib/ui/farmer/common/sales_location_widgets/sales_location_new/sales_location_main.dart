import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:local_roots_2/ui/farmer/common/sales_location_widgets/sales_location_new/step_name.dart';
import 'package:local_roots_2/ui/farmer/common/sales_location_widgets/sales_location_new/step_payments.dart';
import 'package:local_roots_2/ui/farmer/common/sales_location_widgets/sales_location_new/step_status.dart';
import 'package:local_roots_2/ui/farmer/common/sales_location_widgets/sales_location_new/step_working_hours.dart';

import '../../../../../models/sales_location_model.dart';
import '../../../../../providers/farmer/sales_location/sales_location_new.dart';

enum SalesLocationNewStep {
  name,
  workingHours,
  paymentMethods,
  status,
}

class FarmerSalesLocationNew extends ConsumerWidget {
  const FarmerSalesLocationNew({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final SalesLocationModel salesLocation =
        ref.watch(refFarmerSalesLocationNewProvider);

    switch (salesLocation.onboardingStep) {
      case SalesLocationNewStep.name:
        return const FarmerSalesLocationStepName(progress: 0.25);
      case SalesLocationNewStep.workingHours:
        return const FarmerSalesLocationStepHours(progress: 0.50);
      case SalesLocationNewStep.paymentMethods:
        return const FarmerSalesLocationStepPayments(progress: 0.75);
      case SalesLocationNewStep.status:
        return const FarmerSalesLocationStepStatus(progress: 1);

      default:
        return const Text('Error: Unknown offer onboarding step');
    }
  }
}

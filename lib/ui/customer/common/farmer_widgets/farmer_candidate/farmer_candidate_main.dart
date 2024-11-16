import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:local_roots_2/ui/customer/common/farmer_widgets/farmer_candidate/step_address.dart';
import 'package:local_roots_2/ui/customer/common/farmer_widgets/farmer_candidate/step_categories.dart';
import 'package:local_roots_2/ui/customer/common/farmer_widgets/farmer_candidate/step_certificates.dart';
import 'package:local_roots_2/ui/customer/common/farmer_widgets/farmer_candidate/step_description.dart';
import 'package:local_roots_2/ui/customer/common/farmer_widgets/farmer_candidate/step_experience.dart';
import 'package:local_roots_2/ui/customer/common/farmer_widgets/farmer_candidate/step_name.dart';

import '../../../../../providers/customer/farmer_candidate/farmer_candidate.dart';

enum FarmerCandidateStep {
  name,
  address,
  categories,
  experience,
  certificates,
  description
}

class CustomerFarmerCandidateMain extends ConsumerWidget {
  const CustomerFarmerCandidateMain({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final farmerCandidate = ref.watch(refCustomerFarmerCandidateProvider);

    switch (farmerCandidate.step) {
      case FarmerCandidateStep.name:
        return const CustomerFarmerCandidateStepName(progress: 0.125);
      case FarmerCandidateStep.address:
        return const CustomerFarmerCandidateStepAddress(progress: 0.25);

      case FarmerCandidateStep.categories:
        return const CustomerFarmerCandidateStepCategories(progress: 0.5);
      case FarmerCandidateStep.experience:
        return const CustomerFarmerCandidateStepExperience(progress: 0.625);
      case FarmerCandidateStep.certificates:
        return const CustomerFarmerCandidateStepCertificates(progress: 0.75);
      case FarmerCandidateStep.description:
        return const CustomerFarmerCandidateStepDescription(progress: 0.875);
      default:
        return const Placeholder();
    }
  }
}

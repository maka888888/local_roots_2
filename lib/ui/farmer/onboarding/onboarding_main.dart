import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:local_roots_2/models/farmer_model.dart';
import 'package:local_roots_2/providers/farmer/onboarding/farmer_onboarding.dart';
import 'package:local_roots_2/ui/farmer/onboarding/step_address.dart';
import 'package:local_roots_2/ui/farmer/onboarding/step_categories.dart';
import 'package:local_roots_2/ui/farmer/onboarding/step_certificates.dart';
import 'package:local_roots_2/ui/farmer/onboarding/step_company.dart';
import 'package:local_roots_2/ui/farmer/onboarding/step_description.dart';
import 'package:local_roots_2/ui/farmer/onboarding/step_experience.dart';
import 'package:local_roots_2/ui/farmer/onboarding/step_name.dart';
import 'package:local_roots_2/ui/farmer/onboarding/step_photo_main.dart';
import 'package:local_roots_2/ui/farmer/onboarding/step_photos_farm.dart';
import 'package:local_roots_2/ui/farmer/onboarding/step_status.dart';

enum FarmerOnboardingStep {
  name,
  company,
  address,
  mainPhoto,
  farmPhotos,
  categories,
  certificates,
  yearsExperience,
  description,
  status
}

class FarmerOnboarding extends ConsumerWidget {
  const FarmerOnboarding({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final FarmerModel farmer = ref.watch(refFarmerOnboardingProvider);

    switch (farmer.onboardingStep) {
      case FarmerOnboardingStep.name:
        return const FarmerOnboardingStepName(progress: 0.1);
      case FarmerOnboardingStep.company:
        return const FarmerOnboardingStepCompany(progress: 0.2);
      case FarmerOnboardingStep.address:
        return const FarmerOnboardingStepAddress(progress: 0.3);
      case FarmerOnboardingStep.mainPhoto:
        return const FarmerOnboardingStepPhotoMain(progress: 0.4);
      case FarmerOnboardingStep.farmPhotos:
        return const FarmerOnboardingStepPhotos(progress: 0.5);
      case FarmerOnboardingStep.categories:
        return const FarmerOnboardingStepCategories(progress: 0.6);
      case FarmerOnboardingStep.certificates:
        return const FarmerOnboardingStepCertificates(progress: 0.7);
      case FarmerOnboardingStep.yearsExperience:
        return const FarmerOnboardingStepExperience(progress: 0.8);
      case FarmerOnboardingStep.description:
        return const FarmerOnboardingStepDescription(progress: 0.9);
      case FarmerOnboardingStep.status:
        return const FarmerOnboardingStepStatus(progress: 1.0);
      // default:
      //   return const FarmerOnboardingStepName(progress: 0.1);
      default:
        return const Text('Error: Unknown onboarding step');
    }
  }
}

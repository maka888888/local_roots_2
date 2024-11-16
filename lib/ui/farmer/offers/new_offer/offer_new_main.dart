import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:local_roots_2/models/offer_model.dart';
import 'package:local_roots_2/providers/farmer/offer/offer_new.dart';
import 'package:local_roots_2/ui/farmer/offers/new_offer/step_description.dart';
import 'package:local_roots_2/ui/farmer/offers/new_offer/step_name.dart';
import 'package:local_roots_2/ui/farmer/offers/new_offer/step_photos.dart';
import 'package:local_roots_2/ui/farmer/offers/new_offer/step_price.dart';
import 'package:local_roots_2/ui/farmer/offers/new_offer/step_status.dart';
import 'package:local_roots_2/ui/farmer/offers/new_offer/step_unit.dart';

enum FarmerOfferNewStep {
  name,
  description,
  photos,
  unit,
  price,
  status,
}

class FarmerOfferNew extends ConsumerWidget {
  const FarmerOfferNew({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final OfferModel offer = ref.watch(refFarmerOfferNewProvider);

    switch (offer.onboardingStep) {
      case FarmerOfferNewStep.name:
        return const FarmerOfferStepName(progress: 0.16);
      case FarmerOfferNewStep.description:
        return const FarmerOfferStepDescription(progress: 0.33);
      case FarmerOfferNewStep.photos:
        return const FarmerOfferStepPhotos(progress: 0.5);
      case FarmerOfferNewStep.unit:
        return const FarmerOfferStepUnit(progress: 0.67);
      case FarmerOfferNewStep.price:
        return const FarmerOfferStepPrice(progress: 0.83);
      case FarmerOfferNewStep.status:
        return const FarmerOfferStepStatus(progress: 1.0);

      default:
        return const Text('Error: Unknown offer onboarding step');
    }
  }
}

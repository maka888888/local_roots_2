import 'package:local_roots_2/models/offer_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../models/farmer_short_model.dart';
import '../../../ui/farmer/offers/new_offer/offer_new_main.dart';
import 'offer_services.dart';

part 'offer_new.g.dart';

@riverpod
class RefFarmerOfferNew extends _$RefFarmerOfferNew {
  @override
  OfferModel build() {
    return OfferModel(
      id: '',
      shortId: '',
      name: '',
      category: '',
      mainPhotoLarge: '',
      mainPhotoSmall: '',
      photosLarge: [],
      photosSmall: [],
      price: 0.0,
      currency: 'eur',
      unit: 'kg',
      heightCm: 0,
      widthCm: 0,
      lengthCm: 0,
      weightG: 0,
      isWeightFixed: true,
      isActive: false,
      isApproved: false,
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
      farmerShort: FarmerShortModel(
        name: '',
        smallPhoto: '',
        appUserId: '',
        email: '',
        phone: '',
        street: '',
        city: '',
        country: '',
        isApproved: false,
        isActive: false,
      ),
      onboardingStep: FarmerOfferNewStep.name,
      uid: '',
    );
  }

  updateOffer(OfferModel offer) {
    state = OfferModel.copyFrom(offer);
  }

  Future<void> saveOffer(OfferModel offer) async {
    await ServicesFarmerOffer().createOffer(offer);
  }
}

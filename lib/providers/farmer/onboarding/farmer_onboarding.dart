import 'package:local_roots_2/models/app_user_model.dart';
import 'package:local_roots_2/models/farmer_model.dart';
import 'package:local_roots_2/providers/common/app_user/app_user.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../ui/farmer/onboarding/onboarding_main.dart';
import '../../common/app_user/app_user_services.dart';

part 'farmer_onboarding.g.dart';

@riverpod
class RefFarmerOnboarding extends _$RefFarmerOnboarding {
  @override
  FarmerModel build() {
    return FarmerModel(
      appUserId: '',
      name: '',
      email: '',
      phone: '',
      companyId: '',
      vatId: '',
      street: '',
      city: '',
      country: '',
      latitude: 0.0,
      longitude: 0.0,
      isSellingInFarm: false,
      smallPhoto: '',
      largePhoto: '',
      farmPhotos: [],
      categories: [],
      certificatesPhotos: [],
      yearsExperience: 0,
      description: '',
      isApproved: false,
      isActive: false,
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
      lastLogin: DateTime.now(),
      onboardingStep: FarmerOnboardingStep.name,
      uid: '',
    );
  }

  updateFarmer(FarmerModel farmer) {
    state = FarmerModel.copyFrom(farmer);
  }

  Future<void> saveFarmer(FarmerModel farmer) async {
    AppUserModel appUser = ref.watch(refAppUserProvider).value!;
    appUser.farmer = farmer;

    await ServiceAppUser().updateAppUser(appUser);
  }
}

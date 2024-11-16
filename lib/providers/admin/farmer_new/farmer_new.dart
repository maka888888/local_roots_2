import 'package:local_roots_2/models/farmer_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../models/app_user_model.dart';
import '../app_users/app_users_services.dart';

part 'farmer_new.g.dart';

@riverpod
class RefAdminFarmerNew extends _$RefAdminFarmerNew {
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
      country: 'Lietuva',
      latitude: 0,
      longitude: 0,
      isSellingInFarm: false,
      farmPhotos: [],
      categories: [],
      certificatesPhotos: [],
      yearsExperience: 0,
      description: '',
      isApproved: false,
      isActive: true,
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
      lastLogin: DateTime.now(),
      uid: '',
    );
  }

  updateFarmerNew(FarmerModel farmer) {
    state = FarmerModel.copyFrom(farmer);
  }

  Future<void> saveFarmerNew(AppUserModel appUser) async {
    appUser.farmer = state;
    appUser.isFarmer = true;

    await ServiceAdminAppUser().updateAppUser(appUser);
  }
}

import 'package:local_roots_2/models/farmer_candidate_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../ui/customer/common/farmer_widgets/farmer_candidate/farmer_candidate_main.dart';
import 'farmer_candidate_services.dart';

part 'farmer_candidate.g.dart';

@riverpod
class RefCustomerFarmerCandidate extends _$RefCustomerFarmerCandidate {
  @override
  FarmerCandidateModel build() {
    return FarmerCandidateModel(
      id: '',
      name: '',
      email: '',
      phone: '',
      street: '',
      city: '',
      country: 'Lietuva',
      latitude: 0,
      longitude: 0,
      categories: [],
      certificatesPhotos: [],
      yearsExperience: 0,
      description: '',
      isApproved: false,
      createdAt: DateTime.now(),
      step: FarmerCandidateStep.name,
      uid: '',
    );
  }

  updateCustomerFarmerCandidate(FarmerCandidateModel farmerCandidate) {
    state = FarmerCandidateModel.copyFrom(farmerCandidate);
  }

  Future<void> saveCustomerFarmerCandidate(
      FarmerCandidateModel farmerCandidate) async {
    await ServiceFarmerCandidate().createFarmerCandidate(farmerCandidate);
  }
}

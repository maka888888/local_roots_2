import 'package:local_roots_2/models/farmer_candidate_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'farmer_candidate_services.dart';

part 'farmer_candidate_get.g.dart';

@riverpod
class RefAdminFarmerCandidateGet extends _$RefAdminFarmerCandidateGet {
  @override
  FutureOr<FarmerCandidateModel?> build(String email) {
    return ServicesAdminFarmerCandidates().getFarmerCandidate(email);
  }
}

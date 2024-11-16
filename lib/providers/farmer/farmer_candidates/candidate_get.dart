import 'package:local_roots_2/models/farmer_candidate_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'candidate_services.dart';

part 'candidate_get.g.dart';

@riverpod
class RefFarmerCandidateGet extends _$RefFarmerCandidateGet {
  @override
  FutureOr<FarmerCandidateModel?> build(String email) {
    return ServicesFarmerCandidates().getFarmerCandidate(email);
  }
}

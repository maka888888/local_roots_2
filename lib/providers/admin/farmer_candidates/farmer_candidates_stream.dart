import 'package:local_roots_2/models/farmer_candidate_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'farmer_candidate_services.dart';

part 'farmer_candidates_stream.g.dart';

@riverpod
class RefAdminFarmerCandidatesStream extends _$RefAdminFarmerCandidatesStream {
  @override
  Stream<List<FarmerCandidateModel>> build() {
    return ServicesAdminFarmerCandidates().streamFarmerCandidates();
  }
}

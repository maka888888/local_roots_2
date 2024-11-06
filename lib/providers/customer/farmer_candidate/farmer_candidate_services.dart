import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../models/farmer_candidate_model.dart';

class ServiceFarmerCandidate {
  CollectionReference fireFarmerCandidates =
      FirebaseFirestore.instance.collection('farmer_candidates');

  Future<void> createFarmerCandidate(
      FarmerCandidateModel farmerCandidate) async {
    await fireFarmerCandidates.add(farmerCandidate.toJson());
  }
}

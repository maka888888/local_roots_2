import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:local_roots_2/models/farmer_candidate_model.dart';

class ServicesAdminFarmerCandidates {
  CollectionReference fireFarmerCandidates =
      FirebaseFirestore.instance.collection('farmer_candidates');

  Stream<List<FarmerCandidateModel>> streamFarmerCandidates() {
    return fireFarmerCandidates.snapshots().map((snapshot) => snapshot.docs
        .map((doc) => FarmerCandidateModel.fromFire(doc))
        .toList());
  }

  Future<FarmerCandidateModel?> getFarmerCandidate(String email) async {
    final snapshot = await fireFarmerCandidates
        .where(
          'email',
          isEqualTo: email,
        )
        .get();
    if (snapshot.docs.isNotEmpty) {
      return FarmerCandidateModel.fromFire(snapshot.docs.first);
    } else {
      return null;
    }
  }
}

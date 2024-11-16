import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:local_roots_2/models/farmer_candidate_model.dart';

class ServicesFarmerCandidates {
  CollectionReference fireFarmerCandidates =
      FirebaseFirestore.instance.collection('farmer_candidates');

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

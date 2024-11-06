import 'package:flutter/material.dart';
import 'package:jiffy/jiffy.dart';
import 'package:local_roots_2/models/farmer_candidate_model.dart';

import 'candidate_screen/candidate_screen_main.dart';

class AdminApprovalsTabFarmerCandidateCard extends StatelessWidget {
  final FarmerCandidateModel farmerCandidate;
  const AdminApprovalsTabFarmerCandidateCard(
      {super.key, required this.farmerCandidate});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(farmerCandidate.name),
      subtitle:
          Text(Jiffy.parseFromDateTime(farmerCandidate.createdAt).yMMMMEEEEdjm),
      trailing: const Icon(Icons.arrow_forward_ios),
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => AdminApprovalsTabFarmerCandidateScreen(
              farmerCandidate: farmerCandidate,
            ),
          ),
        );
      },
    );
  }
}

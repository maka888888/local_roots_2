import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:local_roots_2/providers/admin/farmer_candidates/farmer_candidates_stream.dart';

import 'candidate_card.dart';

class AdminApprovalsTabFarmerCandidates extends ConsumerWidget {
  const AdminApprovalsTabFarmerCandidates({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final farmerCandidates = ref.watch(refAdminFarmerCandidatesStreamProvider);

    return farmerCandidates.when(
      data: (farmerCandidates) {
        return ListView.separated(
          itemCount: farmerCandidates.length,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            return AdminApprovalsTabFarmerCandidateCard(
              farmerCandidate: farmerCandidates[index],
            );
          },
          separatorBuilder: (context, index) => const Divider(),
        );
      },
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error, stackTrace) => Center(
        child: Text('Error: $error'),
      ),
    );
  }
}

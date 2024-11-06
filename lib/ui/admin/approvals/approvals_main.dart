import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:local_roots_2/ui/admin/approvals/tab_farmer_candidates/candidates_main.dart';

import '../../common/app_name/app_name_main.dart';

class AdminApprovalsMain extends StatelessWidget {
  const AdminApprovalsMain({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 1,
      child: Scaffold(
        appBar: AppBar(
          title: const AppNameMain(),
          bottom: TabBar(
            tabs: [
              Tab(text: AppLocalizations.of(context)!.farmerCandidates),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            AdminApprovalsTabFarmerCandidates(),
          ],
        ),
      ),
    );
  }
}

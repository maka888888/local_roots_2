import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:jiffy/jiffy.dart';
import 'package:local_roots_2/constants/lists/categories.dart';
import 'package:local_roots_2/models/category_model.dart';
import 'package:local_roots_2/models/farmer_candidate_model.dart';

class AdminApprovalsTabFarmerCandidateScreen extends StatelessWidget {
  final FarmerCandidateModel farmerCandidate;
  const AdminApprovalsTabFarmerCandidateScreen(
      {super.key, required this.farmerCandidate});

  @override
  Widget build(BuildContext context) {
    List<CategoryModel> categories = generateCategoriesList(context);
    List<CategoryModel> farmerCategories = [];

    for (var category in categories) {
      if (farmerCandidate.categories.contains(category.id)) {
        farmerCategories.add(category);
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.candidateApplication),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            const SizedBox(height: 20),
            ListTile(
              title: Text(farmerCandidate.name),
              subtitle: Text(farmerCandidate.description),
            ),
            const Divider(),
            ListTile(
              title: Text(AppLocalizations.of(context)!.contacts),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(farmerCandidate.email),
                  Text(farmerCandidate.phone),
                ],
              ),
            ),
            const Divider(),
            ListTile(
              title: Text(AppLocalizations.of(context)!.address),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(farmerCandidate.street),
                  Text(farmerCandidate.city),
                  Text(farmerCandidate.country),
                ],
              ),
            ),
            const Divider(),
            ListTile(
              title: Text(AppLocalizations.of(context)!.categories),
              subtitle: ListView.builder(
                  itemCount: farmerCategories.length,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return Row(
                      children: [
                        Icon(farmerCategories[index].iconData, size: 15),
                        const SizedBox(width: 10),
                        Text(farmerCategories[index].nameTranslated),
                      ],
                    );
                  }),
            ),
            const Divider(),
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
              ),
              itemCount: farmerCandidate.certificatesPhotos.length,
              itemBuilder: (context, index) {
                return Image.network(farmerCandidate.certificatesPhotos[index]);
              },
            ),
            const Divider(),
            ListTile(
              title: Text(AppLocalizations.of(context)!.createdAt),
              subtitle: Text(Jiffy.parseFromDateTime(farmerCandidate.createdAt)
                  .yMMMMEEEEdjm),
            ),
          ],
        ),
      ),
    );
  }
}

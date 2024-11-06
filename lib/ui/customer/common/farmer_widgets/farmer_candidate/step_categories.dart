import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:local_roots_2/constants/lists/categories.dart';
import 'package:local_roots_2/models/category_model.dart';
import 'package:local_roots_2/models/farmer_candidate_model.dart';
import 'package:local_roots_2/providers/customer/farmer_candidate/farmer_candidate.dart';

import '../../../../common/form_control_buttons/back_stateless/back_stateless_main.dart';
import '../../../../common/form_control_buttons/next_statefull/next_statefull_main.dart';
import 'farmer_candidate_main.dart';

class CustomerFarmerCandidateStepCategories extends ConsumerStatefulWidget {
  final double progress;
  const CustomerFarmerCandidateStepCategories(
      {super.key, required this.progress});

  @override
  CustomerFarmerCandidateStepCategoriesState createState() =>
      CustomerFarmerCandidateStepCategoriesState();
}

class CustomerFarmerCandidateStepCategoriesState
    extends ConsumerState<CustomerFarmerCandidateStepCategories> {
  late FarmerCandidateModel _farmerCandidate;
  final _formKey = GlobalKey<FormBuilderState>();

  @override
  void initState() {
    super.initState();
    _farmerCandidate = ref.read(refCustomerFarmerCandidateProvider);
  }

  _back() {
    setState(() {
      _farmerCandidate.step = FarmerCandidateStep.address;
    });
    ref
        .read(refCustomerFarmerCandidateProvider.notifier)
        .updateCustomerFarmerCandidate(_farmerCandidate);
  }

  _save() {
    setState(() {
      _farmerCandidate.step = FarmerCandidateStep.experience;
    });
    ref
        .read(refCustomerFarmerCandidateProvider.notifier)
        .updateCustomerFarmerCandidate(_farmerCandidate);
  }

  @override
  Widget build(BuildContext context) {
    List<CategoryModel> categories = generateCategoriesList(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.candidateApplication),
        actions: [
          TextButton(
            onPressed: () {
              _back();
            },
            child: const FormControlButtonBack(),
          ),
          TextButton(
            onPressed: () async {
              if (_formKey.currentState!.validate()) {
                await _save();
              }
            },
            child: const FormControlButtonNextState(isSaving: false),
          ),
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(4),
          child: LinearProgressIndicator(
            value: widget.progress,
          ),
        ),
      ),
      body: FormBuilder(
        key: _formKey,
        child: Column(
          children: [
            const SizedBox(height: 40),
            FormBuilderCheckboxGroup(
              name: "categories",
              initialValue: _farmerCandidate.categories,
              options: categories
                  .map(
                    (category) => FormBuilderFieldOption(
                      value: category.id,
                      child: Text(category.nameTranslated),
                    ),
                  )
                  .toList(),
              onChanged: (value) {
                setState(() {
                  _farmerCandidate.categories = value as List<String>;
                });
              },
              decoration: InputDecoration(
                labelText: AppLocalizations.of(context)!.whatCategoriesYouOffer,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

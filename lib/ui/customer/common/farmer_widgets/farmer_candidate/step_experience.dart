import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:local_roots_2/models/farmer_candidate_model.dart';
import 'package:local_roots_2/providers/customer/farmer_candidate/farmer_candidate.dart';

import '../../../../common/form_control_buttons/back_stateless/back_stateless_main.dart';
import '../../../../common/form_control_buttons/next_statefull/next_statefull_main.dart';
import 'farmer_candidate_main.dart';

class CustomerFarmerCandidateStepExperience extends ConsumerStatefulWidget {
  final double progress;
  const CustomerFarmerCandidateStepExperience(
      {super.key, required this.progress});

  @override
  CustomerFarmerCandidateStepExperienceState createState() =>
      CustomerFarmerCandidateStepExperienceState();
}

class CustomerFarmerCandidateStepExperienceState
    extends ConsumerState<CustomerFarmerCandidateStepExperience> {
  late FarmerCandidateModel _farmerCandidate;
  final _formKey = GlobalKey<FormBuilderState>();

  @override
  void initState() {
    super.initState();
    _farmerCandidate = ref.read(refCustomerFarmerCandidateProvider);
  }

  _back() {
    setState(() {
      _farmerCandidate.step = FarmerCandidateStep.categories;
    });
    ref
        .read(refCustomerFarmerCandidateProvider.notifier)
        .updateCustomerFarmerCandidate(_farmerCandidate);
  }

  _save() {
    setState(() {
      _farmerCandidate.step = FarmerCandidateStep.certificates;
    });
    ref
        .read(refCustomerFarmerCandidateProvider.notifier)
        .updateCustomerFarmerCandidate(_farmerCandidate);
  }

  @override
  Widget build(BuildContext context) {
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
            FormBuilderSlider(
              name: 'yearsExperience',
              initialValue: _farmerCandidate.yearsExperience.toDouble(),
              min: 0,
              max: 15,
              divisions: 15,
              onChanged: (value) {
                setState(() {
                  _farmerCandidate.yearsExperience = value?.toInt() ?? 0;
                });
              },
              decoration: InputDecoration(
                labelText:
                    AppLocalizations.of(context)!.howManyYearsDoingBusiness,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

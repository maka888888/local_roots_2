import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:local_roots_2/models/farmer_candidate_model.dart';
import 'package:local_roots_2/providers/customer/farmer_candidate/farmer_candidate.dart';

import '../../../../common/form_control_buttons/back_stateless/back_stateless_main.dart';
import '../../../../common/form_control_buttons/next_statefull/next_statefull_main.dart';
import 'farmer_candidate_main.dart';

class CustomerFarmerCandidateStepDescription extends ConsumerStatefulWidget {
  final double progress;
  const CustomerFarmerCandidateStepDescription(
      {super.key, required this.progress});

  @override
  CustomerFarmerCandidateStepDescriptionState createState() =>
      CustomerFarmerCandidateStepDescriptionState();
}

class CustomerFarmerCandidateStepDescriptionState
    extends ConsumerState<CustomerFarmerCandidateStepDescription> {
  late FarmerCandidateModel _farmerCandidate;
  final _formKey = GlobalKey<FormBuilderState>();
  bool _isSaving = false;

  @override
  void initState() {
    super.initState();
    _farmerCandidate = ref.read(refCustomerFarmerCandidateProvider);
  }

  _back() {
    setState(() {
      _farmerCandidate.step = FarmerCandidateStep.certificates;
    });
    ref
        .read(refCustomerFarmerCandidateProvider.notifier)
        .updateCustomerFarmerCandidate(_farmerCandidate);
  }

  Future _save() async {
    setState(() {
      _isSaving = true;
    });
    await ref
        .read(refCustomerFarmerCandidateProvider.notifier)
        .saveCustomerFarmerCandidate(_farmerCandidate);

    Navigator.pop(context);

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(AppLocalizations.of(context)!.yourApplicationSent),
      ),
    );
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
            child: FormControlButtonNextState(isSaving: _isSaving),
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
            FormBuilderTextField(
              name: 'description',
              initialValue: _farmerCandidate.description,
              maxLines: 8,
              minLines: 5,
              decoration: InputDecoration(
                labelText: '${AppLocalizations.of(context)!.description}*',
              ),
              validator: FormBuilderValidators.compose([
                FormBuilderValidators.required(),
                FormBuilderValidators.minLength(10),
                FormBuilderValidators.maxLength(500),
              ]),
              onChanged: (value) {
                setState(() {
                  _farmerCandidate.description = value!;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}

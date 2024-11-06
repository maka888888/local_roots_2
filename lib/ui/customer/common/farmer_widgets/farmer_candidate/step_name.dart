import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:local_roots_2/models/farmer_candidate_model.dart';
import 'package:local_roots_2/providers/customer/farmer_candidate/farmer_candidate.dart';

import '../../../../common/form_control_buttons/next_stateless/next_stateles_main.dart';
import 'farmer_candidate_main.dart';

class CustomerFarmerCandidateStepName extends ConsumerStatefulWidget {
  final double progress;
  const CustomerFarmerCandidateStepName({super.key, required this.progress});

  @override
  CustomerFarmerCandidateStepNameState createState() =>
      CustomerFarmerCandidateStepNameState();
}

class CustomerFarmerCandidateStepNameState
    extends ConsumerState<CustomerFarmerCandidateStepName> {
  late FarmerCandidateModel _farmerCandidate;
  final _formKey = GlobalKey<FormBuilderState>();

  @override
  void initState() {
    super.initState();
    _farmerCandidate = ref.read(refCustomerFarmerCandidateProvider);
  }

  _save() {
    setState(() {
      _farmerCandidate.step = FarmerCandidateStep.address;
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
              if (_formKey.currentState!.validate()) {
                _save();
              }
            },
            child: const FormControlButtonNext(),
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
              name: 'name',
              initialValue: _farmerCandidate.name,
              decoration: InputDecoration(
                labelText: '${AppLocalizations.of(context)!.farmName}*',
              ),
              onChanged: (value) {
                setState(() {
                  _farmerCandidate.name = value!;
                });
              },
              maxLength: 80,
              textCapitalization: TextCapitalization.words,
              validator: FormBuilderValidators.compose([
                FormBuilderValidators.required(),
                FormBuilderValidators.minLength(5),
              ]),
            ),
            const SizedBox(height: 20),
            FormBuilderTextField(
              name: 'email',
              initialValue: _farmerCandidate.email,
              decoration: InputDecoration(
                labelText: '${AppLocalizations.of(context)!.email}*',
              ),
              keyboardType: TextInputType.emailAddress,
              onChanged: (value) {
                setState(() {
                  _farmerCandidate.email = value!;
                });
              },
              validator: FormBuilderValidators.compose([
                FormBuilderValidators.required(),
                FormBuilderValidators.email(),
              ]),
            ),
            const SizedBox(height: 20),
            FormBuilderTextField(
              name: 'phone',
              initialValue: _farmerCandidate.phone,
              decoration: InputDecoration(
                labelText: '${AppLocalizations.of(context)!.phone}*',
              ),
              keyboardType: TextInputType.phone,
              onChanged: (value) {
                setState(() {
                  _farmerCandidate.phone = value!;
                });
              },
              validator: FormBuilderValidators.compose([
                FormBuilderValidators.required(),
                FormBuilderValidators.numeric(),
              ]),
            ),
          ],
        ),
      ),
    );
  }
}

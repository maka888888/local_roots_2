import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:local_roots_2/models/farmer_model.dart';
import 'package:local_roots_2/providers/farmer/onboarding/farmer_onboarding.dart';
import 'package:local_roots_2/ui/common/form_control_buttons/next_statefull/next_statefull_main.dart';

import '../../common/form_control_buttons/back_stateless/back_stateless_main.dart';
import 'onboarding_main.dart';

class FarmerOnboardingStepCompany extends ConsumerStatefulWidget {
  final double progress;
  const FarmerOnboardingStepCompany({super.key, required this.progress});

  @override
  FarmerOnboardingStepCompanyState createState() =>
      FarmerOnboardingStepCompanyState();
}

class FarmerOnboardingStepCompanyState
    extends ConsumerState<FarmerOnboardingStepCompany> {
  late FarmerModel _farmer;
  final _formKey = GlobalKey<FormBuilderState>();

  @override
  void initState() {
    super.initState();
    _farmer = ref.read(refFarmerOnboardingProvider);
  }

  _back() {
    setState(() {
      _farmer.onboardingStep = FarmerOnboardingStep.name;
    });
    ref.read(refFarmerOnboardingProvider.notifier).updateFarmer(_farmer);
  }

  _save() {
    setState(() {
      _farmer.onboardingStep = FarmerOnboardingStep.address;
    });
    ref.read(refFarmerOnboardingProvider.notifier).updateFarmer(_farmer);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.farmerOnboarding),
        actions: [
          TextButton(
            onPressed: () {
              _back();
            },
            child: const FormControlButtonBack(),
          ),
          TextButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                _save();
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
            FormBuilderTextField(
              name: 'companyId',
              initialValue: _farmer.companyId,
              decoration: InputDecoration(
                labelText: AppLocalizations.of(context)!.companyID,
              ),
              onChanged: (value) {
                setState(() {
                  _farmer.companyId = value!;
                });
              },
              maxLength: 20,
              textCapitalization: TextCapitalization.characters,
            ),
            const SizedBox(height: 20),
            FormBuilderTextField(
              name: 'vatId',
              initialValue: _farmer.vatId,
              decoration: InputDecoration(
                labelText: AppLocalizations.of(context)!.vatID,
              ),
              keyboardType: TextInputType.text,
              onChanged: (value) {
                setState(() {
                  _farmer.vatId = value!;
                });
              },
              maxLength: 20,
              textCapitalization: TextCapitalization.characters,
            ),
          ],
        ),
      ),
    );
  }
}

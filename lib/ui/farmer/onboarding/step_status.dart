import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:local_roots_2/models/farmer_model.dart';
import 'package:local_roots_2/providers/farmer/onboarding/farmer_onboarding.dart';
import 'package:local_roots_2/ui/common/form_control_buttons/next_statefull/next_statefull_main.dart';

import '../../common/form_control_buttons/back_stateless/back_stateless_main.dart';
import 'onboarding_main.dart';

class FarmerOnboardingStepStatus extends ConsumerStatefulWidget {
  final double progress;
  const FarmerOnboardingStepStatus({super.key, required this.progress});

  @override
  FarmerOnboardingStepStatusState createState() =>
      FarmerOnboardingStepStatusState();
}

class FarmerOnboardingStepStatusState
    extends ConsumerState<FarmerOnboardingStepStatus> {
  late FarmerModel _farmer;
  final _formKey = GlobalKey<FormBuilderState>();
  bool _isSaving = false;

  @override
  void initState() {
    super.initState();
    _farmer = ref.read(refFarmerOnboardingProvider);
  }

  _back() {
    setState(() {
      _farmer.onboardingStep = FarmerOnboardingStep.description;
    });
    ref.read(refFarmerOnboardingProvider.notifier).updateFarmer(_farmer);
  }

  Future _save() async {
    setState(() {
      _isSaving = true;
    });
    await ref.read(refFarmerOnboardingProvider.notifier).saveFarmer(_farmer);
    // setState(() {
    //   _isSaving = false;
    // });
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
            FormBuilderSwitch(
              name: 'isActive',
              title: Text('${AppLocalizations.of(context)!.profileIsActive}?'),
              initialValue: _farmer.isActive,
              onChanged: (value) {
                setState(() {
                  _farmer.isActive = value!;
                });
              },
            )
          ],
        ),
      ),
    );
  }
}

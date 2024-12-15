import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:local_roots_2/models/farmer_model.dart';
import 'package:local_roots_2/providers/farmer/onboarding/farmer_onboarding.dart';
import 'package:local_roots_2/ui/common/form_control_buttons/next_statefull/next_statefull_main.dart';

import '../../common/form_control_buttons/back_stateless/back_stateless_main.dart';
import 'onboarding_main.dart';

class FarmerOnboardingStepExperience extends ConsumerStatefulWidget {
  final double progress;
  const FarmerOnboardingStepExperience({super.key, required this.progress});

  @override
  FarmerOnboardingStepExperienceState createState() =>
      FarmerOnboardingStepExperienceState();
}

class FarmerOnboardingStepExperienceState
    extends ConsumerState<FarmerOnboardingStepExperience> {
  late FarmerModel _farmer;
  final _formKey = GlobalKey<FormBuilderState>();

  @override
  void initState() {
    super.initState();
    _farmer = ref.read(refFarmerOnboardingProvider);
  }

  _back() {
    setState(() {
      _farmer.onboardingStep = FarmerOnboardingStep.certificates;
    });
    ref.read(refFarmerOnboardingProvider.notifier).updateFarmer(_farmer);
  }

  _save() {
    setState(() {
      _farmer.onboardingStep = FarmerOnboardingStep.description;
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
            FormBuilderDateTimePicker(
              name: 'inBusinessSince',
              initialValue: _farmer.inBusinessSince,
              inputType: InputType.date,
              format: DateFormat('yyyy-MM-dd'),
              decoration: InputDecoration(
                labelText: AppLocalizations.of(context)!.inBusinessSince,
              ),
              onChanged: (value) {
                setState(() {
                  _farmer.inBusinessSince = value!;
                });
              },
            ),
            // FormBuilderSlider(
            //   name: 'yearsExperience',
            //   initialValue: _farmer.yearsExperience.toDouble(),
            //   min: 0,
            //   max: 15,
            //   divisions: 15,
            //   onChanged: (value) {
            //     setState(() {
            //       _farmer.yearsExperience = value?.toInt() ?? 0;
            //     });
            //   },
            //   decoration: InputDecoration(
            //     labelText:
            //         AppLocalizations.of(context)!.howManyYearsDoingBusiness,
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}

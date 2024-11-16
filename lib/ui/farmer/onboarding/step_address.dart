import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:local_roots_2/models/farmer_model.dart';
import 'package:local_roots_2/providers/farmer/onboarding/farmer_onboarding.dart';
import 'package:local_roots_2/ui/common/form_control_buttons/next_statefull/next_statefull_main.dart';

import '../../../utils/geo.dart';
import '../../common/form_control_buttons/back_stateless/back_stateless_main.dart';
import 'onboarding_main.dart';

class FarmerOnboardingStepAddress extends ConsumerStatefulWidget {
  final double progress;
  const FarmerOnboardingStepAddress({super.key, required this.progress});

  @override
  FarmerOnboardingStepAddressState createState() =>
      FarmerOnboardingStepAddressState();
}

class FarmerOnboardingStepAddressState
    extends ConsumerState<FarmerOnboardingStepAddress> {
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
      _farmer.onboardingStep = FarmerOnboardingStep.company;
    });
    ref.read(refFarmerOnboardingProvider.notifier).updateFarmer(_farmer);
  }

  Future _save() async {
    setState(() {
      _isSaving = true;
    });

    LatLng? coordinates = await getCoordinatesFromAddress(
        '${_farmer.street}, ${_farmer.city}, ${_farmer.country}');

    if (coordinates != null) {
      setState(() {
        _farmer.latitude = coordinates.latitude;
        _farmer.longitude = coordinates.longitude;
      });
    }
    setState(() {
      _isSaving = false;
      _farmer.onboardingStep = FarmerOnboardingStep.mainPhoto;
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
              name: 'street',
              initialValue: _farmer.street,
              decoration: InputDecoration(
                labelText: '${AppLocalizations.of(context)!.street}*',
              ),
              onChanged: (value) {
                setState(() {
                  _farmer.street = value!;
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
              name: 'city',
              initialValue: _farmer.city,
              decoration: InputDecoration(
                labelText: '${AppLocalizations.of(context)!.city}*',
              ),
              onChanged: (value) {
                setState(() {
                  _farmer.city = value!;
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
              name: 'country',
              initialValue: _farmer.country,
              decoration: InputDecoration(
                labelText: '${AppLocalizations.of(context)!.country}*',
              ),
              onChanged: (value) {
                setState(() {
                  _farmer.country = value!;
                });
              },
              maxLength: 80,
              textCapitalization: TextCapitalization.words,
              validator: FormBuilderValidators.compose([
                FormBuilderValidators.required(),
                FormBuilderValidators.minLength(5),
              ]),
            ),
          ],
        ),
      ),
    );
  }
}

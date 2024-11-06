import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:local_roots_2/models/farmer_candidate_model.dart';
import 'package:local_roots_2/providers/customer/farmer_candidate/farmer_candidate.dart';

import '../../../../../utils/geo.dart';
import '../../../../common/form_control_buttons/back_stateless/back_stateless_main.dart';
import '../../../../common/form_control_buttons/next_statefull/next_statefull_main.dart';
import 'farmer_candidate_main.dart';

class CustomerFarmerCandidateStepAddress extends ConsumerStatefulWidget {
  final double progress;
  const CustomerFarmerCandidateStepAddress({super.key, required this.progress});

  @override
  CustomerFarmerCandidateStepAddressState createState() =>
      CustomerFarmerCandidateStepAddressState();
}

class CustomerFarmerCandidateStepAddressState
    extends ConsumerState<CustomerFarmerCandidateStepAddress> {
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
      _farmerCandidate.step = FarmerCandidateStep.name;
    });
    ref
        .read(refCustomerFarmerCandidateProvider.notifier)
        .updateCustomerFarmerCandidate(_farmerCandidate);
  }

  _save() async {
    setState(() {
      _isSaving = true;
    });

    LatLng? coordinates = await getCoordinatesFromAddress(
        '${_farmerCandidate.street}, ${_farmerCandidate.city}, ${_farmerCandidate.country}');

    if (coordinates != null) {
      setState(() {
        _farmerCandidate.latitude = coordinates.latitude;
        _farmerCandidate.longitude = coordinates.longitude;
      });
    }

    setState(() {
      _farmerCandidate.step = FarmerCandidateStep.categories;
      _isSaving = false;
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
              initialValue: _farmerCandidate.street,
              decoration: InputDecoration(
                labelText: '${AppLocalizations.of(context)!.street}*',
              ),
              onChanged: (value) {
                setState(() {
                  _farmerCandidate.street = value!;
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
              initialValue: _farmerCandidate.city,
              decoration: InputDecoration(
                labelText: '${AppLocalizations.of(context)!.city}*',
              ),
              onChanged: (value) {
                setState(() {
                  _farmerCandidate.city = value!;
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
              initialValue: _farmerCandidate.country,
              decoration: InputDecoration(
                labelText: '${AppLocalizations.of(context)!.country}*',
              ),
              onChanged: (value) {
                setState(() {
                  _farmerCandidate.country = value!;
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

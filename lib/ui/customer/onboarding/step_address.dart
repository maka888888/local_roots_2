import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:local_roots_2/models/customer_model.dart';

import '../../../providers/customer/new_customer/new_customer.dart';
import '../../../utils/geo.dart';
import '../../common/form_control_buttons/back_stateless/back_stateless_main.dart';
import '../../common/form_control_buttons/next_statefull/next_statefull_main.dart';
import 'onboarding_main.dart';

class CustomerOnboardingStepAddress extends ConsumerStatefulWidget {
  final double progress;
  const CustomerOnboardingStepAddress({super.key, required this.progress});

  @override
  CustomerOnboardingStepAddressState createState() =>
      CustomerOnboardingStepAddressState();
}

class CustomerOnboardingStepAddressState
    extends ConsumerState<CustomerOnboardingStepAddress> {
  late CustomerModel _customer;
  final _formKey = GlobalKey<FormBuilderState>();
  bool _isSaving = false;

  @override
  void initState() {
    super.initState();
    _customer = ref.read(refCustomerNewProvider);
  }

  _back() {
    setState(() {
      _customer.onboardingStep = CustomerOnboardingStep.photo;
    });
    ref
        .read(refCustomerNewProvider.notifier)
        .updateCustomerNew(_customer);
  }

  _save() async {
    setState(() {
      _isSaving = true;
    });

    LatLng? coordinates = await getCoordinatesFromAddress(
        '${_customer.street}, ${_customer.city}, ${_customer.country}');

    if (coordinates != null) {
      setState(() {
        _customer.latitude = coordinates.latitude;
        _customer.longitude = coordinates.longitude;
      });
    }

    setState(() {
      _customer.onboardingStep = CustomerOnboardingStep.rules;
      _isSaving = false;
    });

    ref
        .read(refCustomerNewProvider.notifier)
        .updateCustomerNew(_customer);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.registration),
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
              initialValue: _customer.street,
              decoration: InputDecoration(
                labelText: '${AppLocalizations.of(context)!.street}*',
              ),
              onChanged: (value) {
                setState(() {
                  _customer.street = value!;
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
              initialValue: _customer.city,
              decoration: InputDecoration(
                labelText: '${AppLocalizations.of(context)!.city}*',
              ),
              onChanged: (value) {
                setState(() {
                  _customer.city = value!;
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
              initialValue: _customer.country,
              decoration: InputDecoration(
                labelText: '${AppLocalizations.of(context)!.country}*',
              ),
              onChanged: (value) {
                setState(() {
                  _customer.country = value!;
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

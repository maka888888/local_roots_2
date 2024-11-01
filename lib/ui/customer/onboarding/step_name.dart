import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:local_roots_2/models/customer_model.dart';

import '../../../providers/customer/new_customer/new_customer.dart';
import '../../common/form_control_buttons/next_stateless/next_stateles_main.dart';
import 'onboarding_main.dart';

class CustomerOnboardingStepName extends ConsumerStatefulWidget {
  final double progress;
  const CustomerOnboardingStepName({super.key, required this.progress});

  @override
  CustomerOnboardingStepNameState createState() =>
      CustomerOnboardingStepNameState();
}

class CustomerOnboardingStepNameState
    extends ConsumerState<CustomerOnboardingStepName> {
  late CustomerModel _customer;
  final _formKey = GlobalKey<FormBuilderState>();

  @override
  void initState() {
    super.initState();
    _customer = ref.read(refCustomerNewProvider(false));
  }

  _save() {
    setState(() {
      _customer.onboardingStep = CustomerOnboardingStep.photo;
    });
    ref
        .read(refCustomerNewProvider(false).notifier)
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
              initialValue: _customer.name,
              decoration: InputDecoration(
                labelText: '${AppLocalizations.of(context)!.nameSurname}*',
                helperText:
                    AppLocalizations.of(context)!.thisNameWillBeSeenByFarmers,
              ),
              onChanged: (value) {
                setState(() {
                  _customer.name = value!;
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
              initialValue: _customer.email,
              decoration: InputDecoration(
                labelText: '${AppLocalizations.of(context)!.email}*',
              ),
              keyboardType: TextInputType.emailAddress,
              onChanged: (value) {
                setState(() {
                  _customer.email = value!;
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
              initialValue: _customer.phone,
              decoration: InputDecoration(
                labelText: '${AppLocalizations.of(context)!.phone}*',
              ),
              keyboardType: TextInputType.phone,
              onChanged: (value) {
                setState(() {
                  _customer.phone = value!;
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

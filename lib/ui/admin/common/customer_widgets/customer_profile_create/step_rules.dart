import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:local_roots_2/models/app_user_model.dart';
import 'package:local_roots_2/models/customer_model.dart';
import 'package:local_roots_2/ui/common/form_control_buttons/next_statefull/next_statefull_main.dart';

import '../../../../../providers/admin/app_users/app_users_services.dart';
import '../../../../../providers/customer/new_customer/new_customer.dart';
import '../../../../common/form_control_buttons/back_stateless/back_stateless_main.dart';
import '../../../../customer/onboarding/onboarding_main.dart';

class AdminCustomerOnboardingStepRules extends ConsumerStatefulWidget {
  final double progress;
  final AppUserModel appUser;
  const AdminCustomerOnboardingStepRules(
      {super.key, required this.progress, required this.appUser});

  @override
  AdminCustomerOnboardingStepRulesState createState() =>
      AdminCustomerOnboardingStepRulesState();
}

class AdminCustomerOnboardingStepRulesState
    extends ConsumerState<AdminCustomerOnboardingStepRules> {
  late CustomerModel _customer;
  final _formKey = GlobalKey<FormBuilderState>();
  bool _isSaving = false;

  @override
  void initState() {
    super.initState();
    _customer = ref.read(refCustomerNewProvider(true));
  }

  _back() {
    setState(() {
      _customer.onboardingStep = CustomerOnboardingStep.address;
    });
    ref
        .read(refCustomerNewProvider(true).notifier)
        .updateCustomerNew(_customer);
  }

  Future _save() async {
    setState(() {
      _isSaving = true;
    });
    AppUserModel appUser = widget.appUser;
    appUser.customer = _customer;

    await ServiceAdminAppUser().updateAppUser(appUser);
    Navigator.of(context).pop();
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
            FormBuilderCheckbox(
              name: 'acceptTerms',
              initialValue: false,
              title: Text('${AppLocalizations.of(context)!.acceptTerms}*'),
              validator: FormBuilderValidators.compose([
                FormBuilderValidators.required(),
                (value) {
                  if (value == false) {
                    return AppLocalizations.of(context)!.youMustAccept;
                  }
                  return null;
                },
              ]),
            ),
          ],
        ),
      ),
    );
  }
}

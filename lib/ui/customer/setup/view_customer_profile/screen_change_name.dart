import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:local_roots_2/models/app_user_model.dart';
import 'package:local_roots_2/models/customer_model.dart';
import 'package:local_roots_2/providers/common/app_user/app_user.dart';
import 'package:local_roots_2/providers/common/app_user/app_user_services.dart';

import '../../../common/form_control_buttons/save_text_button.dart';

class CustomerSetupCustomerProfileName extends ConsumerStatefulWidget {
  const CustomerSetupCustomerProfileName({super.key});

  @override
  CustomerSetupCustomerProfileNameState createState() =>
      CustomerSetupCustomerProfileNameState();
}

class CustomerSetupCustomerProfileNameState
    extends ConsumerState<CustomerSetupCustomerProfileName> {
  late CustomerModel _customer;
  final _formKey = GlobalKey<FormBuilderState>();
  bool _isSaving = false;

  @override
  void initState() {
    super.initState();

    _customer = ref.read(refAppUserProvider).value!.customer!;
  }

  Future _save() async {
    BuildContext context = this.context;

    setState(() {
      _isSaving = true;
    });
    AppUserModel appUser = ref.read(refAppUserProvider).value!;
    appUser.customer = _customer;

    await ServiceAppUser().updateAppUser(appUser).then(
      (value) {
        setState(() {
          _isSaving = false;
        });

        if (context.mounted) {
          Navigator.pop(context);
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.edit),
        actions: [
          TextButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                _save();
              }
            },
            child: FormControlButtonSaveState(isSaving: _isSaving),
          ),
        ],
      ),
      body: FormBuilder(
        key: _formKey,
        child: Column(
          children: [
            const SizedBox(height: 20),
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

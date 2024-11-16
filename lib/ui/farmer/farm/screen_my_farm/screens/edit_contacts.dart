import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:local_roots_2/models/app_user_model.dart';
import 'package:local_roots_2/models/farmer_model.dart';
import 'package:local_roots_2/ui/common/form_control_buttons/save_statefull/save_statefull_button.dart';

import '../../../../../providers/common/app_user/app_user_services.dart';

class FarmerFarmMyFarmEditContacts extends ConsumerStatefulWidget {
  final AppUserModel appUser;
  const FarmerFarmMyFarmEditContacts({super.key, required this.appUser});

  @override
  FarmerFarmMyFarmEditContactsState createState() =>
      FarmerFarmMyFarmEditContactsState();
}

class FarmerFarmMyFarmEditContactsState
    extends ConsumerState<FarmerFarmMyFarmEditContacts> {
  late FarmerModel _farmer;
  final _formKey = GlobalKey<FormBuilderState>();
  bool _isSaving = false;

  @override
  void initState() {
    super.initState();
    _farmer = widget.appUser.farmer!;
  }

  Future _save() async {
    BuildContext contextNav = context;

    setState(() {
      _isSaving = true;
    });

    AppUserModel appUser = widget.appUser;

    appUser.farmer = _farmer;

    await ServiceAppUser().updateAppUser(appUser);

    setState(() {
      _isSaving = false;
    });

    if (context.mounted) {
      Navigator.pop(contextNav);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.farmerOnboarding),
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
            const SizedBox(height: 40),
            FormBuilderTextField(
              name: 'email',
              initialValue: _farmer.email,
              decoration: InputDecoration(
                labelText: '${AppLocalizations.of(context)!.email}*',
              ),
              keyboardType: TextInputType.emailAddress,
              onChanged: (value) {
                setState(() {
                  _farmer.email = value!;
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
              initialValue: _farmer.phone,
              decoration: InputDecoration(
                labelText: '${AppLocalizations.of(context)!.phone}*',
              ),
              keyboardType: TextInputType.phone,
              onChanged: (value) {
                setState(() {
                  _farmer.phone = value!;
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

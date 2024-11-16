import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:local_roots_2/models/app_user_model.dart';
import 'package:local_roots_2/models/farmer_model.dart';
import 'package:local_roots_2/ui/common/form_control_buttons/save_statefull/save_statefull_button.dart';

import '../../../../../providers/common/app_user/app_user_services.dart';

class FarmerFarmMyFarmEditCompany extends ConsumerStatefulWidget {
  final AppUserModel appUser;
  const FarmerFarmMyFarmEditCompany({super.key, required this.appUser});

  @override
  FarmerFarmMyFarmEditCompanyState createState() =>
      FarmerFarmMyFarmEditCompanyState();
}

class FarmerFarmMyFarmEditCompanyState
    extends ConsumerState<FarmerFarmMyFarmEditCompany> {
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

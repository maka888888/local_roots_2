import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:local_roots_2/models/app_user_model.dart';
import 'package:local_roots_2/models/farmer_model.dart';
import 'package:local_roots_2/ui/common/form_control_buttons/save_statefull/save_statefull_button.dart';

import '../../../../../../../providers/common/app_user/app_user_services.dart';
import '../../farmer_screen_main.dart';

class AdminFarmMyFarmEditName extends ConsumerStatefulWidget {
  final AppUserModel appUser;
  const AdminFarmMyFarmEditName({super.key, required this.appUser});

  @override
  AdminFarmMyFarmEditNameState createState() => AdminFarmMyFarmEditNameState();
}

class AdminFarmMyFarmEditNameState
    extends ConsumerState<AdminFarmMyFarmEditName> {
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
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => AdminFarmer(appUser: appUser),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.farmerProfile),
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
              name: 'name',
              initialValue: _farmer.name,
              decoration: InputDecoration(
                labelText: '${AppLocalizations.of(context)!.farmName}*',
              ),
              onChanged: (value) {
                setState(() {
                  _farmer.name = value!;
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
              name: 'description',
              initialValue: _farmer.description,
              maxLines: 8,
              minLines: 5,
              decoration: InputDecoration(
                labelText: '${AppLocalizations.of(context)!.description}*',
              ),
              validator: FormBuilderValidators.compose([
                FormBuilderValidators.required(),
                FormBuilderValidators.minLength(10),
                FormBuilderValidators.maxLength(500),
              ]),
              onChanged: (value) {
                setState(() {
                  _farmer.description = value!;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}

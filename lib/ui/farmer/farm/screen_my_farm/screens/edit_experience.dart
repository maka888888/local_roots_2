import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:local_roots_2/models/app_user_model.dart';
import 'package:local_roots_2/models/farmer_model.dart';
import 'package:local_roots_2/ui/common/form_control_buttons/save_statefull/save_statefull_button.dart';

import '../../../../../providers/common/app_user/app_user_services.dart';

class FarmerFarmMyFarmEditExperience extends ConsumerStatefulWidget {
  final AppUserModel appUser;
  const FarmerFarmMyFarmEditExperience({super.key, required this.appUser});

  @override
  FarmerFarmMyFarmEditExperienceState createState() =>
      FarmerFarmMyFarmEditExperienceState();
}

class FarmerFarmMyFarmEditExperienceState
    extends ConsumerState<FarmerFarmMyFarmEditExperience> {
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
        title: Text(AppLocalizations.of(context)!.experience),
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
            // FormBuilderTextField(
            //   name: 'name',
            //   initialValue: _farmer.yearsExperience.toString(),
            //   keyboardType: TextInputType.number,
            //   decoration: InputDecoration(
            //     labelText:
            //         '${AppLocalizations.of(context)!.howManyYearsDoingBusiness}',
            //   ),
            //   onChanged: (value) {
            //     setState(() {
            //       _farmer.yearsExperience = int.tryParse(value!) ?? 0;
            //     });
            //   },
            // ),
          ],
        ),
      ),
    );
  }
}

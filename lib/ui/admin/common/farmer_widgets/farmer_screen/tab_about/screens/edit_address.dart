import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:local_roots_2/models/app_user_model.dart';
import 'package:local_roots_2/models/farmer_model.dart';
import 'package:local_roots_2/ui/common/form_control_buttons/save_statefull/save_statefull_button.dart';

import '../../../../../../../providers/common/app_user/app_user_services.dart';
import '../../../../../../../utils/geo.dart';
import '../../farmer_screen_main.dart';

class AdminFarmMyFarmEditAddress extends ConsumerStatefulWidget {
  final AppUserModel appUser;
  const AdminFarmMyFarmEditAddress({super.key, required this.appUser});

  @override
  AdminFarmMyFarmEditAddressState createState() =>
      AdminFarmMyFarmEditAddressState();
}

class AdminFarmMyFarmEditAddressState
    extends ConsumerState<AdminFarmMyFarmEditAddress> {
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

    LatLng? coordinates = await getCoordinatesFromAddress(
        '${_farmer.street}, ${_farmer.city}, ${_farmer.country}');

    if (coordinates != null) {
      setState(() {
        _farmer.latitude = coordinates.latitude;
        _farmer.longitude = coordinates.longitude;
      });
    }

    AppUserModel appUser = widget.appUser;

    appUser.farmer = _farmer;

    await ServiceAppUser().updateAppUser(appUser);

    setState(() {
      _isSaving = false;
    });

    if (context.mounted) {
      Navigator.pushReplacement(
        contextNav,
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

import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:local_roots_2/models/sales_location_model.dart';
import 'package:local_roots_2/providers/farmer/sales_location/sales_location_service.dart';
import 'package:local_roots_2/ui/common/form_control_buttons/save_statefull/save_statefull_button.dart';

import '../../../../../../utils/geo.dart';

class FarmerSalesLocationEditName extends ConsumerStatefulWidget {
  final SalesLocationModel salesLocation;
  const FarmerSalesLocationEditName({super.key, required this.salesLocation});

  @override
  FarmerSalesLocationEditNameState createState() =>
      FarmerSalesLocationEditNameState();
}

class FarmerSalesLocationEditNameState
    extends ConsumerState<FarmerSalesLocationEditName> {
  late SalesLocationModel _salesLocation;
  final _formKey = GlobalKey<FormBuilderState>();
  bool _isSaving = false;

  @override
  void initState() {
    super.initState();
    _salesLocation = widget.salesLocation;
  }

  Future _save() async {
    setState(() {
      _isSaving = true;
    });

    LatLng? coordinates = await getCoordinatesFromAddress(
        '${_salesLocation.street}, ${_salesLocation.city}, ${_salesLocation.country}');

    if (coordinates != null) {
      setState(() {
        _salesLocation.latitude = coordinates.latitude;
        _salesLocation.longitude = coordinates.longitude;
      });
    }

    await ServicesFarmerSalesLocation().updateSalesLocation(_salesLocation);

    setState(() {
      _isSaving = false;
    });

    Navigator.pop(context);
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
      body: SingleChildScrollView(
        child: FormBuilder(
          key: _formKey,
          child: Column(
            children: [
              const SizedBox(height: 40),
              FormBuilderTextField(
                name: 'name',
                initialValue: _salesLocation.name,
                decoration: InputDecoration(
                  labelText:
                      '${AppLocalizations.of(context)!.salesLocationName}*',
                ),
                onChanged: (value) {
                  setState(() {
                    _salesLocation.name = value!;
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
                name: 'street',
                initialValue: _salesLocation.street,
                decoration: InputDecoration(
                  labelText: '${AppLocalizations.of(context)!.street}*',
                ),
                onChanged: (value) {
                  setState(() {
                    _salesLocation.street = value!;
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
                initialValue: _salesLocation.city,
                decoration: InputDecoration(
                  labelText: '${AppLocalizations.of(context)!.city}*',
                ),
                onChanged: (value) {
                  setState(() {
                    _salesLocation.city = value!;
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
                initialValue: _salesLocation.country,
                decoration: InputDecoration(
                  labelText: '${AppLocalizations.of(context)!.country}*',
                ),
                onChanged: (value) {
                  setState(() {
                    _salesLocation.country = value!;
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
      ),
    );
  }
}

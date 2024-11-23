import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:local_roots_2/models/farmer_model.dart';
import 'package:local_roots_2/models/farmer_short_model.dart';
import 'package:local_roots_2/models/sales_location_model.dart';
import 'package:local_roots_2/providers/common/app_user/app_user.dart';
import 'package:local_roots_2/providers/farmer/sales_location/sales_location_new.dart';
import 'package:local_roots_2/ui/common/form_control_buttons/next_statefull/next_statefull_main.dart';
import 'package:local_roots_2/ui/farmer/common/sales_location_widgets/sales_location_new/sales_location_main.dart';

import '../../../../../utils/geo.dart';

class FarmerSalesLocationStepName extends ConsumerStatefulWidget {
  final double progress;
  const FarmerSalesLocationStepName({super.key, required this.progress});

  @override
  FarmerSalesLocationStepNameState createState() =>
      FarmerSalesLocationStepNameState();
}

class FarmerSalesLocationStepNameState
    extends ConsumerState<FarmerSalesLocationStepName> {
  late SalesLocationModel _salesLocation;
  late FarmerShortModel _farmerShort;
  final _formKey = GlobalKey<FormBuilderState>();
  bool _isSaving = false;

  @override
  void initState() {
    super.initState();

    _salesLocation = ref.read(refFarmerSalesLocationNewProvider);

    FarmerModel farmer = ref.read(refAppUserProvider).value!.farmer!;

    _farmerShort = FarmerShortModel(
      appUserId: farmer.appUserId,
      name: farmer.name,
      email: farmer.email,
      phone: farmer.phone,
      street: farmer.street,
      city: farmer.city,
      country: farmer.country,
      isApproved: farmer.isApproved,
      isActive: farmer.isActive,
      smallPhoto: farmer.smallPhoto,
    );

    _salesLocation.farmerAppUserId = farmer.appUserId;

    _salesLocation.farmerShort = _farmerShort;
  }

  _save() async {
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

    setState(() {
      _salesLocation.onboardingStep = SalesLocationNewStep.workingHours;
    });
    ref
        .read(refFarmerSalesLocationNewProvider.notifier)
        .updateSalesLocation(_salesLocation);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.newSalesLocation),
        actions: [
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

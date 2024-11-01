import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:local_roots_2/models/customer_model.dart';

import '../../../../models/app_user_model.dart';
import '../../../../providers/common/app_user/app_user.dart';
import '../../../../providers/common/app_user/app_user_services.dart';
import '../../../../utils/geo.dart';
import '../../../common/form_control_buttons/next_statefull/next_statefull_main.dart';

class CustomerSetupCustomerProfileAddress extends ConsumerStatefulWidget {
  const CustomerSetupCustomerProfileAddress({super.key});

  @override
  CustomerSetupCustomerProfileAddressState createState() =>
      CustomerSetupCustomerProfileAddressState();
}

class CustomerSetupCustomerProfileAddressState
    extends ConsumerState<CustomerSetupCustomerProfileAddress> {
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

    LatLng? coordinates = await getCoordinatesFromAddress(
        '${_customer.street}, ${_customer.city}, ${_customer.country}');

    if (coordinates != null) {
      setState(() {
        _customer.latitude = coordinates.latitude;
        _customer.longitude = coordinates.longitude;
      });
    }

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
            onPressed: () async {
              if (_formKey.currentState!.validate()) {
                await _save();
              }
            },
            child: FormControlButtonNextState(isSaving: _isSaving),
          ),
        ],
      ),
      body: FormBuilder(
        key: _formKey,
        child: Column(
          children: [
            const SizedBox(height: 20),
            FormBuilderTextField(
              name: 'street',
              initialValue: _customer.street,
              decoration: InputDecoration(
                labelText: '${AppLocalizations.of(context)!.street}*',
              ),
              onChanged: (value) {
                setState(() {
                  _customer.street = value!;
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
              initialValue: _customer.city,
              decoration: InputDecoration(
                labelText: '${AppLocalizations.of(context)!.city}*',
              ),
              onChanged: (value) {
                setState(() {
                  _customer.city = value!;
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
              initialValue: _customer.country,
              decoration: InputDecoration(
                labelText: '${AppLocalizations.of(context)!.country}*',
              ),
              onChanged: (value) {
                setState(() {
                  _customer.country = value!;
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

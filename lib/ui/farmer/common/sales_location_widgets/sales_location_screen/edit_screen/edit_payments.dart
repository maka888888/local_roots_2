import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:local_roots_2/models/sales_location_model.dart';
import 'package:local_roots_2/providers/farmer/sales_location/sales_location_service.dart';
import 'package:local_roots_2/ui/common/form_control_buttons/save_statefull/save_statefull_button.dart';

class FarmerSalesLocationEditPayments extends ConsumerStatefulWidget {
  final SalesLocationModel salesLocation;
  const FarmerSalesLocationEditPayments(
      {super.key, required this.salesLocation});

  @override
  FarmerSalesLocationEditPaymentsState createState() =>
      FarmerSalesLocationEditPaymentsState();
}

class FarmerSalesLocationEditPaymentsState
    extends ConsumerState<FarmerSalesLocationEditPayments> {
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
              const SizedBox(height: 20),
              FormBuilderCheckbox(
                name: 'paymentOptionsShow',
                title: Text(
                    AppLocalizations.of(context)!.showInfoAboutPaymentOptions),
                initialValue: _salesLocation.paymentOptionsShow,
                onChanged: (value) {
                  setState(() {
                    _salesLocation.paymentOptionsShow = value!;
                  });
                },
              ),
              FormBuilderCheckbox(
                name: 'acceptingCash',
                enabled: _salesLocation.paymentOptionsShow,
                title: Text(AppLocalizations.of(context)!.acceptingCash),
                initialValue: _salesLocation.paymentOptionsCash,
                onChanged: (value) {
                  setState(() {
                    _salesLocation.paymentOptionsCash = value!;
                  });
                },
              ),
              FormBuilderCheckbox(
                name: 'acceptingCards',
                enabled: _salesLocation.paymentOptionsShow,
                title: Text(AppLocalizations.of(context)!.acceptingCards),
                initialValue: _salesLocation.paymentOptionsCard,
                onChanged: (value) {
                  setState(() {
                    _salesLocation.paymentOptionsCard = value!;
                  });
                },
              ),
              FormBuilderCheckbox(
                name: 'paymentOptionsTransfer',
                enabled: _salesLocation.paymentOptionsShow,
                title: Text(AppLocalizations.of(context)!.acceptingTransfers),
                initialValue: _salesLocation.paymentOptionsTransfer,
                onChanged: (value) {
                  setState(() {
                    _salesLocation.paymentOptionsTransfer = value!;
                  });
                },
              ),
              const SizedBox(height: 10),
              FormBuilderTextField(
                name: 'paymentAccountNumber',
                enabled: _salesLocation.paymentOptionsTransfer &&
                    _salesLocation.paymentOptionsShow,
                initialValue: _salesLocation.paymentAccountNumber,
                decoration: InputDecoration(
                  labelText: AppLocalizations.of(context)!.accountNumber,
                  border: const OutlineInputBorder(),
                ),
                maxLength: 80,
                onChanged: (value) {
                  _salesLocation.paymentAccountNumber = value!;
                },
                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.iban(checkNullOrEmpty: false),
                ]),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}

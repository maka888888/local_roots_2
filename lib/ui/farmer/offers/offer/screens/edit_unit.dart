import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:local_roots_2/models/offer_model.dart';
import 'package:local_roots_2/providers/farmer/offer/offer_services.dart';
import 'package:local_roots_2/ui/common/form_control_buttons/save_statefull/save_statefull_button.dart';

import '../../../../../constants/lists/units.dart';
import '../../../../../models/unit_model.dart';
import '../offer_main.dart';

class FarmerOfferEditUnit extends ConsumerStatefulWidget {
  final OfferModel offer;
  const FarmerOfferEditUnit({super.key, required this.offer});

  @override
  FarmerOfferEditUnitState createState() => FarmerOfferEditUnitState();
}

class FarmerOfferEditUnitState extends ConsumerState<FarmerOfferEditUnit> {
  late OfferModel _offer;
  final _formKey = GlobalKey<FormBuilderState>();
  bool _isSaving = false;

  @override
  void initState() {
    super.initState();
    _offer = widget.offer;
  }

  Future _save() async {
    BuildContext contextNav = context;

    setState(() {
      _isSaving = true;
    });

    await ServicesFarmerOffer().updateOffer(_offer);

    setState(() {
      _isSaving = false;
    });

    if (context.mounted) {
      Navigator.pushReplacement(
        contextNav,
        MaterialPageRoute(
          builder: (context) => FarmerOffer(offer: _offer),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final List<UnitModel> units = generateUnitsList(context);

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
              FormBuilderDropdown(
                name: 'unit',
                initialValue: _offer.unit,
                items: units
                    .map(
                      (unit) => DropdownMenuItem(
                        value: unit.id,
                        child: Text(unit.nameTranslated),
                      ),
                    )
                    .toList(),
                onChanged: (value) {
                  setState(() {
                    _offer.unit = value.toString();
                  });
                },
                validator: FormBuilderValidators.required(),
                decoration: InputDecoration(
                    labelText: AppLocalizations.of(context)!.unit),
              ),
              const SizedBox(height: 20),
              FormBuilderTextField(
                name: 'unitHeight',
                initialValue: _offer.heightCm.toString(),
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: AppLocalizations.of(context)!.unitHeight,
                  suffixText: 'cm',
                ),
                onChanged: (value) {
                  setState(() {
                    _offer.heightCm = int.tryParse(value!) ?? 0;
                  });
                },
                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.required(),
                  FormBuilderValidators.min(0),
                  FormBuilderValidators.max(1000),
                ]),
              ),
              const SizedBox(height: 20),
              FormBuilderTextField(
                name: 'unitWidth',
                initialValue: _offer.widthCm.toString(),
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: AppLocalizations.of(context)!.unitWidth,
                  suffixText: 'cm',
                ),
                onChanged: (value) {
                  setState(() {
                    _offer.widthCm = int.tryParse(value!) ?? 0;
                  });
                },
                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.required(),
                  FormBuilderValidators.min(0),
                  FormBuilderValidators.max(1000),
                ]),
              ),
              const SizedBox(height: 20),
              FormBuilderTextField(
                name: 'unitLength',
                initialValue: _offer.lengthCm.toString(),
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: AppLocalizations.of(context)!.unitDepth,
                  suffixText: 'cm',
                ),
                onChanged: (value) {
                  setState(() {
                    _offer.lengthCm = int.tryParse(value!) ?? 0;
                  });
                },
                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.required(),
                  FormBuilderValidators.min(0),
                  FormBuilderValidators.max(1000),
                ]),
              ),
              const SizedBox(height: 20),
              FormBuilderTextField(
                name: 'unitWeight',
                initialValue: _offer.weightG.toString(),
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: AppLocalizations.of(context)!.unitWeight,
                  suffixText: 'g',
                ),
                onChanged: (value) {
                  setState(() {
                    _offer.weightG = int.tryParse(value!) ?? 0;
                  });
                },
                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.required(),
                  FormBuilderValidators.min(0),
                  FormBuilderValidators.max(10000),
                ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

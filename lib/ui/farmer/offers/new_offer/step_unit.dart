import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:local_roots_2/constants/lists/units.dart';
import 'package:local_roots_2/models/offer_model.dart';
import 'package:local_roots_2/models/unit_model.dart';
import 'package:local_roots_2/ui/common/form_control_buttons/next_statefull/next_statefull_main.dart';

import '../../../../providers/farmer/offer/offer_new.dart';
import '../../../common/form_control_buttons/back_stateless/back_stateless_main.dart';
import 'offer_new_main.dart';

class FarmerOfferStepUnit extends ConsumerStatefulWidget {
  final double progress;
  const FarmerOfferStepUnit({super.key, required this.progress});

  @override
  FarmerOfferStepUnitState createState() => FarmerOfferStepUnitState();
}

class FarmerOfferStepUnitState extends ConsumerState<FarmerOfferStepUnit> {
  late OfferModel _offer;
  final _formKey = GlobalKey<FormBuilderState>();

  @override
  void initState() {
    super.initState();

    _offer = ref.read(refFarmerOfferNewProvider);
  }

  _save() {
    setState(() {
      _offer.onboardingStep = FarmerOfferNewStep.price;
    });
    ref.read(refFarmerOfferNewProvider.notifier).updateOffer(_offer);
  }

  _back() {
    setState(() {
      _offer.onboardingStep = FarmerOfferNewStep.photos;
    });
    ref.read(refFarmerOfferNewProvider.notifier).updateOffer(_offer);
  }

  @override
  Widget build(BuildContext context) {
    final List<UnitModel> units = generateUnitsList(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.newOffer),
        actions: [
          TextButton(
            onPressed: () {
              _back();
            },
            child: const FormControlButtonBack(),
          ),
          TextButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                _save();
              }
            },
            child: const FormControlButtonNextState(isSaving: false),
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
                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.required(),
                ]),
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

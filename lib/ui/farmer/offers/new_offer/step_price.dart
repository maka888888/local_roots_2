import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:local_roots_2/constants/lists/currencies.dart';
import 'package:local_roots_2/models/currency_model.dart';
import 'package:local_roots_2/models/offer_model.dart';
import 'package:local_roots_2/ui/common/form_control_buttons/next_statefull/next_statefull_main.dart';

import '../../../../providers/farmer/offer/offer_new.dart';
import '../../../common/form_control_buttons/back_stateless/back_stateless_main.dart';
import 'offer_new_main.dart';

class FarmerOfferStepPrice extends ConsumerStatefulWidget {
  final double progress;
  const FarmerOfferStepPrice({super.key, required this.progress});

  @override
  FarmerOfferStepPriceState createState() => FarmerOfferStepPriceState();
}

class FarmerOfferStepPriceState extends ConsumerState<FarmerOfferStepPrice> {
  late OfferModel _offer;
  final _formKey = GlobalKey<FormBuilderState>();

  @override
  void initState() {
    super.initState();

    _offer = ref.read(refFarmerOfferNewProvider);
  }

  _save() {
    setState(() {
      _offer.onboardingStep = FarmerOfferNewStep.status;
    });
    ref.read(refFarmerOfferNewProvider.notifier).updateOffer(_offer);
  }

  _back() {
    setState(() {
      _offer.onboardingStep = FarmerOfferNewStep.unit;
    });
    ref.read(refFarmerOfferNewProvider.notifier).updateOffer(_offer);
  }

  @override
  Widget build(BuildContext context) {
    final List<CurrencyModel> currencies = generateCurrenciesList(context);

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
              FormBuilderTextField(
                name: 'price',
                initialValue: _offer.price.toString(),
                decoration: InputDecoration(
                  labelText: AppLocalizations.of(context)!.price,
                ),
                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.required(),
                  FormBuilderValidators.numeric(),
                  FormBuilderValidators.min(0),
                ]),
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  setState(() {
                    _offer.price = double.tryParse(value!) ?? 0;
                  });
                },
              ),
              const SizedBox(height: 20),
              FormBuilderDropdown(
                name: 'currency',
                initialValue: _offer.currency,
                items: currencies
                    .map(
                      (currency) => DropdownMenuItem(
                        value: currency.id,
                        child: Text(currency.nameTranslated),
                      ),
                    )
                    .toList(),
                onChanged: (value) {
                  setState(() {
                    _offer.currency = value.toString();
                  });
                },
                validator: FormBuilderValidators.required(),
                decoration: InputDecoration(
                  labelText: AppLocalizations.of(context)!.currency,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:local_roots_2/models/offer_model.dart';
import 'package:local_roots_2/providers/farmer/offer/offer_services.dart';
import 'package:local_roots_2/ui/common/form_control_buttons/save_statefull/save_statefull_button.dart';

import '../../../../../constants/lists/currencies.dart';
import '../../../../../models/currency_model.dart';
import '../offer_main.dart';

class FarmerOfferEditPrice extends ConsumerStatefulWidget {
  final OfferModel offer;
  const FarmerOfferEditPrice({super.key, required this.offer});

  @override
  FarmerOfferEditPriceState createState() => FarmerOfferEditPriceState();
}

class FarmerOfferEditPriceState extends ConsumerState<FarmerOfferEditPrice> {
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
    final List<CurrencyModel> currencies = generateCurrenciesList(context);

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

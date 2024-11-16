import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:local_roots_2/models/offer_model.dart';
import 'package:local_roots_2/providers/farmer/offer/offer_services.dart';
import 'package:local_roots_2/ui/common/form_control_buttons/save_statefull/save_statefull_button.dart';

import '../offer_main.dart';

class FarmerOfferEditDescription extends ConsumerStatefulWidget {
  final OfferModel offer;
  const FarmerOfferEditDescription({super.key, required this.offer});

  @override
  FarmerOfferEditDescriptionState createState() =>
      FarmerOfferEditDescriptionState();
}

class FarmerOfferEditDescriptionState
    extends ConsumerState<FarmerOfferEditDescription> {
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
                name: 'description',
                initialValue: _offer.description,
                maxLines: 8,
                minLines: 5,
                decoration: InputDecoration(
                  labelText: '${AppLocalizations.of(context)!.description}*',
                ),
                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.required(),
                  FormBuilderValidators.minLength(10),
                  FormBuilderValidators.maxLength(500),
                ]),
                onChanged: (value) {
                  setState(() {
                    _offer.description = value!;
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

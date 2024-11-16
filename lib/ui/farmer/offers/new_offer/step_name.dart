import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:local_roots_2/models/category_model.dart';
import 'package:local_roots_2/models/farmer_model.dart';
import 'package:local_roots_2/models/farmer_short_model.dart';
import 'package:local_roots_2/models/offer_model.dart';
import 'package:local_roots_2/providers/common/app_user/app_user.dart';
import 'package:local_roots_2/ui/common/form_control_buttons/next_statefull/next_statefull_main.dart';

import '../../../../constants/lists/categories.dart';
import '../../../../providers/farmer/offer/offer_new.dart';
import 'offer_new_main.dart';

class FarmerOfferStepName extends ConsumerStatefulWidget {
  final double progress;
  const FarmerOfferStepName({super.key, required this.progress});

  @override
  FarmerOfferStepNameState createState() => FarmerOfferStepNameState();
}

class FarmerOfferStepNameState extends ConsumerState<FarmerOfferStepName> {
  late OfferModel _offer;
  late FarmerShortModel _farmerShort;
  final _formKey = GlobalKey<FormBuilderState>();

  @override
  void initState() {
    super.initState();

    _offer = ref.read(refFarmerOfferNewProvider);

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

    _offer.farmerShort = _farmerShort;
  }

  _save() {
    setState(() {
      _offer.onboardingStep = FarmerOfferNewStep.description;
    });
    ref.read(refFarmerOfferNewProvider.notifier).updateOffer(_offer);
  }

  @override
  Widget build(BuildContext context) {
    List<CategoryModel> categories = generateCategoriesList(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.newOffer),
        actions: [
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
                name: 'name',
                initialValue: _offer.name,
                decoration: InputDecoration(
                  labelText: '${AppLocalizations.of(context)!.offerName}*',
                ),
                onChanged: (value) {
                  setState(() {
                    _offer.name = value!;
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
              FormBuilderRadioGroup(
                name: "categoriy",
                initialValue: _offer.category,
                options: categories
                    .map(
                      (category) => FormBuilderFieldOption(
                        value: category.id,
                        child: Text(category.nameTranslated),
                      ),
                    )
                    .toList(),
                onChanged: (value) {
                  setState(() {
                    _offer.category = value as String;
                  });
                },
                decoration: InputDecoration(
                  labelText: AppLocalizations.of(context)!.category,
                ),
                validator: FormBuilderValidators.required(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

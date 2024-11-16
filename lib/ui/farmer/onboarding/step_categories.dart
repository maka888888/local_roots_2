import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:local_roots_2/models/farmer_model.dart';
import 'package:local_roots_2/providers/farmer/onboarding/farmer_onboarding.dart';
import 'package:local_roots_2/ui/common/form_control_buttons/next_statefull/next_statefull_main.dart';

import '../../../constants/lists/categories.dart';
import '../../../models/category_model.dart';
import '../../common/form_control_buttons/back_stateless/back_stateless_main.dart';
import 'onboarding_main.dart';

class FarmerOnboardingStepCategories extends ConsumerStatefulWidget {
  final double progress;
  const FarmerOnboardingStepCategories({super.key, required this.progress});

  @override
  FarmerOnboardingStepCategoriesState createState() =>
      FarmerOnboardingStepCategoriesState();
}

class FarmerOnboardingStepCategoriesState
    extends ConsumerState<FarmerOnboardingStepCategories> {
  late FarmerModel _farmer;
  final _formKey = GlobalKey<FormBuilderState>();

  @override
  void initState() {
    super.initState();
    _farmer = ref.read(refFarmerOnboardingProvider);
  }

  _back() {
    setState(() {
      _farmer.onboardingStep = FarmerOnboardingStep.farmPhotos;
    });
    ref.read(refFarmerOnboardingProvider.notifier).updateFarmer(_farmer);
  }

  _save() {
    setState(() {
      _farmer.onboardingStep = FarmerOnboardingStep.certificates;
    });
    ref.read(refFarmerOnboardingProvider.notifier).updateFarmer(_farmer);
  }

  @override
  Widget build(BuildContext context) {
    List<CategoryModel> categories = generateCategoriesList(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.farmerOnboarding),
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
      body: FormBuilder(
        key: _formKey,
        child: Column(
          children: [
            const SizedBox(height: 40),
            FormBuilderCheckboxGroup(
              name: "categories",
              initialValue: _farmer.categories,
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
                  _farmer.categories = value as List<String>;
                });
              },
              decoration: InputDecoration(
                labelText: AppLocalizations.of(context)!.whatCategoriesYouOffer,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:local_roots_2/models/app_user_model.dart';
import 'package:local_roots_2/models/farmer_model.dart';
import 'package:local_roots_2/ui/common/form_control_buttons/save_statefull/save_statefull_button.dart';

import '../../../../../constants/lists/categories.dart';
import '../../../../../models/category_model.dart';
import '../../../../../providers/common/app_user/app_user_services.dart';

class FarmerFarmMyFarmEditCategories extends ConsumerStatefulWidget {
  final AppUserModel appUser;
  const FarmerFarmMyFarmEditCategories({super.key, required this.appUser});

  @override
  FarmerFarmMyFarmEditCategoriesState createState() =>
      FarmerFarmMyFarmEditCategoriesState();
}

class FarmerFarmMyFarmEditCategoriesState
    extends ConsumerState<FarmerFarmMyFarmEditCategories> {
  late FarmerModel _farmer;
  final _formKey = GlobalKey<FormBuilderState>();
  bool _isSaving = false;

  @override
  void initState() {
    super.initState();
    _farmer = widget.appUser.farmer!;
  }

  Future _save() async {
    BuildContext contextNav = context;

    setState(() {
      _isSaving = true;
    });

    AppUserModel appUser = widget.appUser;

    appUser.farmer = _farmer;

    await ServiceAppUser().updateAppUser(appUser);

    setState(() {
      _isSaving = false;
    });

    if (context.mounted) {
      Navigator.pop(contextNav);
    }
  }

  @override
  Widget build(BuildContext context) {
    List<CategoryModel> categories = generateCategoriesList(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.categories),
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

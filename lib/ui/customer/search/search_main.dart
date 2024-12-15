import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:local_roots_2/constants/screen_sizes.dart';
import 'package:local_roots_2/ui/customer/search/result_form.dart';

import '../../../constants/lists/categories.dart';
import '../../../models/category_model.dart';

class CustomerSearch extends StatefulWidget {
  const CustomerSearch({super.key});

  @override
  State<CustomerSearch> createState() => _CustomerSearchState();
}

class _CustomerSearchState extends State<CustomerSearch> {
  String _searchText = '';
  List<String> _selectedCategories = <String>[];
  final _formKey = GlobalKey<FormBuilderState>();

  @override
  void initState() {
    super.initState();
    // _searchText = '';
  }

  @override
  Widget build(BuildContext context) {
    final List<CategoryModel> categories = generateCategoriesList(context);

    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: ScreenSizes.smallScreen),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: FormBuilder(
            key: _formKey,
            child: ListView(
              children: [
                const SizedBox(
                  height: 20,
                ),
                FormBuilderTextField(
                  initialValue: _searchText,
                  name: 'searchText',
                  onChanged: (value) {
                    if (value != null && value.isNotEmpty) {
                      setState(() {
                        _searchText = value;
                      });
                    }
                  },
                  textCapitalization: TextCapitalization.words,
                  decoration: InputDecoration(
                    labelText: AppLocalizations.of(context)!.search,
                    prefixIcon: const Icon(Icons.search),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    suffixIcon: _searchText.isNotEmpty
                        ? IconButton(
                            onPressed: () {
                              setState(() {
                                _searchText = '';
                              });
                              //_formKey.currentState!.fields['search']!.reset();
                            },
                            icon: const Icon(Icons.clear),
                          )
                        : null,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                FormBuilderFilterChip(
                  name: 'categories',
                  decoration: InputDecoration(
                    labelText: AppLocalizations.of(context)!.categories,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  runSpacing: 5,
                  spacing: 5,
                  options: categories
                      .map(
                        (category) => FormBuilderChipOption(
                          value: category.id,
                          avatar: Icon(category.iconData),
                          child: Text(category.nameTranslated),
                        ),
                      )
                      .toList(),
                  onChanged: (value) {
                    if (value != null) {
                      setState(() {
                        _selectedCategories = value.cast<String>();
                      });
                    }
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomerSearchResult(
                  searchText: _searchText,
                  categories: _selectedCategories,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

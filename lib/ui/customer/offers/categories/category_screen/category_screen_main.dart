import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:local_roots_2/constants/lists/categories.dart';
import 'package:local_roots_2/models/category_model.dart';
import 'package:local_roots_2/providers/customer/farmer/farmes_by_category_get.dart';

import '../../../common/farmer_widgets/farmer_card_long/farmer_card_long_main.dart';

class CustomerCategoryScreen extends ConsumerWidget {
  final String category;
  const CustomerCategoryScreen({super.key, required this.category});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<CategoryModel> categories = generateCategoriesList(context);

    CategoryModel categoryModel =
        categories.firstWhere((element) => element.id == category);

    final farmers =
        ref.watch(refCustomerFarmersByCategoryGetProvider(category));

    return Scaffold(
      appBar: AppBar(
        title: Text(categoryModel.nameTranslated),
      ),
      body: farmers.when(
        data: (data) {
          return ListView.separated(
              itemCount: data.length,
              itemBuilder: (context, index) {
                return CustomerFarmerCardLong(farmer: data[index]);
              },
              separatorBuilder: (context, index) {
                return const Divider();
              });
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stack) => Center(child: Text('Error: $error')),
      ),
    );
  }
}

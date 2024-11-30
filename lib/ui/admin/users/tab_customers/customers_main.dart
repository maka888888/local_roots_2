import 'package:flutter/material.dart';
import 'package:local_roots_2/models/customer_model.dart';

import '../../common/customer_widgets/customer_tile/customer_tile_main.dart';

class AdminUsersTabCustomers extends StatelessWidget {
  final List<CustomerModel> customers;
  const AdminUsersTabCustomers({super.key, required this.customers});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        itemBuilder: (BuildContext context, int index) {
          return FarmerCustomerTile(customer: customers[index]);
        },
        separatorBuilder: (BuildContext context, int index) {
          return const Divider();
        },
        itemCount: customers.length);
  }
}

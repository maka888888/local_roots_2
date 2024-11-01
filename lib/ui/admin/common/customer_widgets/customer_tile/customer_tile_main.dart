import 'package:flutter/material.dart';
import 'package:local_roots_2/models/customer_model.dart';
import 'package:local_roots_2/ui/common/photos/photo_oval_small.dart';

class FarmerCustomerTile extends StatelessWidget {
  final CustomerModel customer;
  const FarmerCustomerTile({super.key, required this.customer});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: PhotoOvalSmall(photoUrl: customer.photoSmall),
      title: Text(customer.name),
      subtitle: Text(customer.city),
      trailing: const Icon(Icons.arrow_forward_ios),
      onTap: () {
        // Navigator.push(
        //   context,
        //   MaterialPageRoute(
        //     builder: (context) {
        //       return FarmerCustomerScreen(customer: customer);
        //     },
        //   ),
        // );
      },
    );
  }
}

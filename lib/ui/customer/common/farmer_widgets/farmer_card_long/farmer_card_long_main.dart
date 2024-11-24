import 'package:flutter/material.dart';
import 'package:local_roots_2/models/farmer_model.dart';
import 'package:local_roots_2/ui/common/photos/photo_oval_small.dart';
import 'package:local_roots_2/ui/customer/common/farmer_widgets/farmer_screen/farmer_screen_main.dart';

class CustomerFarmerCardLong extends StatelessWidget {
  final FarmerModel farmer;
  const CustomerFarmerCardLong({super.key, required this.farmer});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: PhotoOvalSmall(photoUrl: farmer.smallPhoto),
      title: Text(farmer.name),
      subtitle: Text(farmer.city),
      trailing: const Icon(Icons.arrow_forward_ios),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CustomerFarmer(farmerId: farmer.appUserId),
          ),
        );
      },
    );
  }
}

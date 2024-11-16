import 'package:flutter/material.dart';
import 'package:local_roots_2/models/farmer_model.dart';
import 'package:local_roots_2/ui/common/photos/photo_oval_small.dart';

class AdminFarmerCardLong extends StatelessWidget {
  final FarmerModel farmer;
  const AdminFarmerCardLong({super.key, required this.farmer});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: PhotoOvalSmall(photoUrl: farmer.smallPhoto),
      title: Text(farmer.name),
      subtitle: Text(farmer.city),
      trailing: const Icon(Icons.arrow_forward_ios),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:local_roots_2/ui/customer/setup/view_customer_profile/screen_change_address.dart';
import 'package:local_roots_2/ui/customer/setup/view_customer_profile/screen_change_name.dart';
import 'package:local_roots_2/ui/customer/setup/view_customer_profile/screen_change_photo.dart';

import '../../../../models/customer_model.dart';
import '../../../common/photos/photo_oval_large.dart';

class CustomerSetupCustomerProfileData extends StatelessWidget {
  final CustomerModel customer;
  const CustomerSetupCustomerProfileData({super.key, required this.customer});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(height: 20),
          Center(
            child: SizedBox(
              height: 120,
              width: 120,
              child: PhotoOvalLarge(photoUrl: customer.photoLarge),
            ),
          ),
          const SizedBox(height: 20),
          OutlinedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return const CustomerSetupCustomerProfilePhoto();
                  },
                ),
              );
            },
            child: Text(AppLocalizations.of(context)!.change),
          ),
          const SizedBox(height: 20),
          ListTile(
            title: Text(customer.name),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(customer.email),
                Text(customer.phone),
              ],
            ),
            trailing: IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return const CustomerSetupCustomerProfileName();
                    },
                  ),
                );
              },
              icon: const Icon(Icons.edit_outlined),
            ),
          ),
          const Divider(),
          ListTile(
            title: Text(AppLocalizations.of(context)!.address),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(customer.street),
                Text(customer.city),
                Text(customer.country),
              ],
            ),
            trailing: IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return const CustomerSetupCustomerProfileAddress();
                    },
                  ),
                );
              },
              icon: const Icon(Icons.edit_outlined),
            ),
          ),
          // const Divider(),
          // ListTile(
          //   title: Text(AppLocalizations.of(context)!.consents),
          //   subtitle: const Column(
          //     crossAxisAlignment: CrossAxisAlignment.start,
          //     children: [],
          //   ),
          //   trailing: IconButton(
          //     onPressed: () {},
          //     icon: const Icon(Icons.edit_outlined),
          //   ),
          // ),
        ],
      ),
    );
  }
}
